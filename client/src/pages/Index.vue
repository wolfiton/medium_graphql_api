<template>
  <q-page class="flex flex-center">
    <img alt="Quasar logo" src="~assets/quasar-logo-full.svg" />

    <div>
      <div v-if="posts.length < 1">
        <h1>No posts</h1>
      </div>Testing if this is the way
      <div v-for="post in posts" :key="post.id">{{ post.title }}</div>
    </div>
  </q-page>
</template>


<script>
import { POSTS_QUERY } from "../boot/graphql";

export default {
  name: "PageIndex",
  data() {
    return {
      posts: []
    };
  },
  apollo: {
    posts: {
      query: POSTS_QUERY,
      // fetchPolicy: 'no-cache',
      error(error) {
        console.log(error);
      }
    }
  }
};
</script>
