<template>
  <div class="page">
      <h1> {{landmark.name}} </h1>
      <div class="address-description">
      <p> Address: {{landmark.location}} </p>
      <p class="description"> Description: {{landmark.description}} </p>
      </div>
      <div class="fun-facts">
      <p> Fun Fact: {{landmark.funFact1}} </p>
      <p> Fun Fact: {{landmark.funFact2}} </p>
      <p> Fun Fact: {{landmark.funFact3}} </p>
      </div>
      
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
.page {
  margin-right: 15em;
  margin-left: 15em;
}
.address-description {
  margin-right: 50em;
  border-style: solid;
  padding-left: 1em;
  padding-right: 1em;
}

.property-image {
  display: block;
  margin-left: 0px;
  margin-right: auto;
  margin-top: 0px;
  height: 30em;
  width: 45em;
  background-size: contain;
  background-repeat: no-repeat;
  border-radius: 8px;

}


h1 {
  /* line-height: calc(20px + 20vh); */
  color: #fccaff;
  /* text-shadow: 0 0 5px #fa92bd, 0 0 15px #fa92bd, 0 0 20px #fa92bd, 0 0 40px #fa92bd, 0 0 60px #ff0000, 0 0 10px #ff006a, 0 0 98px #ff0000; */
  color: #ff006a;
  font-family: "Roboto Mono", cursive;
  text-align: start;
}
.fun-facts {
  border-style: solid;
  margin-top: 5em;
  margin-right: 0px;
  margin-left: 50em;
  margin-bottom: 3em;
  padding-left: 1em;
  padding-right: 1em;
  padding-top: 1em;
  padding-bottom: 1em;
  

  background: rgb(51, 0, 85);
  border-radius: 25px;
  box-shadow: 0px 0px 30px #db4dff;
  

}
</style>