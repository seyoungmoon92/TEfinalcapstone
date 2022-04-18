<template>
  <div class="itinerarylist">
    <div class="itinerary"
      v-for="itinerary in itineraries"
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
        <div v-if="addLandmark==true" class="field">
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
      const itinerary = {
        landmarkList: this.landmarkList,
      };
      // this.itineraries.find(itinerary => itinerary.itineraryId === this.itinerary.itineraryId);
      this.addLandmark = true;
      itinerary.landmarkList = (this.landmarkList + this.itineraries[id].landmarkList).split(',').filter(function(item, pos,self) {
              return self.indexOf(item) == pos;
           });
      itineraryService
        .updateItinerary(id, itinerary)
        .then((response) => {
          console.log(response);
          // this.$router.go();
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