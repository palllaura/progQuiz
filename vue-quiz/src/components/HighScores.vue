<template>
  <div class="flex flex-col items-center">
    <div class="overflow-x-auto w-full max-w-5xl bg-white bg-opacity-70 rounded-br-2xl rounded-bl-2xl shadow-lg">
      <table class="w-full max-w-5xl">
        <thead class="text-gray-800">
        <tr>
          <th class="px-5 py-5 text-2xl font-bold mb-4 text-left">Top 10 Players</th>
          <th class="px-5 text-2xl font-bold mb-4 text-left"></th>
        </tr>
        <tr>
          <th class="px-5 py-2 text-left">#</th> <!-- Add this column for numbers -->
          <th class="px-5 py-2 text-left">Name</th>
          <th class="px-5 py-2 text-left">High Score</th>
        </tr>
        </thead>
        <tbody>
        <tr
            v-for="(score, index) in highScores"
            :key="score.id"
            class="bg-white bg-opacity-70"
            :class="{ 'highlighted-row': score.name === session.name }"
        >
          <td class="px-5 py-2 border border-gray-200">{{ index + 1 }}</td> <!-- Display the ordinal position -->
          <td class="px-5 py-2 border border-gray-200">{{ score.name }}</td>
          <td class="px-5 py-2 border border-gray-200">{{ score.highscore }}</td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import {session} from "@/stores/session";

const highScores = ref([]);

onMounted(async () => {
  try {
    const response = await fetch('/api/highscores'); // Use the correct API endpoint
    const data = await response.json();
    highScores.value = data;
  } catch (error) {
    console.error('Error fetching high scores:', error);
  }
});
</script>


<style scoped>
.highlighted-row {
  color: white;
  background-color: rgba(0, 0, 0, 0.8);
}
</style>
