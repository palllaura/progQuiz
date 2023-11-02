<script setup>

import Header from "@/components/Header.vue";
</script>

<template>
  <Header />
  <div class="page">
    <div class="container">
      <img class="mx-auto h-20 w-auto opacity-80" src="@/assets/codelogo.png" alt="Our logo">
      <p class="text">Enjoy programming? Enjoy quizzes?</p>
      <br>
      <router-link to="/quiz">
        <button
            type="button"
            class="btn">
          Letsgo!
        </button>
      </router-link>
    </div>

  </div>
</template>

<style scoped>
.page {
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.container {
  padding-top: 100px;
  overflow: hidden; /* Add overflow to the container */
  text-align: center;
  color: rgb(9, 9, 9);
}

.header {
  margin-bottom: 20px;
  font-size: xx-large;
  font-weight: bold;
}

.text {
  font-size: x-large;
}

.btn {
  background-color: rgb(9, 9, 9);
  color: white;
  font-weight: bold;
  font-size: larger;
  padding: 10px 20px;
  border: none;
  border-radius: 25px;
  cursor: pointer;
}
</style>