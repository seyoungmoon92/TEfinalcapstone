import axios from 'axios';

export default {

   // write methods to call the backend services
   //  axios.get
   //  axios.put / post / delete
   //  axios calls always returns a promise 

   search() {
      return axios.get('/photos');   
  
   },

   searchByLandmark(id) {
        return axios.get(`/photos/${id}`);
   }


}