<template>
    <div id="app">
      <Header
        @toggle-cart="toggleCart"
        :cart-count="cartStore.totalItems"
      />

      <main class="min-h-screen">
        <NuxtPage />
      </main>

      <Footer />

      <!-- Modals -->
      <CartModal
        v-if="showCart"
        @close="showCart = false"
        @checkout="openCheckout"
      />

      <CheckoutModal
        v-if="showCheckout"
        @close="closeCheckout"
        @order-complete="handleOrderComplete"
      />

      <OrderConfirmationModal
        v-if="showOrderConfirmation"
        :order="lastOrder"
        @close="showOrderConfirmation = false"
      />
    </div>
  </template>

  <script setup>
  import { ref } from 'vue'
  import { useCartStore } from '~/stores/cart'
  import { useHead } from '#app'

  const cartStore = useCartStore()
  const showCart = ref(false)
  const showCheckout = ref(false)
  const showOrderConfirmation = ref(false)
  const lastOrder = ref(null)

  const toggleCart = () => {
    showCart.value = !showCart.value
  }

  const openCheckout = () => {
    showCart.value = false
    showCheckout.value = true
  }

  const closeCheckout = () => {
    showCheckout.value = false
  }

  const handleOrderComplete = (order) => {
    showCheckout.value = false
    lastOrder.value = order
    showOrderConfirmation.value = true
    cartStore.clearCart()
  }

  // SEO
  useHead({
    title: 'Audiophile - Premium Audio Equipment',
    meta: [
      { name: 'description', content: 'Experience natural, lifelike audio and exceptional build quality made for the passionate music enthusiast.' }
    ]
  })
  </script>
