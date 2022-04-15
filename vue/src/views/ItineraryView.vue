<template>
<div>
  <create-itinerary />
  <itineraries />
</div>
  
</template>

<script>
import CreateItinerary from '../components/CreateItinerary.vue'
import Itineraries from '../components/Itineraries.vue'
export default {
  components: { Itineraries, CreateItinerary },

}
</script>

<style>

</style>