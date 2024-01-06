<script setup lang="ts">
import { RouterLink, RouterView } from 'vue-router'
</script>

<template>
  <header>
    <nav id="main-navigation">
      <RouterLink to="/" class="main-nav-link">Home</RouterLink> |
      <RouterLink to="/about" class="main-nav-link">About</RouterLink>
    </nav>
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