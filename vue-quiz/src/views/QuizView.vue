<script>
import QuestionDisplay from "@/components/QuestionDisplay.vue";
import Header from "@/components/Header.vue";
import TimerComponent from "@/components/TimerComponent.vue";

export default {

  components: {

    Header,
    QuestionDisplay,
    TimerComponent,
  },
  data() {
    return {
      showGameMenu: false,
      showQuestionDisplay: true,
      TimerComponent: null,
    };
  },
};

</script>

<template>

  <div>
    <Header/>
    <QuestionDisplay @incorrect-answer-clicked="showGameMenu = true" ref="questionDisplayRef"></QuestionDisplay>
  </div>
</template>
