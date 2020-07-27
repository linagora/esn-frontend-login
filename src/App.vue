<template>
  <v-app id="application">
    <v-main>
      <Login />
    </v-main>
  </v-app>
</template>

<script>
import Login from "./views/Login";

export default {
  name: "App",

  components: {
    Login
  }
};
</script>

<style lang="sass" scoped>
@use "sass:color"

$background: color.scale(#FFFFFF, $lightness: -3%)

#application
  background-color: $background
</style>
