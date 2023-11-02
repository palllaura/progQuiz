<script setup>
</script>

<template>
  <div class="page">
    <div class="container">
      <p class="header opacity-80">Enjoy programming? Enjoy quizzes?</p>
      <div class="text-fade">
        <p class="text">
        In programming, what is a "syntax error"?
        What does the term "API" stand for in the context of libraries?
        In Java, what is the purpose of the "final" keyword for variables?
        What is the "syntax highlighting" feature in code editors?
        What is the primary goal of the clean code principle "Keep it DRY"?
        What is the role of "media queries" in CSS?
        In version control systems, what does "GIT" signify?
        What is the primary purpose of a Data Transfer Object (DTO) in software development?
        What does the clean code principle "KISS" stand for?
        What does "full-stack programming" refer to?
        Why is not keeping track of code changes a common error for programmers?
        In programming, what does "algorithm" refer to?
        What does "debugging" refer to in the context of software development tools?
        What is the primary function of a "web browser" in web development?
        What is the purpose of "HTTP" in web development?
        What is the purpose of a "project README" file?
        How can technology and remote work affect work-life balance?
        What is the primary purpose of comments in code?
        What is the primary purpose of a "while" loop in programming?
        In the MVC architectural pattern, what is the role of a "controller"?
        What is a "primary key" in a database table?
        What is the main purpose of a "function" in programming?
        What does a "service" typically do in a software application?
        </p>
      </div>
      <h1 class="header">Welcome to progQuiz.</h1>
    </div>
  </div>
</template>

<style scoped>
.page {
  display: flex;
  justify-content: right;
  align-items: center;
  text-align: right;
}

.container {
  padding-top: 100px;
  overflow: hidden;
  text-align: left;
  color: rgb(73, 77, 151);
  position: relative;
}

.header {
  margin-bottom: 20px;
  font-size: xx-large;
  font-weight: bold;
}

.text-fade {
  mask-image: linear-gradient(to top, transparent 0%, white 50%, white 100%);
  position: relative;
  z-index: 1;
}

.text {
  font-size: small;
  color: white;
  text-align: justify;
}
</style>