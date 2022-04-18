<template>
  <div>
    <div class="field">
      <label for="landmarkId">Enter Landmark ID </label>
      <input name="landmarkId" type="text" v-model="landmarkList" />
    </div>
    <div class="actions">
      <button
        type="submit"
        v-on:click="updateItinerary(itinerary.itineraryId)"
      >
        Add Landmark
      </button>
    </div>
  </div>
</template>

<script>
import itineraryService from "../services/ItineraryService.js";
export default {
  name: "edit-itinerary",
  props: {
    itinerary: Object,
  },
  data() {
    return {
      landmarkList: "",
    };
  },

  methods: {
      updateItinerary(itineraryId) {
          
    
      itineraryService.updateItinerary(itineraryId, this.landmarkList).then((response) => {
        console.log(response);
        this.$router.go();
      });
    },
  }
};
</script>

<style>
</style>