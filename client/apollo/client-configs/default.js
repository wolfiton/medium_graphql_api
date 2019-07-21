import { HttpLink } from 'apollo-link-http'
import { InMemoryCache } from 'apollo-cache-inmemory'

// Replace this with your project's endpoint
const api = 'http://localhost:4000/api/graphql'

export default () => ({
  link: new HttpLink({ uri: api }),
  cache: new InMemoryCache(),
  defaultHttpLink: false
})