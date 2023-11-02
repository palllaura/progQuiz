<template>
  <div class="center">
    <Welcome/>
  </div>
</template>

<style scoped>
.center {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh; /* Center vertically within the viewport. */
}
</style>
<script setup>
import Welcome from "@/components/Welcome.vue";
</script>