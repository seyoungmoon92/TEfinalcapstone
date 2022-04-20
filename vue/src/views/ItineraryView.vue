<template>
<div>
  <h1>Your Itineraries</h1>
  <div class="form"><create-itinerary /></div>
  <div class = "itineraries"><itineraries /></div>
  
</div>
  
</template>

<script>
import CreateItinerary from '../components/CreateItinerary.vue'
import Itineraries from '../components/Itineraries.vue'
export default {
  components: { Itineraries, CreateItinerary },

}
</script>

<style scoped>
h1 {
  margin-top:30px;
  text-align: center;
  font-size: 2.9rem;
  color: #ff006a;
  font-family: "Roboto Mono", cursive;
}
.form {
  text-align: center;
  margin-bottom: -45px;
}


</style>