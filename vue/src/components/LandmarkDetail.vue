<template>
  <div class="page">
    <h1 class="title">{{ landmark.name }}</h1>
    <div class="address-description">
      <p>Address: {{ landmark.location }}</p>
      <p class="description">Description: {{ landmark.description }}</p>
    </div>
    <div class="flex">
      <img
        class="img-container"
        :src="photo[0].photoUrl"
        width="25%"
        alt="test"
      />
      
      
      
      
      <div class="fun-facts">
        <p>Fun Fact: {{ landmark.funFact1 }}</p>
        <p>Fun Fact: {{ landmark.funFact2 }}</p>
        <p>Fun Fact: {{ landmark.funFact3 }}</p>
      </div>


    </div>
  </div>
</template>

<script>
import landmarkService from "../services/LandmarkService";
import PhotoService from "../services/PhotoService";
export default {
  name: "landmark-detail",

  data() {
    return {
      landmark: {},
      photo: {},
    };
  },
  created() {
    landmarkService.getLandmark(this.$route.params.id).then((response) => {
      this.landmark = response.data;
    });
    PhotoService.searchByLandmark(this.$route.params.id).then((response) => {
      this.photo = response.data;
    });
  },
};
</script>

<style scoped>
.page {
  margin-right: 15em;
  margin-left: 15em;
  padding: 0;
  width: 80%;
  min-height: 100vh;
}
.address-description {

  margin-top: 20px;
  margin-bottom: 60px;
  widows: 80%;
  text-shadow: 0px 0px 5px #db4dff;

  /* padding-top: 10px;
  margin-top: 20px;
  margin-right: 50em;
  border-style: solid;
  padding-left: 1em;
  padding-right: 1em;
  background: rgb(51, 0, 85);
  border-radius: 25px;
  box-shadow: 0px 0px 30px #db4dff; */
}

.img-container {
  
  width: 50%;
  margin-right: 40px;
  border-style: solid;
  border-radius: 25px;
  box-shadow: 0px 0px 30px #db4dff;
}

.title {
  margin-top: 50px;
  /* line-height: calc(20px + 20vh); */
  color: #fccaff;
  /* text-shadow: 0 0 5px #fa92bd, 0 0 15px #fa92bd, 0 0 20px #fa92bd, 0 0 40px #fa92bd, 0 0 60px #ff0000, 0 0 10px #ff006a, 0 0 98px #ff0000; */
  color: #ff006a;
  text-shadow: 0px 0px 10px #ff006a;
  font-family: "Roboto Mono", cursive;
  text-align: start;
}
.fun-facts {
  border-style: solid;
  height: 30%;
  width: 50%;
  padding-top: 10px;
  padding-left: 10px;
  text-shadow: 0px 0px 5px #db4dff;

  background: rgb(51, 54, 100);
  border-radius: 25px;
  box-shadow: 0px 0px 30px #db4dff;
}

.flex{
  display: flex;
  margin-top: 40px;
  width: 100%;

}




</style>
