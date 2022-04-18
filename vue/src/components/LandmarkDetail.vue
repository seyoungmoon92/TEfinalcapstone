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
// import PhotoService from '../services/PhotoService';
export default {
    name: 'landmark-detail',

data() {
    return {
        landmark: {},
        photo: {},
    };
},
created() {
    landmarkService.getLandmark(this.$route.params.id).then(response => {
            this.landmark = response.data
    });
    // PhotoService.searchByLandmark(this.$route.params.id).then(response => {
    //         this.photo = response.data
    // });
}
};
</script>


<style>

</style>