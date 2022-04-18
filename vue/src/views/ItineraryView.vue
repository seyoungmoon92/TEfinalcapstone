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
  text-align: center;
  font-size: 2.3rem;
}
.form {
  text-align: center;
}


</style>