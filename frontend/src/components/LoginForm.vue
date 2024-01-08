<script setup lang="ts">
import { ref } from 'vue';
import { useAuthStore } from '@/stores';
import { type Login } from '@/types';
import { FormField } from '@/components';

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
    <div class="form-input-container">
      <label for="email">Email:</label><br />
      <input type="email" id="email" v-model="email" required>
    </div>
    <div class="form-input-container">
      <label for="password">Password:</label><br />
      <input type="password" id="password" v-model="password" required>
    </div>
    <div class="submit-btn-container">
      <button type="submit">Login</button>
    </div>
  </form>
</template>