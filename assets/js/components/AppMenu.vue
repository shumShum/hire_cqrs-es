<template>
  <div class="menu">
    <div class="menu-header">
      <div class="menu-logo">
        <a href="/jobs">Hire CQRS/ES test app</a>
        <router-link exact :to="{ name: 'jobs' }">Hire CQRS/ES test app</router-link>
      </div>
    </div>
    <div class="menu-items">
      <ul class="menu-section">
        <li class="head">{{ user.name }}</li>
        <li v-for="item in items" :key="item" class="item">{{ item }}</li>
      </ul>
    </div>
  </div>
</template>

<script>
import { currentUserQuery } from "../graphql/user.queries.js";

export default {
  name: "RwvAppMenu",
  data() {
    return {
      user: {}
    };
  },
  apollo: {
    user: {
      query: currentUserQuery
    }
  },
  computed: {
    items: function() {
      var user = this.user;
      var job = user.job;

      if (user.type == "COMPANY") {
        return ["🏫 Компания"];
      } else if (job == null) {
        return ["😔 Безработный"];
      } else {
        return [
          "👨‍🔧 " + job.title,
          "🏫 " + job.company.name,
          "💰 " + job.salary + " $"
        ];
      }
    }
  }
};
</script>

<style>
.menu {
  position: fixed;
  left: 0;
  top: 0;
  bottom: 0;
  width: 256px;
  height: 100%;

  background: #14203d;
  box-shadow: 3px 0px 2px rgba(0, 0, 0, 0.1);
}

.menu-header {
  position: absolute;
  width: 100%;
  height: 64px;
  top: 0%;

  background: #f8be4c;
}

.menu-header i {
  position: absolute;
  top: 20px;
  right: 20px;

  font-size: 26px;
  line-height: 24px;
  text-align: right;
}

.menu-logo a {
  position: absolute;
  left: 27px;
  top: 20px;

  font-family: Blinker, sans-serif;
  font-style: normal;
  font-weight: bold;
  font-size: 23px;
  line-height: 24px;

  text-decoration: none;
  text-align: center;
  color: #14203d;
}

.menu-items {
  position: absolute;
  left: 31px;
  top: 118px;
  width: 100%;

  align-items: flex-end;
  text-align: left;
}

.menu-section {
  display: inline-block;
  width: 100%;
  padding: 0px;

  font-family: Roboto, sans-serif;
  font-style: normal;
  font-weight: 300;
  font-size: 16px;
  line-height: 24px;

  list-style-type: none;
}
.menu-section .head {
  font-weight: bold;
  margin-bottom: 10px;
  text-transform: uppercase;
  color: #cccccc;
}
.menu-section .item a,
li {
  margin-bottom: 10px;
  color: #ffffff;
}
</style>
