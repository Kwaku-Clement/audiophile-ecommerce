<template>
  <div class="category-page">
    <!-- Page Header -->
    <section class="bg-black text-white py-20">
      <div class="container mx-auto px-4 text-center">
        <h1 class="text-4xl font-bold">HEADPHONES</h1>
      </div>
    </section>

    <!-- Products -->
    <section class="py-20">
      <div class="container mx-auto px-4">
        <div v-if="loading" class="text-center">
          <LoadingSpinner />
        </div>

        <div v-else-if="error" class="text-center text-red-500">
          <p>{{ error }}</p>
        </div>

        <div v-else class="space-y-20">
          <ProductShowcase
            v-for="(product, index) in products"
            :key="product.id"
            :product="product"
            :reverse="index % 2 === 1"
          />
        </div>
      </div>
    </section>

    <!-- Categories Section -->
    <section class="py-20 bg-gray-50">
      <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div class="bg-white rounded-lg p-6 text-center group hover:shadow-lg transition-shadow">
            <picture>
              <source
                media="(max-width: 480px)"
                :srcset="getResponsiveImage(headphonesCategoryImage, 'mobile')"
              >
              <source
                media="(max-width: 768px)"
                :srcset="getResponsiveImage(headphonesCategoryImage, 'tablet')"
              >
              <source
                media="(min-width: 769px)"
                :srcset="getResponsiveImage(headphonesCategoryImage, 'desktop')"
              >
              <img
                :src="getResponsiveImage(headphonesCategoryImage, 'desktop')"
                alt="Headphones Category"
                class="w-32 h-32 mx-auto mb-4 rounded-lg"
              >
            </picture>
            <h3 class="text-lg font-bold mb-4">HEADPHONES</h3>
            <NuxtLink
              to="/headphones"
              class="inline-flex items-center text-gray-600 hover:text-orange-500 font-medium transition-colors"
            >
              SHOP
              <svg class="w-4 h-4 ml-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
              </svg>
            </NuxtLink>
          </div>

          <div class="bg-white rounded-lg p-6 text-center group hover:shadow-lg transition-shadow">
            <picture>
              <source
                media="(max-width: 480px)"
                :srcset="getResponsiveImage(speakersCategoryImage, 'mobile')"
              >
              <source
                media="(max-width: 768px)"
                :srcset="getResponsiveImage(speakersCategoryImage, 'tablet')"
              >
              <source
                media="(min-width: 769px)"
                :srcset="getResponsiveImage(speakersCategoryImage, 'desktop')"
              >
              <img
                :src="getResponsiveImage(speakersCategoryImage, 'desktop')"
                alt="Speakers Category"
                class="w-32 h-32 mx-auto mb-4 rounded-lg"
              >
            </picture>
            <h3 class="text-lg font-bold mb-4">SPEAKERS</h3>
            <NuxtLink
              to="/speakers"
              class="inline-flex items-center text-gray-600 hover:text-orange-500 font-medium transition-colors"
            >
              SHOP
              <svg class="w-4 h-4 ml-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
              </svg>
            </NuxtLink>
          </div>

          <div class="bg-white rounded-lg p-6 text-center group hover:shadow-lg transition-shadow">
            <picture>
              <source
                media="(max-width: 480px)"
                :srcset="getResponsiveImage(earphonesCategoryImage, 'mobile')"
              >
              <source
                media="(max-width: 768px)"
                :srcset="getResponsiveImage(earphonesCategoryImage, 'tablet')"
              >
              <source
                media="(min-width: 769px)"
                :srcset="getResponsiveImage(earphonesCategoryImage, 'desktop')"
              >
              <img
                :src="getResponsiveImage(earphonesCategoryImage, 'desktop')"
                alt="Earphones Category"
                class="w-32 h-32 mx-auto mb-4 rounded-lg"
              >
            </picture>
            <h3 class="text-lg font-bold mb-4">EARPHONES</h3>
            <NuxtLink
              to="/earphones"
              class="inline-flex items-center text-gray-600 hover:text-orange-500 font-medium transition-colors"
            >
              SHOP
              <svg class="w-4 h-4 ml-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
              </svg>
            </NuxtLink>
          </div>
        </div>
      </div>
    </section>

    <!-- About Section -->
    <section class="py-20">
      <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
          <div>
            <h2 class="text-3xl lg:text-4xl font-bold mb-6">
              Bringing you the <span class="text-orange-500">best</span> audio gear
            </h2>
            <p class="text-gray-600 mb-6">
              Located at the heart of New York City, Audiophile is the premier store for high end headphones,
              earphones, speakers, and audio accessories. We have a large showroom and luxury demonstration
              rooms available for you to browse and experience a wide range of our products. Stop by our store
              to meet some of the fantastic people who make Audiophile the best place to buy your portable
              audio equipment.
            </p>
          </div>
          <div>
            <picture>
              <source
                media="(max-width: 480px)"
                :srcset="getResponsiveImage(headphonesCategoryImage, 'mobile')"
              >
              <source
                media="(max-width: 768px)"
                :srcset="getResponsiveImage(headphonesCategoryImage, 'tablet')"
              >
              <source
                media="(min-width: 769px)"
                :srcset="getResponsiveImage(headphonesCategoryImage, 'desktop')"
              >
              <img
                :src="getResponsiveImage(headphonesCategoryImage, 'desktop')"
                alt="Best Audio Gear"
                class="w-full h-96 rounded-lg"
              >
            </picture>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import ProductShowcase from '~/components/ProductShowcase.vue'
import LoadingSpinner from '~/components/LoadingSpinner.vue'
import { useHead, useRoute, useFetch } from '#app'
import { useResponsiveImage } from '~/composables/useResponsiveImage'

const { getResponsiveImage } = useResponsiveImage()
const { public: { appBaseURL } } = useRuntimeConfig()
const route = useRoute()

// Use useFetch to get all products for SSR
const { data: allProducts, pending, error } = await useFetch(`${appBaseURL}products.json`, {
  transform: (data) => data,
  server: true
})

// Filter products based on category, ensuring allProducts.value is accessible
const products = computed(() => {
  return allProducts.value?.filter(product => product.category === 'headphones') || []
})

// Category images for 'shop' links (these also rely on allProducts.value)
const speakersCategoryImage = computed(() => {
  const speaker = allProducts.value?.find(p => p.category === 'speakers')
  return speaker ? speaker.categoryImage : { mobile: '', tablet: '', desktop: '' }
})

const headphonesCategoryImage = computed(() => {
  const headphone = allProducts.value?.find(p => p.category === 'headphones')
  return headphone ? headphone.categoryImage : { mobile: '', tablet: '', desktop: '' }
})

const earphonesCategoryImage = computed(() => {
  const earphone = allProducts.value?.find(p => p.category === 'earphones')
  return earphone ? earphone.categoryImage : { mobile: '', tablet: '', desktop: '' }
})

useHead({
  title: 'Earphones - Audiophile',
  meta: [
    { name: 'description', content: 'Discover our collection of premium earphones for portable audio excellence.' }
  ]
})
</script>