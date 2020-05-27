<template>
  <div id="app">
    <RwvAppMenu />
    <router-view></router-view>
    <RwvUserMenu />
  </div>
</template>

<script>
import RwvAppMenu from "./components/AppMenu";
import RwvUserMenu from "./components/UserMenu";

export default {
  name: "App",
  components: {
    RwvAppMenu,
    RwvUserMenu
  }
};
</script>

<style module>
body {
  background-color: #ecf0f5;
  font-family: "Open Sans", sans-serif;
}

.container {
  all: initial;
}
</style>
