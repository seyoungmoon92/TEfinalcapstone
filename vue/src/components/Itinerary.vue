<template>
  <div>
    <!-- <h1>{{ itinerary }}</h1> -->
    <div v-for="itinerary in itineraryList" v-bind:key="itinerary.itineraryId">
      <h3>{{itinerary.itineraryName}}</h3>
      <button></button>
    </div>
  </div>
</template>

<script>
import itineraryService from "../services/ItineraryService.js";

export default {
  name: "itinerary",
  data() {
    return {
      itinerary: {},
      itineraries: {},
    };
  },

  computed: {
    itineraryList(){
      return this.itineraries;
    }
  },

  created() {
    // itineraryService.getItinerary(2).then((response) => {
    //   this.itinerary = response.data;
    // }),
      console.log("success");
    itineraryService.getAllItineraries().then((response) => {
      this.itineraries = response.data;
    });
  },

  methods: {
    
  }
};
</script>

<style>
</style>