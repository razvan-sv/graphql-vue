import Vue from 'vue'
import App from './app.vue'
import VueApollo from "vue-apollo"
import { ApolloClient } from 'apollo-client'
import { HttpLink } from 'apollo-link-http'
import { InMemoryCache } from 'apollo-cache-inmemory'

const csrfToken = document.querySelector('meta[name=csrf-token]').getAttribute('content');

const httpLink = new HttpLink({
  uri: 'http://localhost:3000/graphql',
  headers: { 'X-CSRF-Token': csrfToken }
})

const apolloProvider = new VueApollo({
  defaultClient: new ApolloClient({
    link: httpLink,
    cache: new InMemoryCache()
  })
})

Vue.use(VueApollo)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#content',
    apolloProvider,
    template: '<App />',
    components: { App }
  })
})
