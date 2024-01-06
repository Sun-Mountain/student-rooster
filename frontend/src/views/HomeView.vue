<script setup lang="ts">
import LoginForm from '@/components/LoginForm.vue';
import RegisterForm from '@/components/RegisterForm.vue';
import { useAuthStore } from '@/stores';

const authStore = useAuthStore();
</script>

<template>
  <h1>Home</h1>
  <p v-if="!authStore.isAuthenticated">
    <RegisterForm />
    or
    <LoginForm />
  </p>
  <p v-else>
    You are logged in as {{ authStore.currentUser?.email }}
    <p>
      <button @click="authStore.logout()">
        Logout
      </button>
    </p>
  </p>
</template>
