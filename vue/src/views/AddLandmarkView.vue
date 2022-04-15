<template>
  <div>
   <h2>Add Your Landmark</h2>
   <p>Please fill out the form to add a landmark</p>   
   <add-landmark />
   <landmark-search-header />

 
  </div>
  
</template>

<script>

import AddLandmark from '../components/AddLandmark.vue';
// import GoogleMap from '../components/GoogleMap.vue';
import LandmarkSearchHeader from '../components/LandmarkSearchHeader.vue'


export default {

    components: {
        AddLandmark,

        LandmarkSearchHeader,


    },

    data() {
      return{

      }
    }

}
</script>

<style scoped>
</style>