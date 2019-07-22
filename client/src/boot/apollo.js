import { ApolloClient } from 'apollo-client';
import { InMemoryCache } from 'apollo-cache-inmemory';
import VueApollo from 'vue-apollo';
import { createHttpLink } from 'apollo-link-http';


const api = createHttpLink({ uri: 'http://localhost:4000/graphql'});

const apolloClient = new ApolloClient({
  link: api,
  cache: new InMemoryCache(),
  connectToDevTools: true,
});

export const apolloProvider = new VueApollo({
  defaultClient: apolloClient,
  errorHandler ({ graphQLErrors, networkError }) {
    if (graphQLErrors) {
      graphQLErrors.map(({ message, locations, path }) =>
        console.log(
          `[GraphQL error]: Message: ${message}, Location: ${locations}, Path: ${path}`
        )
      )
    }
    if (networkError) {
      console.log(`[Network error]: ${networkError}`)
    }
  }
});

export default ({ app, Vue }) => {
  Vue.use(VueApollo)
  app.apolloProvider = apolloProvider
};