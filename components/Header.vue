<template>
  <header class="bg-black text-white">
    <div class="container mx-auto px-4">
      <nav class="flex items-center justify-between py-6">
        <!-- Mobile menu button -->
        <button
          @click="toggleMobileMenu"
          class="md:hidden"
          aria-label="Toggle menu"
        >
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
          </svg>
        </button>

        <!-- Logo -->
        <NuxtLink to="/" class="text-2xl font-bold">
          audiophile
        </NuxtLink>

        <!-- Desktop Navigation -->
        <nav class="hidden md:flex space-x-8">
          <NuxtLink to="/" class="hover:text-orange-500 transition-colors">HOME</NuxtLink>
          <NuxtLink to="/headphones" class="hover:text-orange-500 transition-colors">HEADPHONES</NuxtLink>
          <NuxtLink to="/speakers" class="hover:text-orange-500 transition-colors">SPEAKERS</NuxtLink>
          <NuxtLink to="/earphones" class="hover:text-orange-500 transition-colors">EARPHONES</NuxtLink>
        </nav>

        <!-- Cart -->
        <button
          @click="$emit('toggle-cart')"
          class="relative hover:text-orange-500 transition-colors"
          aria-label="Shopping cart"
        >
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4m0 0L7 13m0 0l-2.5 5M7 13l2.5 5m6-5v6a2 2 0 11-4 0v-6m4 0V9a2 2 0 10-4 0v4.01"></path>
          </svg>
          <span
            v-if="cartCount > 0"
            class="absolute -top-2 -right-2 bg-orange-500 text-white text-xs rounded-full w-5 h-5 flex items-center justify-center"
          >
            {{ cartCount }}
          </span>
        </button>
      </nav>

      <!-- Mobile Navigation -->
      <nav
        v-if="showMobileMenu"
        class="md:hidden pb-6 border-t border-gray-800 pt-6"
      >
        <div class="flex flex-col space-y-4">
          <NuxtLink to="/" class="hover:text-orange-500 transition-colors" @click="closeMobileMenu">HOME</NuxtLink>
          <NuxtLink to="/headphones" class="hover:text-orange-500 transition-colors" @click="closeMobileMenu">HEADPHONES</NuxtLink>
          <NuxtLink to="/speakers" class="hover:text-orange-500 transition-colors" @click="closeMobileMenu">SPEAKERS</NuxtLink>
          <NuxtLink to="/earphones" class="hover:text-orange-500 transition-colors" @click="closeMobileMenu">EARPHONES</NuxtLink>
        </div>
      </nav>
    </div>
  </header>
</template>

<script setup>
import { ref } from 'vue'

defineProps({
  cartCount: {
    type: Number,
    default: 0
  }
})

defineEmits(['toggle-cart'])

const showMobileMenu = ref(false)

const toggleMobileMenu = () => {
  showMobileMenu.value = !showMobileMenu.value
}

const closeMobileMenu = () => {
  showMobileMenu.value = false
}
</script>
