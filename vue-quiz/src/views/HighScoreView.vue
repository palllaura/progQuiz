<script>
import HighScores from '../components/HighScores.vue';  // Import the HighScore component
import Header from '../components/Header.vue';
import QuestionDisplay from "@/components/QuestionDisplay.vue";
export default {
  components: {
    QuestionDisplay,
    HighScores,
    Header
  },
};
</script>

<template>
  <main>
    <Header />
    <HighScores />
  </main>
</template>
