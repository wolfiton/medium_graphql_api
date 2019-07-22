import { ApolloClient } from 'apollo-client';
import { InMemoryCache } from 'apollo-cache-inmemory';
import VueApollo from 'vue-apollo';
import { HttpLink } from 'apollo-link-http';
import fetch from 'node-fetch';

// Cache implementation
const cache = new InMemoryCache();

// Create the apollo client
const api = 'http://localhost:4000/api/graphql';

const apolloClient = new ApolloClient({
  link: new HttpLink({ uri: api, fetch }),
  cache,
  connectToDevTools: true,
});

export const apollo = new VueApollo({
  defaultClient: apolloClient,
  errorHandler({ graphQLErrors, networkError }) {
    if (graphQLErrors) {
      graphQLErrors.map(({ message, locations }) => console.log(`[GraphQL error]: Message: ${message}, location ${locations}`));
    }
    if (networkError) {
      console.log(`[Network error]: ${networkError}`);
    }
  },
});

export default ({ app, Vue }) => {
  Vue.use(VueApollo);
  app.apollo = apollo;
};
