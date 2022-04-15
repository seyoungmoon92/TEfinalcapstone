<template>
  <div class="App" />
</template>

<script>
//import MarkerClusterer from "@google/markerclusterer";

import gmapsInit from "../../utils/gmaps";


export default {
  name: `google-map`,
  data() {
    return {
        google: null,
        geoCoder: null,
        map: null,
      locations: [
        {
          position: {
            lat: 35.5012626,
            lng: 138.8013852,
          },
        },
        {
          position: {
            lat: 35.696238,
            lng: 139.5704317,
          },
        },
        {
          position: {
            lat: 34.9671402,
            lng: 135.7726717,
          },
        },
        // {
        //   position: {
        //     lat: 35.7188351,
        //     lng: 139.7765215,
        //   },
        // },
        {
          position: {
            lat: 34.6691514,
            lng: 135.4327486,
          },
        },
      ],
    };
  },
  methods: {
      addMarker(marker){
          this.locations.push(marker);

      },
      loadGoogle(google){
          this.google = google;
      },
      loadGeocoder(geocoder){
          this.geoCoder = geocoder;
      },
      loadMap(map){
          this.map = map;
      },
        changeCenter(map){
            map.setCenter({
                lat: 35.696238,
                lng: 139.5704317}
                )
        }
        
  },
  async mounted() {
    try {

      const google = await gmapsInit();
      this.loadGoogle(google);
      const geocoder = new google.maps.Geocoder();
      this.loadGeocoder(geocoder);
      //let markers = null;
      const map = new google.maps.Map(this.$el);
      this.loadMap(map);
      geocoder.geocode({ address: `Tokyo` }, (results, status) => {
        if (status !== `OK` || !results[0]) {
          throw new Error(status);
        }

        map.setCenter(results[0].geometry.location);
        map.fitBounds(results[0].geometry.viewport);
        const location = results[0].geometry.location;
        const startPos = {
            position:{
                lat: location.lat,
                lng: location.lng,
            }
        };
        this.addMarker(startPos);



      });


      const markerClickHandler = (marker) => {
        map.setZoom(13);
        map.setCenter(marker.getPosition());
      };
        
      this.locations.map((location) => {
        const marker = new google.maps.Marker({ ...location, map });
        marker.addListener(`click`, () => markerClickHandler(marker));

        return marker;
      });
      this.changeCenter(map);









              // eslint-disable-next-line no-new
    //   new MarkerClusterer(map, markers, {
    //     imagePath: `https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m`,
    //   });
     } catch (error) {
    //   // eslint-disable-next-line no-console
    //   console.error(error);
     }
  },
};
</script>

<style scoped>
html,
body {
  margin: 0;
  padding: 0;
}

.App {
  height: 50rem;
  width: 80%;
  margin: 0 auto;
  border-style: double;
  border-width: 12px;
  border-color: pink;
}
</style>
