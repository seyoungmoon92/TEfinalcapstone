import axios from 'axios';

export default {

   // write methods to call the backend services
   //  axios.get
   //  axios.put / post / delete
   //  axios calls always returns a promise s

   getItinerary(id) {
      return axios.get(`/itineraries/${id}`)   
   },

   createItinerary(itinerary) {
      return axios.post('/itineraries', itinerary)
   },

   getAllItineraries() {
      return axios.get('/itineraries')
   },

   addLandmark(itinerary) {
      return axios.put('/itineraries', itinerary)
   },

   deleteItinerary(id) {
      return axios.delete(`/itineraries/${id}`)
   }

}
