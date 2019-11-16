<template>
  <div>
    <b-field label="Email" type="is-danger" message="This email is invalid">
      <b-input type="email" value="john@" maxlength="30"> </b-input>
    </b-field>

    <b-field
      label="Username"
      type="is-success"
      message="This username is available"
    >
      <b-input value="johnsilver" maxlength="30"></b-input>
    </b-field>

    <b-field label="Password">
      <b-input type="password" value="iwantmytreasure" password-reveal>
      </b-input>
    </b-field>
  </div>
</template>

<script>
export default {}
</script>

<style lang="scss" scoped></style>
