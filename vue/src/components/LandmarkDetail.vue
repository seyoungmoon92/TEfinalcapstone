<template>
  <div>
      <h1> {{landmark.name}} </h1>
      <p> Address: {{landmark.location}} </p>
      <p> Description: {{landmark.description}} </p>
      <!-- <p> Rating: {{landmark.rating}} </p> -->
  </div>
</template>

<script>
import landmarkService from '../services/LandmarkService';

export default {
    name: 'landmark-detail',

data() {
    return {
        landmark: {}
    };
},
created() {
    landmarkService.getLandmark(this.$route.params.id).then(response => {
            this.landmark = response.data
            
    });
}
};
</script>


<style>

</style>