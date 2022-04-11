<template>
  <div>
    <div id="searchLandmarks">
      <label for="id">Enter landmark ID</label>
      <input type="text" name="id" v-model="idFilter" />
    </div>
    <div id="main-div">
      <p v-if="filteredLandmarks.length == 0">No Results Found</p>
      <div class="divTable minimalistBlack" v-if="filteredLandmarks.length > 0">
        <div class="divTableHeading">
          <div class="divTableRow">
            <div class="divTableHead"></div>
            <div class="divTableHead">Name</div>
            <div class="divTableHead">Location</div>
            <div class="divTableHead">Description</div>
            <div class="divTableHead">Rating</div>
          </div>
        </div>
        <div class="divTableBody">
          <div
            class="divTableRow"
            v-for="landmark in filteredLandmarks"
            v-bind:key="landmark.landmarkId"
          >
            <div class="divTableCell" v-for="photo in photos" v-bind:key="photo.photoId">
              <img v-if="photo.landmarkId == landmark.landmarkId"
                v-bind:src="photo.photoUrl"
              />
            </div>
            <div class="divTableCell">{{landmark.name}}</div>
            <div class="divTableCell">
              {{ landmark.location }}
            </div>
            <div class="divTableCell">{{ landmark.description }}</div>
            <div class="divTableCell">{{ landmark.rating }}</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import landmarkService from "../services/LandmarkService.js";
import photoService from "../services/PhotoService.js";

export default {
  name: "landmark-search",
  data() {
    return {
      idFilter: "",
      landmarks: [],
      photos: [],
      filteredPhotos: [],
    };
  },
  computed: {
    filteredLandmarks() {
      return this.landmarks.filter((landmark) => {
        return this.idFilter == ""
          ? true
          : this.idFilter == landmark.landmarkId;
      });
    },
  },
  methods: {
    // hack to load local images only
    // getImageURL(pic) {
    //  return require('../assets/' + pic);
    // }
  },
  created() {
    // created gets called whenever the component loads
    // great place to call webservices when you need initial data loaded
    //what goes inside the then() is a function ==> what doe we want to do with the response
    landmarkService.search().then((response) => {
      this.landmarks = response.data; // response data contains my JSON - array of homes that came back from the server
    });

    photoService.search().then((response) => {
      this.photos = response.data;
    });
    // photoService.searchByLandmark(this.landmark.landmarkId).then((response) => {
    //   this.filteredPhotos = response.data;
    // });
  },
};
</script>

<style scoped>
#main-div {
  margin: 30px;
}

#searchHomes {
  margin: 30px;
}

input[type="text"] {
  margin: 30px;
  width: 15%;
  padding: 12px 17px;
  border: 2px solid rgb(0, 0, 0);
  border-radius: 6px;
}

img {
  width: 175px;
  height: auto;
}

div.minimalistBlack {
  margin: auto;
  border: 2px solid #000000;
  width: 80%;
  text-align: left;
  border-collapse: collapse;
}
.divTable.minimalistBlack .divTableCell,
.divTable.minimalistBlack .divTableHead {
  border: 1px solid #000000;
  padding: 5px 4px;
}
.divTable.minimalistBlack .divTableBody .divTableCell {
  font-size: 14px;
}
.divTable.minimalistBlack .divTableHeading {
  background: #fa92bd;
  background: -moz-linear-gradient(top, #fa92bd 0%, #fa92bd 66%, #fa92bd 100%);
  background: -webkit-linear-gradient(
    top,
    #fa92bd 0%,
    #fa92bd 66%,
    #fa92bd 100%
  );
  background: linear-gradient(to bottom, #fa92bd 0%, #fa92bd 66%, #fa92bd 100%);
  border-bottom: 3px solid #fa92bd;
}
.divTable.minimalistBlack .divTableHeading .divTableHead {
  font-size: 15px;
  font-weight: bold;
  color: #000000;
  text-align: left;
}
.minimalistBlack .tableFootStyle {
  font-size: 14px;
}
/* DivTable.com */
.divTable {
  display: table;
  table-layout: fixed;
}
.divTableRow {
  display: table-row;
}
.divTableHeading {
  display: table-header-group;
}
.divTableCell,
.divTableHead {
  display: table-cell;
}
.divTableHeading {
  display: table-header-group;
}
.divTableFoot {
  display: table-footer-group;
}
.divTableBody {
  display: table-row-group;
}
</style>