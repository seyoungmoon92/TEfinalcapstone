<template>
  <div class="map">
    <div>
      <h2>Find Landmarks</h2>
      <label >Input your desired search radius: 
        <input
          class="form-control search_radius mb-4"
          v-model="radius"
          type="number"
          placeholder="search radius"
        />
        Input your starting location.
        <!-- prompts user for location -->
        <gmap-autocomplete placeholder="Starting Location" @place_changed="initMarker"></gmap-autocomplete>
        <button @click="setStartingLocation">Set</button> 
        <p>Current starting location is: {{startLocationName}} </p>
      </label>
      <br />
    </div>
    <br />
    <gmap-map :zoom="6" :center="center" style="width: 100%; height: 700px">
      <!-- Display circle with gmap circle -->
      <gmap-circle
        :center="this.startLocation"
        :options="{fillColor: 'green',fillOpacity:.1}"
        :radius="20000"
      >
      </gmap-circle>
      <!-- loops through locationMarkers array to display markers on map -->
      <gmap-marker
        :key="index"
        v-for="(m, index) in filteredMarkers"
        :position="m.position"
        @click="center = m.position"
      ></gmap-marker>
    </gmap-map>

  </div>




</template>
 
<script>
import landmarkService from "../services/LandmarkService.js";

import { gmapApi } from "vue2-google-maps"; // IMPORT TO MANIPULATE GOOGLE MAPS OBJECT NOT SURE IF DOING SHIT
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
      startLocation: {
       
      },
      startLocationName: 'Not selected',
      center: {
        lat: 36.5605,
        lng: 138.88,
      },

      locationMarkers: [],
      // filteredMarkers: [],
      locPlaces: [],
      existingPlace: null,
      //   empty landmarks array to be populated by axios call
      landmarks: [],



    };
  },
  //   filtered landmark array by ID, will need to change filter parameter
  computed: {
    google: gmapApi,
    filteredLandmarks() {
      return this.landmarks.filter((landmark) => {
        return this.idFilter == ""
          ? true
          : this.idFilter == landmark.landmarkId;
      });
    },
    filteredMarkers() {
      return this.locationMarkers.filter((marker) => {
        return this.compareDistance(this.startLocation, marker) <= (this.radius)
          ? true
          : false;
      });
    },




  


  },

  // Sets center location when loaded
  mounted() {
    this.locateGeoLocation();
  },

  methods: {




    //   Works with google maps autocomplete function to find location
    initMarker(loc) {
      this.existingPlace = loc;
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
    locateGeoLocation: function () {
      navigator.geolocation.getCurrentPosition((res) => {
        this.center = {
          lat: res.coords.latitude,
          lng: res.coords.longitude,
        };
      });
    },
  },
  //   axios call to get landmark JSON array
  created() {
    eventBus.$on("launchKeywordSearch", (payload) => {
      this.doKeywordSearch(payload);
    });
    this.locateGeoLocation();
    landmarkService.search().then((response) => {
      this.landmarks = response.data; 
    });

    // hardcoded coordinates for pre-existing markers

    const chureitoPagoda = {
      lat: 35.5012626,
      lng: 138.8013852,
    };
    const ghibli = {
      lat: 35.696238,
      lng: 139.5704317,
    };
    const fushimiInariShrine = {
      lat: 34.9671402,
      lng: 135.7726717,
    };
    const tokyoNatMuseum = {
      lat: 35.7188351,
      lng: 139.7765215,
    };
    const univStudioJapan = {
      lat: 34.6691514,
      lng: 135.4327486,
    };

    this.locationMarkers.push({ position: chureitoPagoda });
    this.locationMarkers.push({ position: ghibli });
    this.locationMarkers.push({ position: fushimiInariShrine });
    this.locationMarkers.push({ position: tokyoNatMuseum });
    this.locationMarkers.push({ position: univStudioJapan });
  },
};
</script>



<style scoped>
.map {
  z-index: -1;
}

.gmap-map {
  z-index: -1;
}
</style>