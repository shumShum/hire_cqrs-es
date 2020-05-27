<template>
  <div class="workspace">
    <div class="header">Вакансии</div>
    <RwvWorkerDesk v-if="isWorker" :jobs="jobs" :currentJob="user.job"></RwvWorkerDesk>
    <RwvCompanyDesk v-else :jobs="jobs"></RwvCompanyDesk>
  </div>
</template>

<script>
import { currentUserQuery } from "../graphql/user.queries.js";
import { allJobsQuery } from "../graphql/job.queries.js";

import RwvWorkerDesk from "../components/WorkerDesk";
import RwvCompanyDesk from "../components/CompanyDesk";

export default {
  name: "RwvJobs",
  data() {
    return {
      user: {},
      jobs: []
    };
  },
  components: {
    RwvWorkerDesk,
    RwvCompanyDesk
  },
  apollo: {
    user: { query: currentUserQuery },
    jobs: { query: allJobsQuery }
  },
  computed: {
    isWorker: function() {
      return this.user.type == "WORKER";
    }
  }
};
</script>

<style>
.workspace {
  margin-left: 288px;
  margin-top: 38px;
}

.header {
  margin-left: 18px;
  top: 0%;

  font-family: Roboto;
  font-style: normal;
  font-weight: 300;
  font-size: 28px;
  line-height: 32px;

  color: #373a3c;
}

.desk {
  margin-top: 16px;
  margin-right: 32px;

  padding-top: 15px;
  padding-left: 18px;
  padding-right: 18px;
  padding-bottom: 15px;

  background: #ffffff;
  border-radius: 4px;
}

.desk-header {
  display: block;
  margin-bottom: 12px;

  font-family: Roboto;
  font-style: normal;
  font-weight: 200;
}
.desk-header .title {
  display: block;
  font-size: 20px;
}
.desk-header .subtitle {
  display: inline-block;
  font-size: 15px;
}

.cards {
  display: flex;
  flex-wrap: wrap;
}
.cards .new {
  align-self: flex-start;
}

.card {
  position: relative;

  width: 320px;

  padding-left: 18px;
  padding-top: 18px;
  padding-bottom: 28px;

  margin-right: 20px;
  margin-bottom: 15px;

  border: 1px solid #dfdfdf;
  box-sizing: border-box;
  border-radius: 4px;

  font-family: Roboto;
  font-style: normal;
}

.card-title {
  font-weight: 400;
  font-size: 18px;
  line-height: 19px;

  margin-bottom: 15px;
}

.card-body-text {
  font-weight: 300;
  font-size: 16px;
  line-height: 24px;

  margin-right: 20px;
  margin-bottom: 28px;
}

.card-link {
  position: absolute;
  bottom: 10px;
}

.card-btn a {
  position: absolute;
  bottom: 13px;

  background: #0275d8;
  border-radius: 4px;

  padding: 8px 12px;

  color: #ffffff;
  font-size: 16px;
  line-height: 21px;
}
</style>
