import Vue from 'vue'
import App from './App.vue'
import router from './router/index'
import store from './store/index'
import axios from 'axios'
import * as VueGoogleMaps from "vue2-google-maps" // Import package

Vue.config.productionTip = false

axios.defaults.baseURL = process.env.VUE_APP_REMOTE_API;


Vue.use(VueGoogleMaps, {
  load: {
    key: "AIzaSyCcrOUiA-7wHhNdkdczzY1PMgTFclDgYAg",
    libraries: "places, geometry"
  }
});

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
