<template>
  <div id="addLandmarkForm">
    <form v-on:submit.prevent="submitForm" class="landmarkForm">
      <div class="form-group">
        <label for="landmarkId">Landmark ID:</label>
        <input
          id="landmarkId"
          type="text"
          class="form-control"
          v-model="landmark.landmarkId"
        />
      </div>
      
      <div class="form-group">
        <label for="location">Location:</label>
        <input
          id="location"
          type="text"
          class="form-control"
          v-model="landmark.location"
        />
      </div>
      <div class="form-group">
        <label for="description">Description:</label>
        <input
          id="description"
          type="text"
          class="form-control"
          v-model="landmark.description"
        />
      </div>
     
      <button class="btn btn-submit">Submit</button>
      <button class="btn btn-cancel" type="cancel" v-on:click="cancelForm">
        Cancel
      </button>
    </form>
  </div>
</template>

<script>
import landmarkService from "../services/LandmarkService.js";

export default {
  name: "add-landmark",
  data() {
    return {
      landmark: {
        
      },
    };
  },
  methods: {
    submitForm() {
      //call the service to add the home
      landmarkService
        .addLandmark(this.landmark)
        .then((response) => {
          if (response.status === 201 || response.status === 200) {
            //success
            this.$router.push("landmark-search");
          }
        })
        .catch((error) => {
          //promise was rejected
          // do something
          console.log(error);
        });
    },
    cancelForm() {
      this.landmark = {};
    },
  },
};
</script>