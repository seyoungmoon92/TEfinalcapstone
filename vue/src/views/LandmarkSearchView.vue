<template>
<div>
  <!-- <landmark-search/> -->
  <div id="map">
      <AddGoogleMap />
   </div>
</div>
</template>

<script>
import AddGoogleMap from "../components/Map.vue";
// import LandmarkSearch from '../components/LandmarkSearch.vue'
export default {
  components: { 
    // LandmarkSearch,
    AddGoogleMap
   },

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