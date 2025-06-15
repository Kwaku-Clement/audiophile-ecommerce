<template>
  <div class="fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4">
    <div class="bg-white rounded-lg w-full max-w-md">
      <div class="p-8">
        <!-- Success Icon -->
        <div class="w-16 h-16 bg-orange-500 rounded-full flex items-center justify-center mx-auto mb-6">
          <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
          </svg>
        </div>

        <h2 class="text-2xl font-bold mb-4 text-center">Thank you for your order!</h2>
        <p class="text-gray-600 text-center mb-6">You will receive an email confirmation shortly.</p>

        <!-- Order Summary -->
        <div class="bg-gray-50 rounded-lg overflow-hidden mb-6">
          <div class="p-4">
            <div class="flex items-center space-x-4 mb-4">
              <img
                :src="order.items[0].image"
                :alt="order.items[0].name"
                class="w-12 h-12 object-cover rounded"
              >
              <div class="flex-1">
                <h3 class="font-medium text-sm">{{ order.items[0].name }}</h3>
                <p class="text-gray-500 text-sm">${{ order.items[0].price.toLocaleString() }}</p>
              </div>
              <span class="text-sm font-medium">x{{ order.items[0].quantity }}</span>
            </div>

            <div v-if="order.items.length > 1" class="border-t pt-4">
              <p class="text-sm text-gray-500 text-center">
                and {{ order.items.length - 1 }} other item{{ order.items.length > 2 ? 's' : '' }}
              </p>
            </div>
          </div>

          <div class="bg-black text-white p-4">
            <div class="flex justify-between items-center">
              <span class="text-gray-300">Grand Total</span>
              <span class="font-bold text-lg">${{ order.total.toLocaleString() }}</span>
            </div>
          </div>
        </div>

        <button
          @click="backToHome"
          class="w-full bg-orange-500 hover:bg-orange-600 text-white py-3 px-6 font-medium transition-colors"
        >
          Back to Home
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'

const router = useRouter()

const props = defineProps({
  order: {
    type: Object,
    required: true
  }
})

const emit = defineEmits(['close'])

const backToHome = () => {
  emit('close')
  router.push('/')
}
</script>
