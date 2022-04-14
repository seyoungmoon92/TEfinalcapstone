<template>
  <div>
    <h1>Create Your Itinerary</h1>
    <form v-on:submit.prevent="submitForm" class="ItineraryForm">
      <div class="form-group">
        <label for="itineraryName">Itinerary Name:</label>
        <input
          id="itineraryId"
          type="text"
          class="form-control"
          v-model="itinerary.itineraryName"
        />
      </div>

      <div class="form-group">
        <label for="startLocation">Starting Location:</label>
        <input
          id="startLocation"
          type="text"
          class="form-control"
          v-model="itinerary.itineraryStart"
        />
      </div>
      <div class="form-group">
        <label for="landmarkId">Landmark ID:</label>
        <input
          id="description"
          type="text"
          class="form-control"
          v-model="itinerary.landmarkId"
        />
      </div>

      <button class="btn btn-submit">Submit</button>
      <button class="btn btn-cancel" type="cancel" v-on:click="cancelForm">
        Cancel
      </button>
    </form>
    <p>{{this.itinerary}}</p>
  </div>
</template>

<script>
import itineraryService from "../services/ItineraryService.js";

export default {
  name: "create-itinerary",
  data() {
    return {
      itinerary: {},
    };
  },
  methods: {
    submitForm() {
      //call the service to add the home
      itineraryService
        .addItinerary(this.itinerary)
        .then((response) => {
          if (response.status === 201 || response.status === 200) {
            //success
            this.$router.push("landmarks");
          }
        })
        .catch((error) => {
          //promise was rejected
          // do something
          console.log(error);
        });
    },
    cancelForm() {
      this.itinerary = {};
    },
  },
};
</script>

<style>
</style>