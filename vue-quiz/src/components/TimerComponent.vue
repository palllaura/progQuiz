<template>
  <div class="menu-container w-full max-w-5xl p-1 bg-white bg-opacity-70 shadow-lg">
    <div class="timer-container rounded-br-2xl rounded-bl-2xl">
      <div class="timer-bar rounded-br-2xl rounded-bl-2xl" :style="{ width: `${(timeLeft / 30) * 100}%` }"></div>
    </div>
  </div>
</template>

<script>

export default {
  data() {
    return {
      timeLeft: 30,
      countdown: null,
    };
  },
  mounted() {
    console.log('TimerComponent is mounted');
    this.startTimer();
  },
  methods: {
    startTimer() {
      if (this.countdown === null) {
        this.countdown = setInterval(() => {
          if (this.timeLeft > 0) {
            this.timeLeft -= 1;
          } else {
            clearInterval(this.countdown);
            this.$emit('timerExpired');
          }
        }, 1000);

      }
    },
    stopTimer() {
      clearInterval(this.countdown);
      this.countdown = null;
    },
    resetTimer() {
      this.timeLeft = 30;
    },
  },

  beforeDestroy() {
    clearInterval(this.countdown);
  },
};

</script>


<style scoped>

.timer-container {
  width: 100%;
  height: 10px;
  border-radius: 10px;
  background-color: white;
  position: relative;
}

.timer-bar {
  height: 100%;
  border-radius: 10px;
  background-color: blueviolet;
  transition: width 1s linear;
}

.menu-container {
  position: relative;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 40%;
  margin: 5px;
}
</style>
