<script setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import {setSession} from "@/stores/session";

const email = ref('');
const userId = ref('');
const password = ref('');
const loginMessage = ref('');
const router = useRouter();

async function send() {
  const data = {
    email: email.value,
    password: password.value
  }
  fetch('/api/login', {
    method: 'POST',
    headers: {"Content-Type": "application/json"},
    body: JSON.stringify(data),
  })
      .then(async response => {
        if (response.ok) {
          const responseData = await response.json();

          setSession(
              response.headers.get('X-Session-Token'),
              responseData.name,
              responseData.highscore,
              responseData.userId
          );

          console.log('Name:', responseData.name);
          console.log('Highscore:', responseData.highscore);

          await router.push('/welcome');
        } else {
          throw new Error('Login failed');
        }
      })
      .catch(error => {
        console.error('An error occurred:', error);
        loginMessage.value = 'Login failed. Email address or password is not correct.';
      });
};
</script>

<template>
  <div  class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
    <div class="sm:mx-auto sm:w-full sm:max-w-sm">
      <img class="mx-auto h-10 w-auto opacity-80" src="@/assets/codelogo.png" alt="Our logo">
      <h2 class="mt-10 text-left text-1xl font-bold leading-9 tracking-tight text-gray-800">Sign in to your account:</h2>
    </div>
    <div class="mt-5 sm:mx-auto sm:w-full sm:max-w-sm">
      <form class="space-y-6" onsubmit="return false;" method="POST">
        <div>
          <label for="email" class="block text-sm font-medium leading-6 text-gray-800">Email address</label>
          <div class="mt-2">
            <input v-model="email" name="email" type="email" autocomplete="email" required class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
          </div>
        </div>

        <div>
          <div class="flex items-center justify-between">
            <label for="password" class="block text-sm font-medium leading-6 text-gray-800">Password</label>
            <div class="text-sm">
              <router-link to="/register" class="font-semibold text-gray-800 hover:text-gray-900">Forgot password?</router-link>
            </div>
          </div>
          <div class="mt-2">
            <input v-model="password" name="password" type="password" autocomplete="current-password" required class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
          </div>
        </div>
        <p class="block text-sm font-bold leading-6 text-gray-900"
        >{{loginMessage}}</p>
        <div ref="loginForm">
          <button @click="send" type="submit" class="flex w-full justify-center rounded-md bg-gray-800 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-gray-900 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Sign in</button>
        </div>
      </form>

      <p class="mt-10 text-center text-sm text-gray-800">
        Not a member?
        <router-link to="/register" class="font-semibold leading-6 text-gray-800 hover:text-gray-900">Register here!</router-link>
      </p>

    </div>
  </div>
</template>