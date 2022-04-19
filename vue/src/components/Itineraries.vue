<template>
  <div class="itinerarylist">

    <div class="itinerary"

      v-for="(itinerary, index) in itineraries"
      v-bind:key="itinerary.itineraryId"
    >
      <!-- <p>-------------------------------</p> -->
      <div>
        <button
            class="delete"
            v-on:click.prevent="deleteItinerary(itinerary.itineraryId)"
          >
            Delete Itinerary
          </button>
        <div class="itineraryName">
          {{
            itinerary.itineraryName
          }}
        </div>
        <div>
          Start:
          {{
            itinerary.itineraryStart
          }}
        </div>
        <div>
          Landmark List:
        </div>
        <div v-for="(landmark, index2) in landmarkNames" v-bind:key="landmark">
          <div v-if="hasLandmark(index2, index)">{{ landmark }}</div>
        </div>
        <!-- <edit-itinerary /> -->
        <div>
          <div class="field">
            <label for="landmarkId">Enter Landmark ID </label>
            <input
              name="landmarkId"
              type="text"
              v-model="landmarkList[itinerary.itineraryId]"
            />
          </div>
          <div class="actions">
            <button
              type="submit"
              v-on:click="updateItinerary(itinerary.itineraryId, index)"
            >
              Add Landmark
            </button>
          </div>
        </div>
      </div>
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

      landmarkNames: [
        "Tokyo National Museum",
        "Ghibli Museum",
        "Sensoji Temple",
        "Ueno Park",
        "Meiji Shrine",
        "Tokyo Skytree",
        "Kabuki-za Theatre",
        "Tsukiji Outer Market",
        "Hachiko Statue",
        "Nakamise-dori Street",
      ],
    };
  },
  computed: {
    filteredLandmarkList() {
      const filteredList = this.landmarkNames.filter(
        (landmarkId) => landmarkId === this.landmarkNames[0]
      );
      return filteredList;
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
      var input = this.itineraries[i].landmarkList + "," + this.landmarkList;
      var splitted = input.split(",");
      var collector = {};
      for (let i = 0; i < splitted.length; i++) {
        key = splitted[i].replace(/^\s*/, "").replace(/\s*$/, "");
        collector[key] = true;
      }
      var out = [];
      for (var key in collector) {
        out.push(key);
      }
      var output = out.join(",");
      const itinerary = {
        landmarkList: "," + output,
      };
      itineraryService.updateItinerary(id, itinerary).then((response) => {
        console.log(response);
        this.$router.go();
      });
    },
    hasLandmark(id, i) {
      if (this.itineraries[i].landmarkList == null) {
        return false;
      }
      var landmarks = this.itineraries[i].landmarkList;
      console.log(landmarks);
      return landmarks.includes("," + id + ",");
    },
  },
};
</script>
<style scoped>
.delete {
  display: flex;
  justify-content: end;
  
}
.itinerarylist {
  margin-left: 40px;
}
tr:nth-child(odd) {
  background-color: rgb(238, 238, 238);
}
tr:nth-child(even) {
  background-color: rgb(255, 255, 255);
}
.itinerary {
  padding: 15px;
}
.itineraryName {
  display: inline-flex;
  width: 100%;
  justify-content: space-around;
  font-weight: bold;
  font-size: 1.5rem;
}
</style>