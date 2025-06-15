<template>
  <div class="bg-white rounded-lg shadow-md overflow-hidden group hover:shadow-lg transition-shadow">
    <picture>
      <source
        media="(max-width: 480px)"
        :srcset="getResponsiveImage(product.image, 'mobile')"
      >
      <source
        media="(max-width: 768px)"
        :srcset="getResponsiveImage(product.image, 'tablet')"
      >
      <source
        media="(min-width: 769px)"
        :srcset="getResponsiveImage(product.image, 'desktop')"
      >
      <img
        :src="getResponsiveImage(product.image, 'desktop')"
        :alt="product.name"
        class="w-full h-64 object-cover"
        loading="lazy"
      >
    </picture>
    <div class="p-6">
      <p v-if="product.new" class="text-orange-500 text-sm tracking-widest mb-2">NEW PRODUCT</p>
      <h3 class="text-xl font-bold mb-4">{{ product.name }}</h3>
      <p class="text-gray-600 mb-4 line-clamp-3">{{ product.description }}</p>
      <div class="flex justify-between items-center">
        <span class="text-lg font-bold">${{ product.price.toLocaleString() }}</span>
        <NuxtLink
          :to="`/product/${product.slug}`"
          class="bg-orange-500 hover:bg-orange-600 text-white px-6 py-2 font-medium transition-colors"
        >
          See Product
        </NuxtLink>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { useResponsiveImage } from '~/composables/useResponsiveImage'
import type { Product } from '~/types/product'

const { getResponsiveImage } = useResponsiveImage()

defineProps<{
  product: Product
}>()
</script>
