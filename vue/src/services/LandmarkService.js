import axios from 'axios';

export default {

   // write methods to call the backend services
   //  axios.get
   //  axios.put / post / delete
   //  axios calls always returns a promise s

   search() {
      return axios.get('/landmarks')   
  
   },

   addLandmark(landmark) {
      return axios.post('/landmarks', landmark)
   },

   getLandmark(landmarkId) {
      return axios.get(`/landmarks/${landmarkId}`)
   },
}