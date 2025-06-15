<template>
  <div>
    <NuxtLayout>
      <NuxtPage />
    </NuxtLayout>
    <CheckoutModal v-if="showCheckout" @close="closeCheckout" @order-complete="handleOrderComplete" />
    <OrderConfirmationModal v-if="showOrderConfirmation" :order="lastOrder" @close="showOrderConfirmation = false" />
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useCartStore } from '~/stores/cart'
import { useHead } from '#app'

const cartStore = useCartStore()
const showCheckout = ref(false)
const showOrderConfirmation = ref(false)
const lastOrder = ref(null)

const openCheckout = () => {
  cartStore.showCart = false
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

// Listen for checkout event from layout
onMounted(() => {
  window.addEventListener('open-checkout', () => {
    openCheckout()
  })
})

useHead({
  title: 'Audiophile - Premium Audio Equipment',
  meta: [
    {
      name: 'description',
      content: 'Experience natural, lifelike audio and exceptional build quality made for the passionate music enthusiast.'
    }
  ]
})
</script>