<template>
  <div class="wrapper">
    <p class="landmarkLink"><router-link v-bind:to="{ name: 'landmark-search' }"
              >Go To Landmarks</router-link
            ></p>
            <br>
    <div
      class="wrap-1"
      v-for="(itinerary, index) in itineraries"
      v-bind:key="itinerary.itineraryId"
    >
      <!-- <button
        class="delete"
        v-on:click.prevent="deleteItinerary(itinerary.itineraryId)"
      >
        Delete Itinerary
      </button> -->
      <button class = "delete">
    <svg v-on:click.prevent="deleteItinerary(itinerary.itineraryId)" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
</svg>
<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-printer" viewBox="0 0 16 16">
  <path d="M2.5 8a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1z"/>
  <path d="M5 1a2 2 0 0 0-2 2v2H2a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h1v1a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2v-1h1a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2h-1V3a2 2 0 0 0-2-2H5zM4 3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v2H4V3zm1 5a2 2 0 0 0-2 2v1H2a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-1v-1a2 2 0 0 0-2-2H5zm7 2v3a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1z"/>
</svg>
</button>
      <input type="radio" :id="itinerary.itineraryId" :value="itinerary.itineraryName" v-model="selected" name="selected" />
      <label :for="itinerary.itineraryId"
        ><div>{{ itinerary.itineraryName }}</div>
        <div class="cross"></div
      ></label>
      <div class=content>
        <div>
          Starting Location:
          {{ itinerary.itineraryStart }}
        </div>
        
        <div class="listHeader">Points of Interest:</div>
        <div v-for="(landmark, index2) in landmarkNames" v-bind:key="landmark">
          <div v-if="hasLandmark(index2, index)">{{ landmark }}</div>
        </div>
        <!-- <edit-itinerary /> -->
        <!-- <div>
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
        </div> -->
      </div>
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
      selected: -1,

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
        "Tokyo Disneyland",
        "Harajuku",
        "Shinjuku Gyoen National Garden",
        "Tokyo Dome City",
        "Edo-Tokyo Museum",
        "Mount Mitake",
        "Ryogoku",
        "Tokyo Sea Life Park",
        "Nakano Broadway",
        "Sengakuji Temple",
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
  background: none;
  border: none;
  
  cursor: pointer;
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

* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  /* font-family: 'Space Mono', monospace; */
  color: #3e474f;
}

body {
  overflow: hidden;
}

.wrapper {
  max-width: 800px;
  width: 100%;
  margin: 10vh auto;
}

/* h1 {
  font-size: 2em;
  margin-bottom: 20px;
  text-align: center;
} */

input {
  display: none;
}

label {
  display: flex;
  width: 100%;
  height: 50px;
  cursor: pointer;
  border: 3px solid #3e474f;
  user-select: none;
}

label div:first-child {
  width: 100%;
  line-height: 45px;
  margin-left: 10px;
  font-size: 1.5em;
}

.cross {
  margin-right: 15px;
  margin-top: 3px;
}

.cross:before,
.cross:after {
  content: "";
  border-top: 2px solid #3e474f;
  width: 15px;
  display: block;
  margin-top: 18px;
  transition: 0.3s;
}

.cross:after {
  transform: rotate(90deg);
  margin-top: -2px;
}

.content {
  box-sizing: border-box;
  font-size: 1.3em;
  margin: 10px 10px;
  max-height: 0;
  overflow: hidden;
  transition: max-height, 0.5s;
}
.listHeader{
  font-weight: bold;
}

input:checked ~ .content {
  max-height: 800px;
  transition: max-height, 1s;
}

input:checked ~ label .cross:before {
  transform: rotate(180deg);
}

input:checked ~ label .cross:after {
  transform: rotate(0deg);
}

.questions {
  margin-top: 20px;
  max-height: 0;
  overflow: hidden;
  transition: max-height, 0.5s;
}

.questions label {
  border: none;
  box-shadow: none;
  margin: 0;
}

input:checked ~ .questions {
  max-height: 400px;
  border-bottom: 2px solid #3e474f;
  transition: 1s;
}

/*----------tool-tip------------*/

.tip {
  color: #f03768;
  cursor: help;
  position: relative;
  overflow: visible;
  /* font-family: monospace; */
  font-size: 1.3em;
}

.tip:before,
.tip:after {
  position: absolute;
  opacity: 0;
  z-index: -100;
  transform: translateY(-30%);
  transition: 0.4s;
}

.tip:before {
  content: "";
  border-style: solid;
  border-width: 0.8em 0.5em 0 0.5em;
  border-color: #3e474f transparent transparent transparent;
  transform: translateY(-200%);
  bottom: 90%;
  left: 50%;
}

.tip:after {
  content: attr(data-tip);
  background: #3e474f;
  color: white;
  width: 150px;
  padding: 10px;
  font-size: 0.8em;
  bottom: 150%;
  left: -50%;
}

.tip:hover:before,
.tip:hover:after {
  opacity: 1;
  z-index: 100;
  transform: scaleY(1);
}
.landmarkLink {
  color:blue;
  text-align: center;
  font-size: 1.3rem;
}
svg{
  margin-left: 8px;
}
</style>