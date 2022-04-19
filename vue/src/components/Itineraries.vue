<template>
  <div class="itinerarylist">
    <div class="itinerary"
      v-for="(itinerary, index) in itineraries"
      v-bind:key="itinerary.itineraryId"
    >
      <!-- <p>-------------------------------</p> -->
      <tbody>
        <tr class="itineraryName">
          {{
            itinerary.itineraryName
          }}<button class="delete" v-on:click.prevent="deleteItinerary(itinerary.itineraryId)">
            Delete
          </button>
        </tr>
        <tr>
          Start:
          {{
            itinerary.itineraryStart
          }}
        </tr>
        <tr>Landmark List: {{ itinerary.landmarkList }}</tr>
        <!-- <edit-itinerary /> -->
        <tr>
        <div  class="field">
          <label for="landmarkId">Enter Landmark ID </label>
          <input name="landmarkId" type="text" v-model="landmarkList[itinerary.itineraryId]" />
        </div>
        <div class="actions">
          <button
            type="submit"
            v-on:click="updateItinerary(itinerary.itineraryId, index)"
          >
            Add Landmark
          </button>
        </div>
        </tr>
      </tbody>
      <!-- <p>-------------------------------</p> -->
    </div>
  </div>
</template>
<script>
// import EditItinerary from "../components/EditItinerary.vue";
import itineraryService from "../services/ItineraryService.js";
export default {
  name: "itineraries",
  // components: { EditItinerary },
  data() {
    return {
      addLandmark: false,
      itineraries: {},
      landmarkList: [],
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
    updateItinerary(id, i) {
      this.addLandmark = true;
      var input = this.itineraries[i].landmarkList + ',' + this.landmarkList;
      var splitted = input.split(',');
      var collector = {};
      for (let i = 0; i < splitted.length; i++) {
        key = splitted[i].replace(/^\s*/, "").replace(/\s*$/, "");
        collector[key] = true;
      }
      var out = [];
      for (var key in collector) {
        out.push(key);
      }
      var output = out.join(',');
      const itinerary = {
        landmarkList: output,
      };
      itineraryService
        .updateItinerary(id, itinerary)
        .then((response) => {
          console.log(response);
          this.$router.go();
        });
    },
  },
};
</script>
<style scoped>
.itinerarylist {
  margin-left: 40px;
}
tr:nth-child(odd) {
  background-color: rgb(238, 238, 238);
}
.itinerary {
  padding: 15px;
}
.itineraryName {
  display: inline-flex;
  width: 100%;
  justify-content: space-around;
}
</style>