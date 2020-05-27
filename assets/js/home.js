import Vue from 'vue'
import router from "./router";

import { ApolloClient } from 'apollo-client'
import { InMemoryCache } from 'apollo-cache-inmemory'
import { HttpLink } from 'apollo-link-http'
import VueApollo from 'vue-apollo'

import { BootstrapVue, DropdownPlugin, IconsPlugin } from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

import App from './App.vue'

Vue.config.productionTip = false
Vue.use(BootstrapVue)
Vue.use(DropdownPlugin)
Vue.use(IconsPlugin)
Vue.use(VueApollo)

const httpLink = new HttpLink({
  uri: 'http://localhost:4000/graphiql',
})

const apolloClient = new ApolloClient({
  link: httpLink,
  cache: new InMemoryCache(),
  connectToDevTools: true,
})

const apolloProvider = new VueApollo({
  defaultClient: apolloClient,
})

new Vue({
  router,
  apolloProvider,
  render: h => h(App)
}).$mount("#app");