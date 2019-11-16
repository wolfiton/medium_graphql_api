<template>
  <div>
    <b-navbar>
      <template slot="brand">
        <b-navbar-item :to="{ path: '/' }" tag="router-link">
          <img
            src="https://raw.githubusercontent.com/buefy/buefy/dev/static/img/buefy-logo.png"
            alt="Lightweight UI components for Vue.js based on Bulma"
          />
        </b-navbar-item>
      </template>
      <template slot="start">
        <b-navbar-item href="/">
          Home
        </b-navbar-item>
        <b-navbar-item href="/dashboard">
          Dashboard
        </b-navbar-item>
      </template>

      <template slot="end">
        <b-navbar-item tag="div">
          <div class="buttons">
            <span v-if="!auth">
              <b-navbar-dropdown label="Username">
                <b-navbar-item href="/profile/username">
                  Profile
                </b-navbar-item>
                <b-navbar-item href="/">
                  Signout
                </b-navbar-item>
              </b-navbar-dropdown>
            </span>
            <a class="button is-primary" href="/signup">
              <strong>Sign up</strong>
            </a>
            <nuxt-link to="/login" class="button is-light">
              Log in
            </nuxt-link>
          </div>
        </b-navbar-item>
      </template>
    </b-navbar>
    <section>
      <div class="container column is-10">
        <nuxt />
      </div>
    </section>
  </div>
</template>

<script>
export default {
  data() {
    return {
      items: [
        {
          title: 'Home',
          icon: 'home',
          to: { name: 'index' }
        },
        {
          title: 'Inspire',
          icon: 'lightbulb',
          to: { name: 'inspire' }
        }
      ],
      auth: false
    }
  }
}
</script>
