<template>
  <h1>{{itinerary}}</h1>
</template>

<script>
import itineraryService from "../services/ItineraryService.js";

export default {
  name: "itinerary",
  data() {
    return {
      itinerary: {},
    };
  },

  created() {
      itineraryService.getItinerary(2).then((response) => {
        this.itinerary = response.data;
      }),
    console.log("success");
  },
};
</script>

<style>
</style>