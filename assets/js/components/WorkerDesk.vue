<template>
  <div class="desk">
    <div class="desk-header">
      <div v-if="jobs.length > 0" class="title">Найдите себе новую работу</div>
      <div v-else class="title">Работы сейчас нет, но вы держитесь</div>
    </div>

    <div class="cards">
      <div
        v-for="job in jobs"
        :key="job.id"
        class="card"
        :set="salaryDiff = currentJob.salary - job.salary"
      >
        <div class="card-title">{{ job.title }}</div>
        <div class="card-body-text">
          {{ "🏫 " + job.company.name }}
          <br />
          {{ "💰 " + job.salary + " $" }}
          <span v-if="salaryDiff == 0" class="salary_diff">🚹</span>
          <span v-if="salaryDiff > 0" class="salary_diff red-diff">{{ "(▼ " + salaryDiff + " $)" }}</span>
          <span
            v-if="salaryDiff < 0"
            class="salary_diff green-diff"
          >{{ "(▲ " + -salaryDiff + " $)" }}</span>

          <div class="form">
            <b-button variant="outline-primary">Хочу!</b-button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "RwvWorkerDesk",
  props: {
    jobs: { type: Array, required: true },
    currentJob: Object
  }
};
</script>

<style>
.salary_diff.red-diff {
  color: red;
}
.salary_diff.green-diff {
  color: green;
}

.form button {
  margin-top: 20px;
}
</style>
