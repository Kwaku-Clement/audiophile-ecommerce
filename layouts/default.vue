<template>
    <div id="app" :key="routeKey">
      <Header :cart-count="cartStore.totalItems" />
      <main class="min-h-screen">
        <slot />
      </main>
      <Footer />
      <CartModal v-if="cartStore.showCart" @close="cartStore.toggleCart" @checkout="openCheckout" />
    </div>
  </template>

  <script setup>
  import { computed, onMounted } from 'vue'
  import { useRoute } from 'vue-router'
  import { useCartStore } from '~/stores/cart'
  import Header from '~/components/Header.vue'
  import Footer from '~/components/Footer.vue'
  import CartModal from '~/components/CartModal.vue'

  const route = useRoute()
  const cartStore = useCartStore()

  const routeKey = computed(() => route.fullPath)

  const openCheckout = () => {
    cartStore.showCart = false
    window.dispatchEvent(new CustomEvent('open-checkout'))
  }

  onMounted(() => {
    cartStore.loadFromLocalStorage()
    window.addEventListener('route-changed', () => {
      cartStore.showCart = false
      window.scrollTo(0, 0)
    })
  })

  provide('error', ref(null))
  </script>

  <style>
  #app {
    transition: opacity 0.2s ease-in-out;
  }

  @media (max-width: 768px) {
    body {
      overflow-x: hidden;
    }
  }
  </style>