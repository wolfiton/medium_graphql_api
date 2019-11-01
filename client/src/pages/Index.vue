<template>
  <q-page class="flex flex-center">
      <div v-if="posts.length < 1">
        <h1>No posts</h1>
      </div>
      <q-card class="my-card" v-for="post in posts" :key="post.id">
        <q-card-section>
          {{ post.title }}
        </q-card-section>
      </q-card>
  </q-page>
</template>
<script>
import { POSTS_QUERY } from "../graphql";

export default {
  name: "Index",
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
<style lang="stylus" scoped>
.my-card
  width 100%
  max-width 250px
</style>
