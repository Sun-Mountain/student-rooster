<template>
  <form @submit="submitForm">
    <div>
      <label for="username">Username:</label>
      <input type="text" id="name" v-model="username" required>
    </div>
    <div>
      <label for="email">Email:</label>
      <input type="email" id="email" v-model="email" required>
    </div>
    <div>
      <label for="password">Password:</label>
      <input type="password" id="password" v-model="password" required>
    </div>
    <button type="submit">Register</button>
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
