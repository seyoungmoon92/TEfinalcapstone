<template>
  <div>
    
    <div v-for="itinerary in itineraries" v-bind:key="itinerary.itineraryId">
      <p>-------------------------------</p>
      <h3>{{itinerary.itineraryName}} <button v-on:click.prevent="deleteItinerary(itinerary.itineraryId)">Delete</button></h3>      
      
      <p>Start: {{itinerary.itineraryStart}}</p>
      <p>{{itinerary.landmarkList}}</p>
      <p>-------------------------------</p>
    </div>
    
  </div>
</template>

<script>
import itineraryService from "../services/ItineraryService.js";

export default {
  name: "itineraries",
  data() {
    return {
      
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
    deleteItinerary(id){
      itineraryService.deleteItinerary(id).then((response) => {
        console.log(response);
        this.$router.go();
      });
    }
  }
};
</script>

<style>
</style>