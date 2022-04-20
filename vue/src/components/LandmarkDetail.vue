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
        <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-chat-right-text" viewBox="0 0 16 16">
  <path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
  <path d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
</svg> {{ landmark.funFact1 }}</p>
        <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-chat-right-text" viewBox="0 0 16 16">
  <path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
  <path d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
</svg> {{ landmark.funFact2 }}</p>
        <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-chat-right-text" viewBox="0 0 16 16">
  <path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
  <path d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
</svg> {{ landmark.funFact3 }}</p>
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
svg{
  margin-right:3px;
  filter: drop-shadow(0px 0px 10px #ff006a);
}
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
  text-shadow: 0px 0px 0px #db4dff;
  font-size: 1.5rem;

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
  text-shadow: 0px 0px 0px #ff006a;
  font-family: "Roboto Mono", cursive;
  text-align: start;
}
.fun-facts {
  border-style: solid;
  height: 30%;
  width: 50%;
  padding-top: 10px;
  padding-left: 15px;
  padding-right: 15px;
  text-shadow: 0px 0px 0px #db4dff;
  font-size: 1.4rem;
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
