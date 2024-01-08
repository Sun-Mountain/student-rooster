<script setup lang="ts">
import { RouterView } from 'vue-router'
import MainNav from '@/components/shared/MainNav.vue';
</script>

<template>
  <header>
    <MainNav />
  </header>

  <main>
    <RouterView />
  </main>

  <footer>
    Footer
  </footer>
</template>


<style lang="scss">
@import "@/assets/scss/application.scss";
</style>