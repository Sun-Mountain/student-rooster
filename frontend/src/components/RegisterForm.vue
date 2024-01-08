<template>
  <h1>Register</h1>
  <form @submit="submitForm">
    <div class="form-input-container">
      <label for="username">Username:</label><br />
      <input type="text" id="name" v-model="username" required>
    </div>
    <div class="form-input-container">
      <label for="email">Email:</label><br />
      <input type="email" id="email" v-model="email" required>
    </div>
    <div class="form-input-container">
      <label for="password">Password:</label><br />
      <input type="password" id="password" v-model="password" required>
    </div>
    <div class="submit-btn-container">
      <button type="submit">Register</button>
    </div>
  </form>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { useUserStore } from '@/stores';
import { type Register } from '@/types';
import { useRouter } from 'vue-router';

const router = useRouter();

const username = ref('');
const email = ref('');
const password = ref('');

async function submitForm(e: Event) {
  e.preventDefault();
  const userStore = useUserStore();
  const user: Register = {
    username: username.value,
    email: email.value,
    password: password.value,
  };
  await userStore.register(user);
  router.push('/');
}

</script>

<style scoped>
/* Add your custom styles here */
</style>
