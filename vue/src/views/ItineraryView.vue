<template>
<div>
  <create-itinerary />
  <itinerary />
</div>
  
</template>

<script>
import CreateItinerary from '../components/CreateItinerary.vue'
import Itinerary from '../components/Itinerary.vue'
export default {
  components: { Itinerary, CreateItinerary },

}
</script>

<style>

</style>