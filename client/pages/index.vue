<template>
  <v-layout
    column
    justify-center
    align-center
  >
    <v-flex
      xs12
      sm8
      md6
    >
      <v-card v-for="post in posts" :key="post.id">
        <v-card-title class="headline">
          {{ post.title }}
        </v-card-title>
        <v-card-text>
         
        </v-card-text>
        <v-card-actions>
          <v-spacer />
          <v-btn
            color="primary"
            flat
            nuxt
            to="`/post/${post.id}`"
          >
            Read
          </v-btn>
        </v-card-actions>
      </v-card>

    </v-flex>
  </v-layout>
</template>

<script>
import { POSTS_QUERY } from "@/apollo/graphql"

export default {
    name: 'index',
    data: function () {
        return {
          posts: [] 
        }
    },
    apollo: {
        posts: {
            query: POSTS_QUERY,
            // fetchPolicy: 'no-cache',
            error(error) {
              console.log(error)
            }
        }
    }
}
</script>
