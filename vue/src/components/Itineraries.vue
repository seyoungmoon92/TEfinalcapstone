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
      <edit-itinerary />
      <!-- <div class="field">
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
      </div> -->
      <p>-------------------------------</p>
    </div>
  </div>
</template>

<script>
import EditItinerary from "../components/EditItinerary.vue";
import itineraryService from "../services/ItineraryService.js";

export default {
  name: "itineraries",
  components: { EditItinerary },
  data() {
    return {
      itineraries: {},
      landmarkList: "",
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

    updateItinerary(id) {
      itineraryService
        .updateItinerary(id, this.landmarkList)
        .then((response) => {
          console.log(response);
          this.$router.go();
        });
    },
  },
};
</script>

<style>
</style>