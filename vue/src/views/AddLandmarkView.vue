<template>
  <div>
   <h2>Add Your Landmark</h2>
   <p>Please fill out the form to add a landmark</p>   
   <add-landmark />
   <google-map />   
  </div>
  
</template>

<script>

import AddLandmark from '../components/AddLandmark.vue';
import GoogleMap from '../components/GoogleMap.vue';
export default {

    components: {
        AddLandmark,
        GoogleMap
    }

}
</script>

<style scoped>

</style>