<template>
  <div class="flex flex-col items-center justify-center">
    <p class="bg-opacity-0 text-xs tracking-tight text-gray-400">If you are enjoying this game please consider donating money to us!</p>
    <header class="w-full max-w-5xl shadow-lg mb-1.5 mt-1.5">

      <nav class="relative px-4 py-1 flex justify-between items-center bg-white">
        <div class="flex-shrink-0">
          <router-link to="/welcome"><img class="mx-auto h-8 w-auto opacity-80" src="@/assets/codelogo.png" alt="Our logo"></router-link>
        </div>

        <div class="lg:hidden">
          <button class="navbar-burger flex items-center text-gray-600 p-3">
            <Bars3Icon class="h-6 w-6"/>
          </button>
        </div>

        <ul class="hidden relative lg:flex lg:mx-auto lg:items-center">

          <li class="ml-2 items-center flex space-x-2 ">
            <div class="relative flex items-center rounded-full p-3 text-gray-700">
              <span class="font-semibold">Hello, {{user.name}}!</span>
            </div>
          </li>

          <li class="ml-2 items-center flex space-x-2 ">
            <a href="/quiz">
            <button type="button" class="relative flex items-center rounded-full bg-gray-100 p-3 text-gray-700 hover:text-gray-950 hover:bg-gray-50 transition duration-200">
              <span  class="font-semibold">Start quiz</span>
              <PlayIcon class="h-5 w-5 ml-1"/> <!-- Add margin for spacing -->
            </button>
            </a>
          </li>

          <li class="ml-2 items-center flex space-x-2 ">
            <a href="/highscoreview">
              <button type="button" class="relative flex items-center rounded-full bg-gray-100 p-3 text-gray-700 hover:text-gray-950 hover:bg-gray-50 transition duration-200">
                <span  class="font-semibold">Top 10</span>
                <TrophyIcon class="h-5 w-5 ml-1"/> <!-- Add margin for spacing -->
              </button>
            </a>
          </li>

          <li class="ml-2 items-center flex space-x-2 ">
            <div class="relative flex items-center rounded-full p-3 text-gray-700">
              <span class="font-semibold">Your highscore: {{ user.highScore }}</span>
            </div>
          </li>

          <li class="ml-2 items-center flex space-x-2 ">
            <div class="relative flex items-center rounded-full p-3 text-gray-700">
              <span class="font-semibold">Current score: {{session.score}}</span>
            </div>
          </li>


        </ul>
        <div class="hidden lg:inline-block lg:ml-auto lg:mr-3 py-2 px-6 ">
          <button @click="logout" type="button" title="Logout" class="relative flex items-center rounded-full bg-gray-100 p-3 text-gray-700 hover:text-gray-950 hover:bg-gray-50 transition duration-200">
            <span  class="font-semibold">Sign out</span>
            <PowerIcon class="h-5 w-5 ml-1"/> <!-- Add margin for spacing -->
          </button>
        </div>
      </nav>

      <div class="navbar-menu relative z-50 hidden">
        <div class="navbar-backdrop inset-0 bg-gray-800 opacity-25"></div>
        <nav class="fixed top-0 left-0 bottom-0 flex flex-col w-5/6 max-w-sm py-6 px-6 bg-white border-r overflow-y-auto">

          <div class="flex items-stretch justify-between mb-8">
            <div class="flex-shrink-0">
              <router-link to="/welcome"><img class="mx-auto h-8 w-auto opacity-80" src="@/assets/codelogo.png" alt="Our logo"></router-link>
            </div>
            <button class="navbar-close">
              <XMarkIcon class="h-6 w-6"/>
            </button>
          </div>
          <ul>
          <li class="block p-4 hover:bg-gray-200 rounded"><a class="text-sm text-gray-900 font-bold" href="/quiz">Start Quiz</a></li>
          <li class="block p-4 hover:bg-gray-200 rounded"><a class="text-sm text-gray-900 font-bold" href="/highscoreview">Top 10</a></li>
          </ul>
          <div>
            <div class="pt-6">
            <button @click="logout" type="button" title="Logout" class="block px-4 py-3 mb-3 text-sm text-center font-semibold text-white leading-none bg-gray-800 hover:bg-gray-600 rounded-xl">
              Sign out
            </button>
          </div>
          </div>
        </nav>
      </div>

    </header>
  </div>
</template>


<script setup>
import { clearSession, session } from '@/stores/session'
import { PowerIcon, XMarkIcon, Bars3Icon, PlayIcon, TrophyIcon} from '@heroicons/vue/24/outline'
import { useRouter } from "vue-router"

const user = {
  name: session.name,
  email: session.email,
  highScore: session.highscore,
  score: session.score
}

const router = useRouter()

const logout = () => {
  // Clear the user session using the clearSession method
  clearSession()

  // Redirect to the login or home page, as per your app's design
  router.push('/'); // Replace '/login' with the path to your login page
}

// Burger menus
document.addEventListener('DOMContentLoaded', function() {
  // open
  const burger = document.querySelectorAll('.navbar-burger');
  const menu = document.querySelectorAll('.navbar-menu');

  if (burger.length && menu.length) {
    for (var i = 0; i < burger.length; i++) {
      burger[i].addEventListener('click', function() {
        for (var j = 0; j < menu.length; j++) {
          menu[j].classList.toggle('hidden');
        }
      });
    }
  }

  // close
  const close = document.querySelectorAll('.navbar-close');
  const backdrop = document.querySelectorAll('.navbar-backdrop');

  if (close.length) {
    for (var i = 0; i < close.length; i++) {
      close[i].addEventListener('click', function() {
        for (var j = 0; j < menu.length; j++) {
          menu[j].classList.toggle('hidden');
        }
      });
    }
  }

  if (backdrop.length) {
    for (var i = 0; i < backdrop.length; i++) {
      backdrop[i].addEventListener('click', function() {
        for (var j = 0; j < menu.length; j++) {
          menu[j].classList.toggle('hidden');
        }
      });
    }
  }
});
</script>
