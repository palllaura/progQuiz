<script setup>
import Register from '../components/Register.vue'
import Intro from "@/components/Intro.vue";
</script>

<template>
  <main class="flex flex-col md:flex-row justify-center items-center h-screen">
    <div class="hidden md:w-1/2 md:block p-4">
      <!-- Left Component -->
      <Intro/>
    </div>
    <div class="w-full md:w-1/2 p-4">
      <Register/>
      <!-- Right Component -->
    </div>
  </main>
</template>


