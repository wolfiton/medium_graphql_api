<template>
  <q-page class="flex flex-center">
      <q-card class="my-card">
        <q-card-section>
            <div class="text-h6">Sign In</div>
        </q-card-section>
        <q-card-section>
            <q-input outlined v-model="email" label="Email" type="email" />
            <q-input outlined v-model="password" label="Password" type="password" />
        </q-card-section>

        <q-card-actions align="right">
          <q-btn flat @click="login">Sign In</q-btn>
        </q-card-actions>
      </q-card>
  </q-page>
</template>
<script>
import { SIGNIN_MUTATION } from "../graphql";
import { setSession } from '../router/auth'

export default {
  name: "SignIn",
  data() {
    return {
      email: '',
      password: ''
    }
  },
  methods: {
    login() {
      this.$apollo
          .mutate({
            mutation: SIGNIN_MUTATION,
            variables: {
              input: {
                email: this.email,
                password: this.password
              }
            }
          })
          .then(response => {
            // save user token to cache
              setSession(response.token)
              this.$router.replace('/');
            }).catch((error) => {
              console.log(error)
          });
    }
  }
};
</script>
<style lang="stylus" scoped>
.my-card
  width 100%
  max-width 450px
  padding 5%
</style>
