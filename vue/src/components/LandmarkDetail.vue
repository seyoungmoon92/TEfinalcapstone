<template>
  <div>
      <h1> {{landmark.name}} </h1>
      <p> Address: {{landmark.location}} </p>
      <p> Description: {{landmark.description}} </p>
      
          <div class="property-image" v-bind:style="'background-image:url(' + photo[0].photoUrl + ')'"></div>
      <!-- <p> Rating: {{landmark.rating}} </p> -->
  </div>
</template>

<script>
import landmarkService from '../services/LandmarkService';
import PhotoService from '../services/PhotoService';
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
    PhotoService.searchByLandmark(this.$route.params.id).then(response => {
            this.photo = response.data
    });
}
};
</script>


<style scoped>
.property-image {
  display: flex;
  align-items: flex-end;
  height: 30em;
  width: 45em;
  margin-left: 400px;
  background-size: contain;
  background-repeat: no-repeat;
  border-radius: 8px;

}

h1 {
  line-height: calc(20px + 20vh);
  color: #fccaff;
  /* text-shadow: 0 0 5px #fa92bd, 0 0 15px #fa92bd, 0 0 20px #fa92bd, 0 0 40px #fa92bd, 0 0 60px #ff0000, 0 0 10px #ff006a, 0 0 98px #ff0000; */
  color: #ff006a;
  font-family: "Roboto Mono", cursive;
  text-align: start;
  
}
</style>