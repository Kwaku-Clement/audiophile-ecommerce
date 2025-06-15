<template>
  <header class="bg-black text-white">
    <div class="container mx-auto px-4">
      <nav class="flex items-center justify-between py-6">
        <!-- Mobile menu button -->
        <button
          @click="toggleMobileMenu"
          class="md:hidden z-50"
          aria-label="Toggle menu"
          :class="{ 'text-orange-500': showMobileMenu }"
        >
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path
              v-if="!showMobileMenu"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M4 6h16M4 12h16M4 18h16"
            ></path>
            <path
              v-else
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M6 18L18 6M6 6l12 12"
            ></path>
          </svg>
        </button>

        <!-- Logo -->
        <NuxtLink
          to="/"
          class="text-2xl font-bold hover:text-orange-500 transition-colors"
          @click="closeMobileMenu"
        >
          audiophile
        </NuxtLink>

        <!-- Desktop Navigation -->
        <nav class="hidden md:flex space-x-8">
          <NuxtLink
            to="/"
            class="hover:text-orange-500 transition-colors font-medium"
            active-class="text-orange-500"
            exact-active-class="text-orange-500"
          >
            HOME
          </NuxtLink>
          <NuxtLink
            to="/headphones"
            class="hover:text-orange-500 transition-colors font-medium"
            active-class="text-orange-500"
          >
            HEADPHONES
          </NuxtLink>
          <NuxtLink
            to="/speakers"
            class="hover:text-orange-500 transition-colors font-medium"
            active-class="text-orange-500"
          >
            SPEAKERS
          </NuxtLink>
          <NuxtLink
            to="/earphones"
            class="hover:text-orange-500 transition-colors font-medium"
            active-class="text-orange-500"
          >
            EARPHONES
          </NuxtLink>
        </nav>

        <!-- Cart -->
        <button
          @click="cartStore.toggleCart()"
          class="relative hover:text-orange-500 transition-colors z-50"
          aria-label="Shopping cart"
        >
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4m0 0L7 13m0 0l-2.5 5M7 13l2.5 5m6-5v6a2 2 0 11-4 0v-6m4 0V9a2 2 0 10-4 0v4.01"></path>
          </svg>
          <span
            v-if="cartCount > 0"
            class="absolute -top-2 -right-2 bg-orange-500 text-white text-xs rounded-full w-5 h-5 flex items-center justify-center font-bold"
          >
            {{ cartCount }}
          </span>
        </button>
      </nav>

      <!-- Mobile Navigation -->
      <Transition
        enter-active-class="transition-all duration-300 ease-out"
        enter-from-class="opacity-0 max-h-0"
        enter-to-class="opacity-100 max-h-96"
        leave-active-class="transition-all duration-300 ease-in"
        leave-from-class="opacity-100 max-h-96"
        leave-to-class="opacity-0 max-h-0"
      >
        <nav
          v-if="showMobileMenu"
          class="md:hidden pb-6 border-t border-gray-800 pt-6 overflow-hidden"
          :key="`mobile-menu-${showMobileMenu}`"
        >
          <div class="flex flex-col space-y-4">
            <NuxtLink
              to="/"
              class="hover:text-orange-500 transition-colors font-medium text-lg"
              active-class="text-orange-500"
              exact-active-class="text-orange-500"
              @click="closeMobileMenu"
            >
              HOME
            </NuxtLink>
            <NuxtLink
              to="/headphones"
              class="hover:text-orange-500 transition-colors font-medium text-lg"
              active-class="text-orange-500"
              @click="closeMobileMenu"
            >
              HEADPHONES
            </NuxtLink>
            <NuxtLink
              to="/speakers"
              class="hover:text-orange-500 transition-colors font-medium text-lg"
              active-class="text-orange-500"
              @click="closeMobileMenu"
            >
              SPEAKERS
            </NuxtLink>
            <NuxtLink
              to="/earphones"
              class="hover:text-orange-500 transition-colors font-medium text-lg"
              active-class="text-orange-500"
              @click="closeMobileMenu"
            >
              EARPHONES
            </NuxtLink>
          </div>
        </nav>
      </Transition>
    </div>
  </header>
</template>

<script setup>
import { ref, onMounted, onUnmounted, watch } from 'vue'
import { useRoute } from 'vue-router'
import { useCartStore } from '~/stores/cart'

const route = useRoute()
const cartStore = useCartStore()

defineProps({
  cartCount: {
    type: Number,
    default: 0
  }
})

const showMobileMenu = ref(false)

const toggleMobileMenu = () => {
  showMobileMenu.value = !showMobileMenu.value
}

const closeMobileMenu = () => {
  showMobileMenu.value = false
}

watch(() => route.path, () => {
  closeMobileMenu()
})

const handleClickOutside = (event) => {
  if (showMobileMenu.value && !event.target.closest('header')) {
    closeMobileMenu()
  }
}

onMounted(() => {
  document.addEventListener('click', handleClickOutside)
})

onUnmounted(() => {
  document.removeEventListener('click', handleClickOutside)
})

onMounted(() => {
  showMobileMenu.value = false
})
</script>