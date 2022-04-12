<template>
  <div>
    <div>
      <h2>Find Landmarks</h2>
      <h2>{{locationMarkers[0].position.lat}}</h2>
      <h2>{{startLocation.lat}}</h2>
      <label>
          <!-- prompts user for location -->
        <gmap-autocomplete @place_changed="initMarker"></gmap-autocomplete>
        <button @click="setStartingLocation">Add</button>
        
        <button @click="radiusSearch">Radius Test</button>
      </label>
      <br />
    </div>
    <br />
    <gmap-map :zoom="6" :center="center" style="width: 100%; height: 700px">
        <!-- loops through locationMarkers array to display markers on map -->
      <gmap-marker
        :key="index"
        v-for="(m, index) in locationMarkers"
        :position="m.position"
        @click="center = m.position"
      ></gmap-marker>
    </gmap-map>
  </div>
</template>
 
<script>
import landmarkService from "../services/LandmarkService.js";
import {gmapApi} from 'vue2-google-maps' // IMPORT TO MANIPULATE GOOGLE MAPS OBJECT NOT SURE IF DOING SHIT
import { eventBus } from '@/event-bus.js';
export default {
  name: "AddGoogleMap",
  data() {
    return {
      startLocation: {
      lat: 34.6691514,
      lng: 135.4327486,
    },
      center: {
        lat: 36.5605,
        lng: 138.88,
      },
      locationMarkers: [],
      filteredMarkers: [],
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
    filteredMarkers2 () {
      return this.locationMarkers.filter((marker) => {
        return this.compareDistance(this.startLocation, marker) < 100 ? true : false;
      })
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
    setStartingLocation () {
      if(this.existingPlace) {
        this.startLocation = {
          lat: this.existingPlace.geometry.location.lat(),
          lng: this.existingPlace.geometry.location.lng(),
        };
      }

    },

    compareDistance(mk1, mk2) {


      var R = 3958.8; // Radius of the Earth in miles
      var rlat1 = mk1.lat * (Math.PI/180); // Convert degrees to radians
      var rlat2 = mk2.position.lat * (Math.PI/180); // Convert degrees to radians
      var difflat = rlat2-rlat1; // Radian difference (latitudes)
      var difflon = (mk2.position.lng-mk1.lng) * (Math.PI/180); // Radian difference (longitudes)

      var d = 2 * R * Math.asin(Math.sqrt(Math.sin(difflat/2)*Math.sin(difflat/2)+Math.cos(rlat1)*Math.cos(rlat2)*Math.sin(difflon/2)*Math.sin(difflon/2)));
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

// TESTING CONSOLE OUTPUT TO SEE IF FUNCTION WORKING... IT'S NOT
    radiusSearch(){
      let acoord = new gmapApi.maps.LatLng(-36.874694, 174.735292);
      // let bcoord = new gmapApi.maps.LatLng(-36.858317, 174.782284);
      
      console.log(acoord);
    }
    

  
    

  },
//   axios call to get landmark JSON array
  created() {
    eventBus.$on('launchKeywordSearch', (payload) => {
      this.doKeywordSearch(payload);
    });
    this.locateGeoLocation();
      landmarkService.search().then((response) => {
      this.landmarks = response.data; // response data contains my JSON - array of homes that came back from the server
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
        lng: 139.7765215
    }
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