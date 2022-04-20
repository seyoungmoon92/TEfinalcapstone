import Vue from 'vue'
import App from './App.vue'
import router from './router/index'
import store from './store/index'
import axios from 'axios'
import * as VueGoogleMaps from "vue2-google-maps" // Import package
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'

// Import Bootstrap and BootstrapVue CSS files (order is important)
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

// Make BootstrapVue available throughout your project
Vue.use(BootstrapVue)
// Optionally install the BootstrapVue icon components plugin
Vue.use(IconsPlugin)
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
