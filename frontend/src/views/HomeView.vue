<script setup lang="ts">
import LoginForm from '@/components/LoginForm.vue';
import RegisterForm from '@/components/RegisterForm.vue';
import { useAuthStore } from '@/stores';

const authStore = useAuthStore();
</script>

<template>
  <main>
    <h1>Home</h1>
    <p v-show="!authStore.isAuthenticated">
      <RegisterForm />
      or
      <LoginForm />
    </p>
    <p v-show="authStore.isAuthenticated">
      You are logged in as {{ authStore.user?.email }}
      <p>
        <button @click="authStore.logout()">
          Logout
        </button>
      </p>
    </p>
  </main>
</template>
