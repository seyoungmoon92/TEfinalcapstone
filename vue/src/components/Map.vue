<template>
  <div>
    <div>
      <h2>Find Landmarks</h2>
      <label
        >Input your desired search radius:
        <input
          class="form-control search_radius mb-4"
          v-model="radius"
          type="number"
          placeholder="search radius"
        />
        Input your starting location.
        <!-- prompts user for location -->
        <gmap-autocomplete
          placeholder="Starting Location"
          @place_changed="initMarker"
        ></gmap-autocomplete>
        <button @click="setStartingLocation">Set</button>
        <p>Current starting location is: {{ startLocationName }}</p>
      </label>
      <br />
    </div>
    <br />
    <div id="flex">
      <div id="left-panel">
        <p></p>
        <div
          v-for="(landmark, index) in landmarks"
          v-bind:key="landmark.id"
          id="list-view"
        >
          <button id="column-name" v-on:click="currentLandmark = index, setCenter(index)">
            {{ landmark.name }}
          </button>
        </div>
      </div>

      <div class="map">
        <div id="mapBox">
          <gmap-map
            :zoom="zoom"
            :center="center"
            style="width: 100%; height: 700px"
          >
            <!-- loops through locationMarkers array to display markers on map -->
            <gmap-marker
              :key="index"
              v-for="(m, index) in filteredMarkers"
              :position="m.position"
              @click="(center = m.position), (currentLandmark = index)"
            ></gmap-marker>
          </gmap-map>
        </div>
      </div>
      <div id="right-panel">
        <div v-if="currentLandmark == -1">
          <p>Please select a landmark</p>
        </div>
        <div v-if="currentLandmark != -1">
          <p id = "rightHeader">{{ landmarks[currentLandmark].name }}</p>
          <p>{{ landmarks[currentLandmark].description }}</p>
          <img :src="photos[currentLandmark].photoUrl" style="width:90%;" alt="">
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import photoService from "../services/PhotoService.js";
import landmarkService from "../services/LandmarkService.js";
//import { gmapApi } from "vue2-google-maps"; // IMPORT TO MANIPULATE GOOGLE MAPS OBJECT NOT SURE IF DOING SHIT
import { eventBus } from "@/event-bus.js";

export default {
  name: "AddGoogleMap",
  data() {
    return {
      radius: 5000,
      options: {
        strokeColor: "#FF0000",
        strokeOpacity: 0.8,
        strokeWeight: 2,
        fillColor: "#FF0000",
        fillOpacity: 0.35,
      },
      startLocation: {},
      startLocationName: "Not selected",
      center: {
        lat: 35.68321,
        lng: 139.808,
      },
      photos: [],
      test: [],

      locationMarkers: [],
      // filteredMarkers: [],
      locPlaces: [],
      existingPlace: null,
      //   empty landmarks array to be populated by axios call
      landmarks: [],
      currentLandmark: -1,
      zoom: 9.7
    };
  },
  //   filtered landmark array by ID, will need to change filter parameter
  computed: {
    filteredLandmarks() {
      return this.landmarks.filter((landmark) => {
        return this.idFilter == ""
          ? true
          : this.idFilter == landmark.landmarkId;
      });
    },
    filteredMarkers() {
      if (this.startLocationName == "Not selected") {
        return this.locationMarkers;
      }
      return this.locationMarkers.filter((marker) => {
        return this.compareDistance(this.startLocation, marker) <= this.radius
          ? true
          : false;
      });
    },
  },

  methods: {
    //   Works with google maps autocomplete function to find location
    initMarker(loc) {
      this.existingPlace = loc;
    },
    addMarker(marker) {
      this.test.push(marker);
      console.log("addMarker");
    },
    setCenter(marker){
        this.center = this.locationMarkers[marker].position;
        this.zoom = 14;
    },

    // if it exists it will add marker to map when you click add
    addLocationMarker() {
      if (this.existingPlace) {
        const marker = {
          lat: this.existingPlace.geometry.location.lat(),
          lng: this.existingPlace.geometry.location.lng(),
        };
        this.locationMarkers.push({ position: marker });
        this.locPlaces.push(this.existingPlace);
        this.center = marker;
        this.existingPlace = null;
      }
    },
    setStartingLocation() {
      if (this.existingPlace) {
        //Grabs the lat and lng of the entered address.
        this.startLocation = {
          lat: this.existingPlace.geometry.location.lat(),
          lng: this.existingPlace.geometry.location.lng(),
        };
        //Centers map on starting position
        this.center = this.startLocation;
        //Set the starting location text
        this.startLocationName = this.existingPlace.formatted_address;
      }
    },

    compareDistance(mk1, mk2) {
      var R = 3958.8; // Radius of the Earth in miles
      var rlat1 = mk1.lat * (Math.PI / 180); // Convert degrees to radians
      var rlat2 = mk2.position.lat * (Math.PI / 180); // Convert degrees to radians
      var difflat = rlat2 - rlat1; // Radian difference (latitudes)
      var difflon = (mk2.position.lng - mk1.lng) * (Math.PI / 180); // Radian difference (longitudes)

      var d =
        2 *
        R *
        Math.asin(
          Math.sqrt(
            Math.sin(difflat / 2) * Math.sin(difflat / 2) +
              Math.cos(rlat1) *
                Math.cos(rlat2) *
                Math.sin(difflon / 2) *
                Math.sin(difflon / 2)
          )
        );
      return d;
    },

    // if location is on it will default center to current location
    // locateGeoLocation: function() {
    //   navigator.geolocation.geocode({ address: `Tokyo` }, (results) => {
    //     this.center = {
    //       lat: results.coords.latitude,
    //       lng: results.coords.longitude,
    //     };
    // });
    // navigator.geolocation.geocode({address: `Tokyo`}(res) => {
    //   this.center = {
    //     lat: res.coords.latitude,
    //     lng: res.coords.longitude,
    //   };
    // };
    // },
  },
  //   axios call to get landmark JSON array
  created() {
    eventBus.$on("launchKeywordSearch", (payload) => {
      this.doKeywordSearch(payload);
    });
    photoService.search().then((response) => {
      this.photos = response.data;
    });
    //this.locateGeoLocation();
    landmarkService.search().then((response) => {
      this.landmarks = response.data;
    });
    this.setStartingLocation();
    // hardcoded coordinates for pre-existing markers
    const tokyoNatMuseum = {
      lat: 35.7188351,
      lng: 139.7765215,
    };
    const ghibli = {
      lat: 35.696238,
      lng: 139.5704317,
    };
    const sensoji = {
      lat: 35.71472,
      lng: 139.79675,
    };
    const ueno = {
      lat: 35.676506,
      lng: 139.80005,
    };
    const meiji = {
      lat: 35.67611,
      lng: 139.69917,
    };
    const skytree = {
      lat: 35.710083,
      lng: 139.8107,
    };
    const kabukiza = {
      lat: 35.669273,
      lng: 139.767563,
    };
    const tsukiji = {
      lat: 35.665371,
      lng: 139.770279,
    };
    const hachiko = {
      lat: 35.657982,
      lng: 139.698929,
    };
    const nakamise = {
      lat: 35.711094,
      lng: 139.796371,
    };

    const disney = {
      lat: 35.632778,
      lng: 139.880554,
    };
    const harajuku = {
      lat: 35.670162,
      lng: 139.702682,
    };
    const shinjuku = {
      lat: 35.687130,
      lng: 139.710617,
    };
    const dome = {
      lat: 35.705620,
      lng: 139.751900,
    };
    const edo = {
      lat: 35.696217,
      lng: 139.795944,
    };
    const mitake = {
      lat: 35.758290,
      lng: 139.132900,
    };
    const ryogoku = {
      lat: 35.692440,
      lng: 139.794400,
    };
    const sea = {
      lat: 35.640114,
      lng: 139.862167,
    };
    const nakano = {
      lat: 35.709171,
      lng: 139.666092,
    };
    const sengakuji = {
      lat: 35.637756,
      lng: 139.736298,
    };

    this.locationMarkers.push({ position: tokyoNatMuseum });
    this.locationMarkers.push({ position: ghibli });
    this.locationMarkers.push({ position: sensoji });
    this.locationMarkers.push({ position: ueno });
    this.locationMarkers.push({ position: meiji });
    this.locationMarkers.push({ position: skytree });
    this.locationMarkers.push({ position: kabukiza });
    this.locationMarkers.push({ position: tsukiji });
    this.locationMarkers.push({ position: hachiko });
    this.locationMarkers.push({ position: nakamise });

    this.locationMarkers.push({ position: disney });
    this.locationMarkers.push({ position: harajuku });
    this.locationMarkers.push({ position: shinjuku });
    this.locationMarkers.push({ position: dome });
    this.locationMarkers.push({ position: edo });
    this.locationMarkers.push({ position: mitake });
    this.locationMarkers.push({ position: ryogoku });
    this.locationMarkers.push({ position: sea });
    this.locationMarkers.push({ position: nakano });
    this.locationMarkers.push({ position: sengakuji });
  },
};
</script>

<style scoped>
.map {
  /* z-index: -1; */
  flex-grow: 2;
  
  padding: 50;
  max-width: 45%;
  
}

/* .gmap-map {
  z-index: -1;
 }  */

#mapBox {
  border-style: double;
  border-width: 12px;
  border-color: pink;
  border-radius: 10px;  
}

#flex {
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  align-items: stretch;
}

#right-panel {
  flex-grow: 1;
  max-width: 45%;
  text-align: center;
  margin-left: 50px;
  margin-right: 50px;
}

#left-panel {
  flex-grow: 1;
  max-width: 10%;
  margin-left: 50px;
  margin-right: 50px;
}

#rightHeader {
  font-size: 2em;
}


</style>
