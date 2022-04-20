<template>
  <div class="wrapper">
    <div
      class="wrap-1"
      v-for="(itinerary, index) in itineraries"
      v-bind:key="itinerary.itineraryId"
    >
      <button
        class="delete"
        v-on:click.prevent="deleteItinerary(itinerary.itineraryId)"
      >
        Delete Itinerary
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
        <div>Points of Interest:</div>
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
  display: flex;
  justify-content: flex-end;
  
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
  max-width: 600px;
  width: 100%;
  margin: 10vh auto;
}

h1 {
  font-size: 2em;
  margin-bottom: 20px;
  text-align: center;
}

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
  font-size: 1.2em;
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
  font-size: 0.9em;
  margin: 10px 10px;
  max-height: 0;
  overflow: hidden;
  transition: max-height, 0.5s;
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
</style>