<template>
  <section>
    <h1 class="title has-text-centered">Stepper Login</h1>
    <b-steps type="is-success">
      <b-step-item label="Username" icon="account-key">
        <h1 class="title has-text-centered">Account</h1>

        <b-field
          label="Username"
          type="is-success"
          message="This username is available"
        >
          <b-input value="johnsilver" maxlength="30"></b-input>
        </b-field>
      </b-step-item>
      <b-step-item label="Password" icon="account">
        <h1 class="title has-text-centered">Finish</h1>
        <b-field label="Password">
          <b-input type="password" value="iwantmytreasure" password-reveal>
          </b-input>
        </b-field>
      </b-step-item>
    </b-steps>
  </section>
</template>

<script>
export default {
  transition: 'bounce',
  data() {
    return {
      name: 'John Silver'
    }
  }
}
</script>

<style lang="scss" scoped>
.bounce-enter-active {
  animation: bounce-in 1s;
}
.bounce-leave-active {
  animation: bounce-out 1.5s;
}
@keyframes bounce-in {
  0% {
    transform: scale(0);
    opacity: 0;
  }
  50% {
    transform: scale(1.5);
    opacity: 0.5;
  }
  100% {
    transform: scale(1);
    opacity: 1;
  }
}
@keyframes bounce-out {
  0% {
    transform: scale(1);
    opacity: 1;
  }
  50% {
    transform: scale(1.5);
    opacity: 0.5;
  }
  100% {
    transform: scale(0);
    opacity: 0;
  }
}
</style>
