<script setup>
import {ref} from "vue";
import router from "@/router";
const usernameField = ref()
const emailField = ref()
const passwordField = ref()
const registrationMessage = ref("");
const registrationFailed = ref(false); // Add a flag to track registration failure

async function send() {
  const data = {
    name: usernameField.value,
    email: emailField.value,
    password: passwordField.value,
    highscore: 0,
  }
  fetch("/api/register", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data),
  })
      .then(async (response) => {
        if (response.ok) {
          await router.push("/");
        } else {
          throw new Error("Registration failed");
        }
      })
      .catch((error) => {
        console.error("An error occurred:", error);
        registrationMessage.value = "Registration failed. Username or email is already in use.";
        registrationFailed.value = true; // Set the registration failure flag
      });
};

const closeErrorModal = () => {
  registrationFailed.value = false; // Close the error modal
};
</script>

<template>

    <div class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
      <div class="sm:mx-auto sm:w-full sm:max-w-sm">
        <img class="mx-auto h-10 w-auto opacity-80" src="@/assets/codelogo.png" alt="Our logo">
        <h2 class="mt-10 text-left text-1xl font-bold leading-9 tracking-tight text-gray-800">Register your account:</h2>
      </div>


      <div class="mt-5 sm:mx-auto sm:w-full sm:max-w-sm">

        <form class="space-y-6" onsubmit="return false;" method="POST">

          <div>
            <label for="username" class="block text-sm font-medium leading-6 text-gray-800">Username</label>
            <div class="mt-2">
              <input v-model="usernameField" id="username" name="username" type="text" autocomplete="email" required class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-violet-600 sm:text-sm sm:leading-6">
            </div>
          </div>

          <div>
            <label for="email" class="block text-sm font-medium leading-6 text-gray-800">Email address</label>
            <div class="mt-2">
              <input v-model="emailField" id="email" name="email" type="email" autocomplete="email" required class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-violet-600 sm:text-sm sm:leading-6">
            </div>
          </div>

          <div>
            <div class="flex items-center justify-between">
              <label for="password" class="block text-sm font-medium leading-6 text-gray-800">Password</label>
              <div class="text-sm">
              </div>
            </div>
            <div class="mt-2">
              <input v-model="passwordField" id="password" name="password" type="password" autocomplete="current-password" required class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-violet-600 sm:text-sm sm:leading-6">
            </div>
          </div>
          <p class="block text-sm font-bold leading-6 text-gray-900"
          >{{registrationMessage}}</p>

          <div>
            <button @click="send" type="submit" class="flex w-full justify-center rounded-md bg-gray-800 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-gray-900 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-violet-600">Register</button>
          </div>
        </form>

        <p class="mt-10 text-center text-sm text-gray-800">
          Already have an account?
          <router-link to="/" class="font-semibold leading-6 text-gray-800 hover:text-gray-900">Sign in here!</router-link>
        </p>
      </div>
    </div>

</template>
