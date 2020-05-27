<template>
  <nav class="user-nav">
    <b-dropdown id="user-nav-drop" right split :text="user.name" variant="default">
      <b-dropdown-item>🚪 Выйти</b-dropdown-item>
    </b-dropdown>
  </nav>
</template>

<script>
import { currentUserQuery } from "../graphql/user.queries.js";

export default {
  name: "RwvUserMenu",
  data() {
    return {
      user: {}
    };
  },
  apollo: {
    user: {
      query: currentUserQuery
    }
  }
};
</script>

<style>
.user-nav {
  position: absolute;
  display: block;
  right: 0;
  top: 0;
  padding-top: 26px;
  padding-right: 32px;
}

.user-nav .btn {
  background: #ffffff;
  border-color: #aaaaaa;
  border-width: 1px;
  text-transform: none;

  font-family: Roboto, sans-serif;
  font-style: normal;
  font-weight: 300;
  font-size: 13px;
  padding-left: 15px;
  padding-right: 15px;
}

.user-nav .dropdown-menu {
  padding: 0.25rem 10px 0.25rem 10px;
  min-width: 3rem;
}

.user-nav .dropdown-item {
  font-size: 13px;
  padding: 0.25rem 10px 0.25rem 10px;
  font-family: Roboto, sans-serif;
}
</style>
