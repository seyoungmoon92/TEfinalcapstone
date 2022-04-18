<template>
  <div>
    <div
      v-for="itinerary in itineraries.slice().reverse()"
      v-bind:key="itinerary.itineraryId"
    >
      <p>-------------------------------</p>
      <h3>
        {{ itinerary.itineraryName }}
        <button v-on:click.prevent="deleteItinerary(itinerary.itineraryId)">
          Delete
        </button>
      </h3>

      <p>Start: {{ itinerary.itineraryStart }}</p>
      <p>{{ itinerary.landmarkList }}</p>
      <!-- <div class="field">
        <label for="landmarkId">Enter Landmark ID </label>
        <input name="landmarkId" type="text" v-model="landmarkId" />
      </div>
      <div class="actions">
      <button type="submit" v-on:click="updateItinerary(itinerary.itineraryId, landmarkId)">Add Landmark</button>
    </div> -->
      <!-- <button v-on:click.prevent="updateItinerary(itinerary.itineraryId, landmarkId)">
        Add Landmark
      </button> -->
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
      landmarkId: "",
    };
  },

  computed: {
    itineraryList() {
      return this.itineraries;
    },
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
    deleteItinerary(id) {
      itineraryService.deleteItinerary(id).then((response) => {
        console.log(response);
        this.$router.go();
      });
    },

    updateItinerary(id, landmarkList) {
      itineraryService.updateItinerary(id, landmarkList).then((response) => {
        console.log(response);
        this.$router.go();
      });
    },
  },
};
</script>

<style>
</style>