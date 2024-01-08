<script setup lang="ts">
import { ref } from 'vue';
import { useAuthStore } from '@/stores';
import { type Login } from '@/types';
import { useRouter } from 'vue-router';

const router = useRouter();

const email = ref('');
const password = ref('');

async function submitForm(e: Event) {
  e.preventDefault();
  const authStore = useAuthStore();
  const user: Login = {
    email: email.value,
    password: password.value,
  };
  await authStore.login(user);
}

</script>

<template>
  <h1>Login</h1>
  <form @submit="submitForm">
    <div>
      <label for="email">Email:</label>
      <input type="email" id="email" v-model="email" required>
    </div>
    <div>
      <label for="password">Password:</label>
      <input type="password" id="password" v-model="password" required>
    </div>
    <button type="submit">Login</button>
  </form>
</template>