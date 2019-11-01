<template>
  <q-page class="flex flex-center">
      <q-card class="my-card">
        <q-card-section>
            <div class="text-h6">New Account</div>
        </q-card-section>
        <q-card-section>
            <q-input outlined v-model="email" label="Email" type="email" />
            <q-input outlined v-model="name" label="First Name" type="text" />
            <q-input outlined v-model="surname" label="Last Name" type="text" />
            <q-input outlined v-model="password" label="Password" type="password" />
            <q-input outlined v-model="password_confirmation" label="Password Confirmation" type="password" />
        </q-card-section>

        <q-card-actions align="right">
          <q-btn flat @click="registration">Sign Up</q-btn>
        </q-card-actions>
      </q-card>
  </q-page>
</template>
<script>
import { SIGNUP_MUTATION } from "../graphql";

export default {
  name: "SignIn",
  data() {
    return {
      email: '',
      password: '',
      name: '',
      surname: '',
      password_confirmation: ''
    }
  },
  methods: {
    registration() {
      this.$apollo
          .mutate({
            mutation: SIGNUP_MUTATION,
            variables: {
              input: {
                email: this.email,
                password: this.password,
                firstName: this.name,
                lastName: this.surname,
                passwordConfirmation: this.password_confirmation
              }
            }
          })
          .then(response => {
            // save user token to cache
              console.log(response)
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
