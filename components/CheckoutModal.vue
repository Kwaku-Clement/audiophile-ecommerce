<template>
  <div class="fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4">
    <div class="bg-white rounded-lg w-full max-w-4xl max-h-[90vh] overflow-y-auto">
      <div class="p-6">
        <div class="flex justify-between items-center mb-6">
          <h2 class="text-2xl font-bold">Checkout</h2>
          <button
            @click="$emit('close')"
            class="text-gray-500 hover:text-gray-700"
            aria-label="Close checkout"
          >
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
            </svg>
          </button>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
          <!-- Checkout Form -->
          <div>
            <form @submit.prevent="handleSubmit">
              <!-- Billing Details -->
              <div class="mb-8">
                <h3 class="text-lg font-bold text-orange-500 mb-4">BILLING DETAILS</h3>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <div>
                    <label class="block text-sm font-medium mb-2">Name</label>
                    <input
                      v-model="form.name"
                      type="text"
                      required
                      class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:border-orange-500"
                      :class="{ 'border-red-500': errors.name }"
                    >
                    <p v-if="errors.name" class="text-red-500 text-sm mt-1">{{ errors.name }}</p>
                  </div>
                  <div>
                    <label class="block text-sm font-medium mb-2">Email Address</label>
                    <input
                      v-model="form.email"
                      type="email"
                      required
                      class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:border-orange-500"
                      :class="{ 'border-red-500': errors.email }"
                    >
                    <p v-if="errors.email" class="text-red-500 text-sm mt-1">{{ errors.email }}</p>
                  </div>
                  <div class="md:col-span-2">
                    <label class="block text-sm font-medium mb-2">Phone Number</label>
                    <input
                      v-model="form.phone"
                      type="tel"
                      required
                      class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:border-orange-500"
                      :class="{ 'border-red-500': errors.phone }"
                    >
                    <p v-if="errors.phone" class="text-red-500 text-sm mt-1">{{ errors.phone }}</p>
                  </div>
                </div>
              </div>

              <!-- Shipping Info -->
              <div class="mb-8">
                <h3 class="text-lg font-bold text-orange-500 mb-4">SHIPPING INFO</h3>
                <div class="space-y-4">
                  <div>
                    <label class="block text-sm font-medium mb-2">Address</label>
                    <input
                      v-model="form.address"
                      type="text"
                      required
                      class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:border-orange-500"
                      :class="{ 'border-red-500': errors.address }"
                    >
                    <p v-if="errors.address" class="text-red-500 text-sm mt-1">{{ errors.address }}</p>
                  </div>
                  <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                      <label class="block text-sm font-medium mb-2">ZIP Code</label>
                      <input
                        v-model="form.zipCode"
                        type="text"
                        required
                        class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:border-orange-500"
                        :class="{ 'border-red-500': errors.zipCode }"
                      >
                      <p v-if="errors.zipCode" class="text-red-500 text-sm mt-1">{{ errors.zipCode }}</p>
                    </div>
                    <div>
                      <label class="block text-sm font-medium mb-2">City</label>
                      <input
                        v-model="form.city"
                        type="text"
                        required
                        class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:border-orange-500"
                        :class="{ 'border-red-500': errors.city }"
                      >
                      <p v-if="errors.city" class="text-red-500 text-sm mt-1">{{ errors.city }}</p>
                    </div>
                  </div>
                  <div>
                    <label class="block text-sm font-medium mb-2">Country</label>
                    <input
                      v-model="form.country"
                      type="text"
                      required
                      class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:border-orange-500"
                      :class="{ 'border-red-500': errors.country }"
                    >
                    <p v-if="errors.country" class="text-red-500 text-sm mt-1">{{ errors.country }}</p>
                  </div>
                </div>
              </div>

              <!-- Payment Details -->
              <div class="mb-8">
                <h3 class="text-lg font-bold text-orange-500 mb-4">PAYMENT DETAILS</h3>
                <div class="space-y-4">
                  <div>
                    <label class="block text-sm font-medium mb-2">Payment Method</label>
                    <div class="space-y-2">
                      <label class="flex items-center">
                        <input
                          v-model="form.paymentMethod"
                          type="radio"
                          value="e-money"
                          class="mr-2"
                        >
                        e-Money
                      </label>
                      <label class="flex items-center">
                        <input
                          v-model="form.paymentMethod"
                          type="radio"
                          value="cash"
                          class="mr-2"
                        >
                        Cash on Delivery
                      </label>
                    </div>
                  </div>

                  <div v-if="form.paymentMethod === 'e-money'" class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                      <label class="block text-sm font-medium mb-2">e-Money Number</label>
                      <input
                        v-model="form.eMoneyNumber"
                        type="text"
                        class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:border-orange-500"
                      >
                    </div>
                    <div>
                      <label class="block text-sm font-medium mb-2">e-Money PIN</label>
                      <input
                        v-model="form.eMoneyPin"
                        type="text"
                        class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:border-orange-500"
                      >
                    </div>
                  </div>

                  <div v-if="form.paymentMethod === 'cash'" class="bg-gray-50 p-4 rounded">
                    <p class="text-sm text-gray-600">
                      The 'Cash on Delivery' option enables you to pay in cash when our delivery courier arrives at your residence.
                      Just make sure your address is correct so that your order will not be cancelled.
                    </p>
                  </div>
                </div>
              </div>
            </form>
          </div>

          <!-- Order Summary -->
          <div>
            <div class="bg-gray-50 p-6 rounded-lg">
              <h3 class="text-lg font-bold mb-4">SUMMARY</h3>

              <div class="space-y-4 mb-6">
                <div
                  v-for="item in cartStore.items"
                  :key="item.id"
                  class="flex items-center space-x-4"
                >
                  <img
                    :src="item.image"
                    :alt="item.name"
                    class="w-16 h-16 object-cover rounded"
                  >
                  <div class="flex-1">
                    <h4 class="font-medium text-sm">{{ item.name }}</h4>
                    <p class="text-gray-500 text-sm">${{ item.price.toLocaleString() }}</p>
                  </div>
                  <span class="text-sm font-medium">x{{ item.quantity }}</span>
                </div>
              </div>

              <div class="space-y-2 mb-6">
                <div class="flex justify-between">
                  <span>Total</span>
                  <span class="font-bold">${{ cartStore.totalPrice.toLocaleString() }}</span>
                </div>
                <div class="flex justify-between">
                  <span>Shipping</span>
                  <span class="font-bold">$50</span>
                </div>
                <div class="flex justify-between">
                  <span>VAT (Included)</span>
                  <span class="font-bold">${{ Math.round(cartStore.totalPrice * 0.2).toLocaleString() }}</span>
                </div>
                <div class="border-t pt-2 flex justify-between text-lg">
                  <span>Grand Total</span>
                  <span class="font-bold text-orange-500">${{ (cartStore.totalPrice + 50).toLocaleString() }}</span>
                </div>
              </div>

              <button
                @click="handleSubmit"
                :disabled="isSubmitting"
                class="w-full bg-orange-500 hover:bg-orange-600 text-white py-3 px-6 font-medium transition-colors disabled:opacity-50"
              >
                {{ isSubmitting ? 'Processing...' : 'Continue & Pay' }}
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive } from 'vue'
import { useCartStore } from '~/stores/cart'

const cartStore = useCartStore()
const isSubmitting = ref(false)

const form = reactive({
  name: '',
  email: '',
  phone: '',
  address: '',
  zipCode: '',
  city: '',
  country: '',
  paymentMethod: 'e-money',
  eMoneyNumber: '',
  eMoneyPin: ''
})

const errors = reactive({})

const validateForm = () => {
  Object.keys(errors).forEach(key => delete errors[key])

  if (!form.name.trim()) errors.name = 'Name is required'
  if (!form.email.trim()) errors.email = 'Email is required'
  if (!form.phone.trim()) errors.phone = 'Phone is required'
  if (!form.address.trim()) errors.address = 'Address is required'
  if (!form.zipCode.trim()) errors.zipCode = 'ZIP code is required'
  if (!form.city.trim()) errors.city = 'City is required'
  if (!form.country.trim()) errors.country = 'Country is required'

  return Object.keys(errors).length === 0
}

const handleSubmit = async () => {
  if (!validateForm()) return

  isSubmitting.value = true

  // Simulate API call
  await new Promise(resolve => setTimeout(resolve, 2000))

  const order = {
    id: Date.now().toString(),
    items: [...cartStore.items],
    total: cartStore.totalPrice + 50,
    customerInfo: { ...form },
    date: new Date().toISOString()
  }

  isSubmitting.value = false
  emit('order-complete', order)
}

const emit = defineEmits(['close', 'order-complete'])
</script>
