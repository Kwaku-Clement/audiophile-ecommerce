<template>
  <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 md:gap-12 items-center">
    <div :class="{ 'lg:order-2': reverse }">
      <picture>
        <source
          media="(max-width: 480px)"
          :srcset="getResponsiveImage(product.categoryImage || product.image, 'mobile')"
        >
        <source
          media="(max-width: 768px)"
          :srcset="getResponsiveImage(product.categoryImage || product.image, 'tablet')"
        >
        <source
          media="(min-width: 769px)"
          :srcset="getResponsiveImage(product.categoryImage || product.image, 'desktop')"
        >
        <img
          :src="getResponsiveImage(product.categoryImage || product.image, 'desktop')"
          :alt="product.name"
          class="w-full h-auto rounded-lg"
          loading="lazy"
        >
      </picture>
    </div>
    <div :class="{ 'lg:order-1': reverse }" class="text-center md:text-left">
      <p v-if="product.new" class="text-orange-500 text-sm tracking-widest mb-4">NEW PRODUCT</p>
      <h2 class="text-2xl md:text-3xl lg:text-4xl font-bold mb-4 md:mb-6">{{ product.name }}</h2>
      <p class="text-gray-600 mb-6 md:mb-8">{{ product.description }}</p>
      <NuxtLink
        :to="`/product/${product.slug}`"
        class="inline-block bg-orange-500 hover:bg-orange-600 text-white px-6 md:px-8 py-3 font-medium transition-colors"
      >
        See Product
      </NuxtLink>
    </div>
  </div>
</template>

<script setup>
import { useResponsiveImage } from '~/composables/useResponsiveImage'

const props = defineProps({
  product: {
    type: Object,
    required: true
  },
  reverse: {
    type: Boolean,
    default: false
  }
})

const { getResponsiveImage } = useResponsiveImage()
</script>
