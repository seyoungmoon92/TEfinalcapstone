<template>
  <div>
      <div id="searchLandmarks">

        <label for = "id">Enter landmark ID</label>
        <input type="text" name="id" v-model="idFilter"/>

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
          <div class="divTableRow" v-for="landmark in filteredLandmarks" v-bind:key="landmark.landmarkId">
            <div class="divTableCell">
                <!-- <img v-bind:src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/080103_hakkai_fuji.jpg/1200px-080103_hakkai_fuji.jpg"/> -->
            </div>
            <div class="divTableCell">test name</div>
            <div class="divTableCell">
                {{landmark.location}}        
             </div>
            <div class="divTableCell">{{landmark.description}}</div>
            <div class="divTableCell">{{landmark.rating}}</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import landmarkService from '../services/LandmarkService.js';
export default {
    name: 'landmark-search',
    data() {
        return {
           idFilter: '',
           landmarks: []

        };
    },
    computed: {
        filteredLandmarks() {
           

           return this.landmarks.filter(landmark => {
               return this.idFilter == '' ? true : this.idFilter == landmark.landmarkId;
           });

        }
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
        landmarkService.search().then(response => {
              this.landmarks = response.data;   // response data contains my JSON - array of homes that came back from the server
        });

    }

}
</script>

<style>

</style>