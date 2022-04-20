<template>
<div>
  <!-- <landmark-search/> -->
  <div>
    <div class="container"><button class="toggle btn btn-secondary" @click="hideMap(); updateLandmarks();" >Toggle View (Map/ Card)</button></div>
      
      
      <AddGoogleMap id = "map" v-if=this.showMap />
      
      <landmark-card ref="landmarkCard" v-if=!this.showMap />
   </div>
</div>
</template>

<script>
import LandmarkCard from '../components/LandmarkCard.vue';
import AddGoogleMap from "../components/Map.vue";
// import LandmarkSearch from '../components/LandmarkSearch.vue'
export default {
  name: "LandMarkSearchView",
  data () {
    return{
      showMap: true
    }
  },
  components: { 
    // LandmarkSearch,
    AddGoogleMap,
    LandmarkCard,
   },
   methods: {
     
     hideMap() {
       if(this.showMap == true){
         this.showMap = false;
       }
       else {
         this.showMap = true;
       }
     },

     update() {
       this.$refs.landmarkCard.updateLandmarks();
     },
    updateLandmarks() {
      this.$refs.LandmarkCard.updateLandmarks();
    },


   }

}
</script>

<style scoped>
/* #map {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #000000;
  margin-top: 50px;
  z-index: -1;
  width: 80%;
  margin: 0 auto;
} */

.container{
/* margin-top: 20px; */
text-align: left;
}
.btn {
  font-size: .8rem;

}

/* #map{
  max-height: ;
} */




</style>