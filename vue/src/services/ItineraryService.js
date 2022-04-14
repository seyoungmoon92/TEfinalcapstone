import axios from 'axios';

export default {

   // write methods to call the backend services
   //  axios.get
   //  axios.put / post / delete
   //  axios calls always returns a promise s

   search(id) {
      return axios.get(`/itineraries/${id}`)   
   },

   addItinerary(itinerary) {
      return axios.post('/itineraries', itinerary)
   },

}
