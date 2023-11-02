<template>
  <div class="menu-container w-full max-w-5xl p-4 bg-white bg-opacity-70 rounded-br-2xl rounded-bl-2xl shadow-lg">
    <p class="text-gray-800 font-bold text-4xl mb-4">Game over!</p>
    <p class="text-gray-800 mb-2">Final Score: <span class="font-bold text-xl">{{ highestSessionScore }}</span></p>
    <p class="text-gray-800 mb-2">High Score: <span class="font-bold text-xl">{{ session.highscore }}</span></p>
    <button class="btn" @click="restartGame">Try again!</button>
  </div>
</template>

<script>
import {session} from "@/stores/session";

export default {
  computed: {
    session() {
      return session
    }
  },
  props: {
    highestSessionScore: Number,
    showMenu: Boolean,
    latestScore: Number,
    highScore: Number,
  },
  methods: {
    restartGame() {
      window.location.reload();
    }
  }
};
</script>

<style scoped>
.menu-container {
  text-align: center;
  padding: 70px;
  border: 1px solid #ccc;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
}

button {
  padding: 10px 20px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
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