<template>
  <div>
      <h1> {{landmark.name}} </h1>
      <p> {{landmark.description}} </p>
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