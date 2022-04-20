<template>
  <div class="body">
    <button
      id="show-form-button"
      href="#"
      v-if="showForm === false"
      v-on:click.prevent="showForm = true"
      >CREATE ITINERARY</button
    >
    <form class="form" v-on:submit.prevent="submitForm" v-if="showForm === true">
      <div class="form-group">
        <label for="itineraryName">Itinerary Name: </label>
        <input
          id="itineraryId"
          type="text"
          class="form-control"
          v-model="itinerary.itineraryName"
        />
      </div>

      <div class="form-group">
        <label for="startLocation">Starting Location: </label>
        <input
          id="startLocation"
          type="text"
          class="form-control"
          v-model="itinerary.itineraryStart"
        />
      </div>

      <button class="btn btn-submit btn-info" type="submit">Submit</button>
      <button class="btn btn-cancel btn-secondary" type="button" value="cancel" v-on:click="cancelForm">
        Cancel
      </button>
    </form>
  </div>
</template>

<script>
import itineraryService from "../services/ItineraryService.js";

export default {
  name: "create-itinerary",
  data() {
    return {
      showForm: false,
      userId: null,
      itinerary: {},
    };
  },
  created() {
    this.userId = this.$store.state.user.id;
    this.itinerary.userId = this.userId;
  },
  methods: {
    submitForm() {
      // this.user = this.$store.state.user;

      //call the service to add the home
      itineraryService
        .createItinerary(this.itinerary)
        .then((response) => {
          if (response.status === 201 || response.status === 200) {
            //success
            this.$router.go();
          }
        })
        .catch((error) => {
          //promise was rejected
          // do something
          console.log(error);
        });
    },
    cancelForm() {
      this.itinerary = {};
      this.showForm = false;
      this.$router.go();
    },
    
  },
};
</script>

<style scoped>

.form{
  position: relative;
  top: 10%;
  left: 36%;
  max-width: 28%;
  margin-bottom: -65px;
}
#show-form-button{
  
  justify-content: center;
  font-weight: 1000;
  color: rgb(78, 78, 78);
  font-size: 1.3rem;
  border-width: 1px;
  background-color: #fccaff;
  border-radius: 12px;
  padding-top: 9px;
  padding-bottom: 9px;
  padding-left: 18px;
  padding-right: 18px;
  cursor: pointer;
  margin-top: 15px;
  margin-bottom: -20px;
}

/* .form-group {
  padding: 5px;
} */
.btn {
  margin: 5px;
  padding: 5px;
}
</style>