<template>
  <div>
    <h2>Find Landmarks</h2>
    <div id="landmarkHeader">
     Input your starting location: 
       
        <gmap-autocomplete id="autocomplete"
          placeholder="Starting Location"
          @place_changed="initMarker"
        ></gmap-autocomplete>
        </div>
      <label id="inputRadius" 
        >Input your desired search radius:
        <input 
          class="form-control input-sm"
          v-model="radius"
          type="number"
          placeholder="search radius"
        />
        <!-- Input your starting location: 
      
        <gmap-autocomplete
          placeholder="Starting Location"
          @place_changed="initMarker"
        ></gmap-autocomplete> -->
        </label>
        <button id="setButton" class="btn btn-secondary" @click="setStartingLocation">GO!</button>
        <p id="prompt">Current starting location is: </p><p id="startName">{{ startLocationName }}</p>
      
      
      <br />
    <!-- </div> -->
    
    <br />
    <div id="flex">
      <div id="left-panel">
        <p></p>
        <div
          v-for="(landmark, index) in landmarks"
          v-bind:key="landmark.id"
          id="list-view"
        >
          <button type="button" class="btn btn-dark" id="column-name" v-on:click="currentLandmark = index, setCenter(index)">
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
          <p id="pleaseSelectLandmark">Please select a landmark</p>
        </div>
        <div v-if="currentLandmark != -1">
          <p id = "rightHeader">{{ landmarks[currentLandmark].name }}</p>
          <p id="description">{{ landmarks[currentLandmark].description }}</p>
          <img :src="photos[currentLandmark].photoUrl" style="width:90%;" alt="" >
          <a v-bind:href="'/landmarks/' + landmarks[currentLandmark].landmarkId">
          Click to view details</a>
          
          <div id="itinlist">
          <button id="itinbtn" class= "btn btn-primary" v-on:click="updateItinerary(currentLandmark, selectedValue.split(':')[0] - 1)" > Add to Itinerary </button>

          <select class="custom-select" id="categories" v-model="selectedValue">
            <option v-for="(itinerary, index) in itineraries" v-bind:key="itinerary.id">{{index + 1}}: {{itinerary.itineraryName}}</option>
          </select>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import photoService from "../services/PhotoService.js";
import landmarkService from "../services/LandmarkService.js";
import itineraryService from "../services/ItineraryService.js";
//import { gmapApi } from "vue2-google-maps"; // IMPORT TO MANIPULATE GOOGLE MAPS OBJECT NOT SURE IF DOING SHIT
import { eventBus } from "@/event-bus.js";

export default {
  name: "AddGoogleMap",
  data() {
    return {
      radius: 0,
      itineraries: {},
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
      test: 0,

      locationMarkers: [],
      // filteredMarkers: [],
      locPlaces: [],
      existingPlace: null,
      //   empty landmarks array to be populated by axios call
      landmarks: [],
      currentLandmark: -1,
      zoom: 9.7,
      selectedValue: 0,
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

    hasLandmark(id, i) {
      if (this.itineraries[i].landmarkList == null) {
        return false;
      }
      var landmarks = this.itineraries[i].landmarkList;
      console.log(landmarks);
      return landmarks.includes("," + id + ",");
    },
    updateItinerary(id, i) {
      this.addLandmark = true;
      var input = this.itineraries[i].landmarkList + "," + id;
      var splitted = input.split(",");
      var collector = {};
      for (let i = 0; i < splitted.length; i++) {
        key = splitted[i].replace(/^\s*/, "").replace(/\s*$/, "");
        collector[key] = true;
      }
      var out = [];
      for (var key in collector) {
        out.push(key);
      }
      var output = out.join(",");
      const itinerary = {
        landmarkList: "," + output,
      };
      this.test = itinerary;
      itineraryService.updateItinerary(this.itineraries[i].itineraryId, itinerary);
      this.$router.go();
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
    itineraryService.getAllItineraries().then((response) => {
      this.itineraries = response.data;
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
@import url("https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@200&display=swap");
#prompt{
  text-align: center;
}
#autocomplete{
  overflow: hidden;
  border-radius: 5px;
}
input{
  max-width: 10rem;
  font-size: 1rem;
}
#inputRadius{
  font-size: 1.3rem;
  text-align: center;
display:flex;
justify-content: center;
margin-top:10px;
/* align-items: center; */
}
a{
  font-size: 1.3rem;
  margin-top: 15px;
  display: block;
}
img{
  border-radius: 8px;
}
#pleaseSelectLandmark{
  font-size: 1.5rem;
  width: 100%;
}
input{
  text-align: center;
  
}
.custom-select{
  max-width: 20rem;
  font-size: 1.4rem;
}
#itinlist{
  margin-top: 15px;
}
#itinbtn{
  font-size: 1.4rem;
  max-width: 12rem;
}
#description{
  font-size: 1.3rem;
  margin-bottom: 15px;
}
#startName{
  text-align: center;
  color:white;
  margin-bottom: -35px;
}
#setButton{
  display: flex;
  justify-content: center;
  letter-spacing: 3px;
  font-weight: bold;
  font-size: 1.3rem;
  margin-top: 20px;
  max-width: 5rem;
}
p{
  margin-top: 15px;
  margin-bottom: 5px;
}
h2{
  margin-top: 20px;
  text-align: center;
  color:#f03768;
  font-size: 3rem;
  text-shadow: 0px 0px 12px #ff006a;
  font-family: "Roboto Mono";
}
#landmarkHeader{
  font-size:1.3rem;
  text-align: center;
display:flex;
justify-content: center;
}
.btn-secondary, .btn-primary{
  margin: 3px 0;
  width: 100%;
}
.btn-dark{
  border: solid 1px;
 
  border-color: rgb(39, 39, 39);
  margin: 3px 0;
  width: 100%;
  border-radius: 10px;
}
.btn:hover{
  /* box-shadow: 0px 0px 10px rgb(255, 185, 255);  */
}
.btn-dark:focus{
  box-shadow: 0px 0px 8px rgb(255, 185, 255);
  color: rgb(253, 197, 234);
  /* text-decoration-color: rgb(255, 240, 250); */
  text-shadow: 0px 0px 10px rgb(255, 156, 255); 
  border: none;
}
#list-view{
  justify-content: center;
}
.map {
  z-index: 0; 
  flex-grow: 2;
  
  /* padding: 50;
  max-width: 45%;
  border-radius: 10px; */

  /* background: rgb(51, 54, 100); */
  border-radius: 25px;
  
  padding: 40px;
      align-items: center;

  
}

/* .gmap-map {
  z-index: -1;
 }  */

#mapBox {
  margin-top:60px;
  border: none;
  /* position:relative; */
    overflow:hidden;
  /* border-style: solid;
  border-color: #db4dff; */
  border-radius: 10px;
  /* box-shadow: 0px 0px 30px #db4dff; */
  z-index: 1;  
  justify-content: center;
  align-items: center;

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
  /* background: rgb(51, 54, 100); */
  border-radius: 25px;
  padding: 20px;
}

#left-panel {
  flex-grow: 1;
  max-width: 10%;
  margin-left: 50px;
  margin-right: 50px;
  background: rgb(51, 54, 100);
  border-radius: 25px;
  padding-left: 20px;
  padding-right: 20px;
  padding-bottom: 20px;
}

#rightHeader {
  font-size: 2em;
  color:#f03768;
}


</style>
