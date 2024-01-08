<script setup lang="ts">
import { computed } from 'vue';
import { RouterLink } from 'vue-router';
import { useAuthStore } from '@/stores';

const authStore = useAuthStore();
const userAuthenticated = computed(() => authStore.isAuthenticated);
</script>

<template>
  <nav id="main-navigation">
    <RouterLink to="/" class="main-nav-link">Home</RouterLink>
    <RouterLink to="/about" class="main-nav-link">About</RouterLink>
    <RouterLink to="/register" class="main-nav-link" v-show="!userAuthenticated">Register</RouterLink>
  </nav>
</template>