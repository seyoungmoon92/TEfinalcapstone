<template>
  <div>
    <!-- <h1>{{ itinerary }}</h1> -->
    <h2>{{ itineraries }}</h2>
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

  created() {
    // itineraryService.getItinerary(2).then((response) => {
    //   this.itinerary = response.data;
    // }),
      console.log("success");
    itineraryService.getAllItineraries().then((response) => {
      this.itineraries = response.data;
    });
  },
};
</script>

<style>
</style>