<template>
<div>
  <!-- <landmark-search/> -->
  <div id="map">
      <button @click="hideMap" >Toggle View (Map/ Card)</button> 
      <AddGoogleMap v-if=this.showMap />
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
     }
   }

}
</script>

<style scoped>
#map {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #000000;
  margin-top: 50px;
}

</style>