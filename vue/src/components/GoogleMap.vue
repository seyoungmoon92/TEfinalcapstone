<template>
  <div class="App"/>
</template>

<script>
import MarkerClusterer from '@google/markerclusterer';

import gmapsInit from '../../utils/gmaps';

const locations = [
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
  {
    position: {
      lat: 35.7188351,
      lng: 139.7765215,
    },
  },
  {
    position: {
      lat: 34.6691514,
      lng: 135.4327486,
    },
  },
];

export default {
  name: `google-map`,
  async mounted() {
    try {
      const google = await gmapsInit();
      const geocoder = new google.maps.Geocoder();
      const map = new google.maps.Map(this.$el);

      geocoder.geocode({ address: `Tokyo` }, (results, status) => {
        if (status !== `OK` || !results[0]) {
          throw new Error(status);
        }

        map.setCenter(results[0].geometry.location);
        map.fitBounds(results[0].geometry.viewport);
      });

      const markerClickHandler = (marker) => {
        map.setZoom(13);
        map.setCenter(marker.getPosition());
      };

      const markers = locations
        .map((location) => {
          const marker = new google.maps.Marker({ ...location, map });
          marker.addListener(`click`, () => markerClickHandler(marker));

          return marker;
        });

      // eslint-disable-next-line no-new
      new MarkerClusterer(map, markers, {
        imagePath: `https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m`,
      });
    } catch (error) {
      // eslint-disable-next-line no-console
      console.error(error);
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
