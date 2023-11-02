<script setup>
import {ref, defineEmits} from 'vue';
import {updateScore, increaseHighScore, resetScore, session} from '@/stores/session';
import GameMenu from './GameMenu.vue';
import TimerComponent from './TimerComponent.vue';
const timerComponentRef = ref(null);
const timeLeft = 30;
const questionDto = ref(null);
const selectedAnswer = ref(null);
const answerSubmitted = ref(false);
const isCorrectAnswer = ref(false);
const showCorrectMessage = ref(false);
const showQuestionDisplay = ref(true);
const shouldUpdateQuestion = ref(true);
const emits = defineEmits();
const isWaiting = ref(false);
let finalScore = session.score;
let highestSessionScore = finalScore;

function throwCustomError() {
  throw new Error("Network response error");
}

const handleTimerExpired = () => {
  handleWrongAnswer();
};

const handleWrongAnswer = () => {
  emits('incorrect-answer-clicked');
  showQuestionDisplay.value = false;
  timerComponentRef.value.stopTimer();
  resetScore();
  isWaiting.value = false;
};

const fetchRandomQuestion = async () => {
  try {
    const response = await fetch('/api/quiz', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        id: session.userId,
      }),
    });

    if (!response.ok) {
      throwCustomError();
    }

    let question = await response.json()

    if (question != null) {
      questionDto.value = question;

      timerComponentRef.value.resetTimer();
      timerComponentRef.value.startTimer();
    } else {
      throwCustomError()
    }

  } catch (error) {
    console.log('no more questions')
    await router.push('/end');
  }
};

const checkAnswer = async () => {
  try {
    const response = await fetch('/api/check-answer', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        userId: session.userId,
        id: questionDto.value.id,
        selectedAnswer: selectedAnswer.value,
      }),
    });
    if (!response.ok) {
      throwCustomError();
    }

    const result = await response.json();
    answerSubmitted.value = true;
    isCorrectAnswer.value = result.correct;
    return result.correct;

  } catch (error) {
    console.error(error);
    return false;
  }
};

const submitAnswer = (selectedOption) => {
  if (isWaiting.value) {
    return;
  }
  isWaiting.value = true;
  selectedAnswer.value = selectedOption;
  checkAnswer(selectedOption)
      .then((isCorrect) => {
        if (isCorrect) {
          updateScore(1);
          increaseHighScore(1);

          if (session.score > highestSessionScore) {
            highestSessionScore = session.score;
          }
          showCorrectMessage.value = true;
          shouldUpdateQuestion.value = false;

          timerComponentRef.value.stopTimer();
          setTimeout(() => {
            showCorrectMessage.value = false;
            shouldUpdateQuestion.value = true;
            isWaiting.value = false;
            fetchRandomQuestion();
          }, 1000);
        } else {
          handleWrongAnswer();
        }
      })
      .catch((error) => {
        console.error('Error:', error);
      });
};


import {onMounted} from 'vue';
import router from "@/router";

onMounted(() => {
  fetchRandomQuestion();
});

</script>
<template>
  <div class="flex flex-col items-center justify-center">
    <TimerComponent
        :timeLeft="timeLeft"
        @timerExpired="handleTimerExpired"
        ref="timerComponentRef"/>
    <div v-if="showQuestionDisplay && questionDto"
         class="w-full max-w-5xl p-4 bg-white bg-opacity-70 rounded-br-2xl rounded-bl-2xl shadow-lg">
      <p class="text-gray-800 font-bold text-2xl"> {{ questionDto.questionText }} </p>
      <div class="mt-4">
        <div class="grid grid-cols-1 gap-4">
          <div class="relative">
            <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center" v-if="showCorrectMessage">
              <div class="responsive-container">
                <p class="text-lg text-gray-700 font-bold bigger-text">Correct answer!</p>
              </div>
            </div>
            <div class="grid grid-cols-2 gap-4">
              <button
                  v-for="option in questionDto.options"
                  :key="option"
                  @click="submitAnswer(option)"
                  class="responsive-square-button text-white text-1xl font-medium py-2 px-2 rounded bg-violet-500 hover:bg-violet-600 focus:outline-none"
              >
                {{ option }}
              </button>
            </div>
          </div>
        </div>
        <div
            class="relative flex items-center bg-gray-100 text-gray-700 hover:text-gray-950 hover-bg-gray-50 transition duration-200"
            style="padding: 15px; width: fit-content; border-radius: 10px; margin-top: 10px;"
        ><span class="font-semibold">Your current score: {{ session.score }} </span>
        </div>
      </div>
    </div>
    <template v-else>
      <GameMenu :latestScore="parseInt(session.score)" :highScore="parseInt(session.highscore)"
                :highestSessionScore="parseInt(highestSessionScore)"/>
    </template>
  </div>
</template>

<style scoped>
.responsive-square-button {
  width: 100%;
  padding-top: 15%;
  padding-bottom: 15%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.responsive-container {
  position: absolute;
  background-color: white;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);
  display: flex;
  align-items: center;
  justify-content: center;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 60%;
  height: 40%;
}

.bigger-text {
  font-size: 2.5rem; /* Adjust the font size as needed */
}
</style>