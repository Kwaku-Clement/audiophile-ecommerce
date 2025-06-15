<template>
  <div class="fixed inset-0 bg-black bg-opacity-50 z-50 flex items-start justify-end p-4">
    <div class="bg-white rounded-lg w-full max-w-md mt-16 md:mt-20 max-h-[80vh] overflow-y-auto">
      <div class="p-4 md:p-6">
        <div class="flex justify-between items-center mb-4 md:mb-6">
          <h2 class="text-lg md:text-xl font-bold">Cart ({{ cartStore.totalItems }})</h2>
          <button
            @click="$emit('close')"
            class="text-gray-500 hover:text-gray-700"
            aria-label="Close cart"
          >
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
            </svg>
          </button>
        </div>

        <div v-if="cartStore.items.length === 0" class="text-center py-8">
          <p class="text-gray-500">Your cart is empty</p>
        </div>

        <div v-else>
          <button
            @click="cartStore.clearCart"
            class="text-sm text-gray-500 hover:text-gray-700 mb-4 underline"
          >
            Remove all
          </button>

          <div class="space-y-4 mb-6">
            <div
              v-for="item in cartStore.items"
              :key="item.id"
              class="flex items-center space-x-3 md:space-x-4"
            >
              <picture>
                <source
                  media="(max-width: 480px)"
                  :srcset="getResponsiveImage(item.image, 'mobile')"
                >
                <source
                  media="(max-width: 768px)"
                  :srcset="getResponsiveImage(item.image, 'tablet')"
                >
                <img
                  :src="getResponsiveImage(item.image, 'desktop')"
                  :alt="item.name"
                  class="w-12 h-12 md:w-16 md:h-16 object-cover rounded"
                >
              </picture>
              <div class="flex-1">
                <h3 class="font-medium text-sm">{{ item.name }}</h3>
                <p class="text-gray-500 text-sm">${{ item.price.toLocaleString() }}</p>
              </div>
              <div class="flex items-center space-x-2">
                <button
                  @click="cartStore.updateQuantity(item.id, item.quantity - 1)"
                  class="w-8 h-8 bg-gray-100 hover:bg-gray-200 flex items-center justify-center text-sm font-medium"
                  :disabled="item.quantity <= 1"
                >
                  -
                </button>
                <span class="w-8 text-center text-sm font-medium">{{ item.quantity }}</span>
                <button
                  @click="cartStore.updateQuantity(item.id, item.quantity + 1)"
                  class="w-8 h-8 bg-gray-100 hover:bg-gray-200 flex items-center justify-center text-sm font-medium"
                >
                  +
                </button>
              </div>
            </div>
          </div>

          <div class="border-t pt-4">
            <div class="flex justify-between items-center mb-4">
              <span class="font-medium">Total</span>
              <span class="font-bold text-lg">${{ cartStore.totalPrice.toLocaleString() }}</span>
            </div>
            <button
              @click="$emit('checkout')"
              class="w-full bg-orange-500 hover:bg-orange-600 text-white py-3 px-6 font-medium transition-colors"
            >
              Checkout
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useCartStore } from '~/stores/cart'
import { useResponsiveImage } from '~/composables/useResponsiveImage'

const cartStore = useCartStore()
const { getResponsiveImage } = useResponsiveImage()

defineEmits(['close', 'checkout'])
</script>
