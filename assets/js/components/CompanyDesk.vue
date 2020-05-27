<template>
  <div class="desk">
    <div class="desk-header">
      <div v-if="jobs.length > 0" class="title">Открытые вакансии в вашей компании</div>
      <div v-else class="title">В вашей компании нет открытых вакансий</div>
    </div>

    <div class="cards">
      <div v-for="job in jobs" :key="job.id" class="card">
        <div class="card-title">{{ job.title }}</div>
        <div class="card-body-text">
          {{ "💰 " + job.salary + " $" }}
          <br />
          {{ "👨‍🔧 Квота: " + job.workers.length + "/" + job.limit }}
        </div>
        <div class="card-link">
          <a href="#">Изменить</a>
        </div>
      </div>

      <div class="card new">
        <div class="card-title">Новая вакансия</div>
        <div
          class="card-body-text"
        >Нажмите кнопку "Создать", чтобы перейти к процессу создания вакансии</div>
        <div class="card-btn">
          <a href="#">Создать</a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "RwvCompanyDesk",
  props: {
    jobs: { type: Array, required: true }
  }
};
</script>

<style>
</style>