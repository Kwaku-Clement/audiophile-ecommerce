<template>
  <div>
    <section class="bg-black text-white">
      <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 md:gap-12 items-center min-h-[500px] md:min-h-[600px]">
          <div class="text-center lg:text-left py-8 md:py-12 lg:py-0">
            <p class="text-gray-400 text-sm tracking-widest mb-4">NEW PRODUCT</p>
            <h1 class="text-3xl md:text-4xl lg:text-6xl font-bold mb-4 md:mb-6">
              XX99 Mark II<br>
              Headphones
            </h1>
            <p class="text-gray-300 mb-6 md:mb-8 max-w-md mx-auto lg:mx-0">
              Experience natural, lifelike audio and exceptional build quality made for the passionate music enthusiast.
            </p>
            <NuxtLink
              to="/product/xx99-mark-two-headphones"
              class="inline-block bg-orange-500 hover:bg-orange-600 text-white px-6 md:px-8 py-3 font-medium transition-colors"
            >
              See Product
            </NuxtLink>
          </div>
          <div class="text-center">
            <picture v-if="heroProduct">
              <source
                media="(max-width: 480px)"
                :srcset="getResponsiveImage(heroProduct.image, 'mobile')"
              >
              <source
                media="(max-width: 768px)"
                :srcset="getResponsiveImage(heroProduct.image, 'tablet')"
              >
              <source
                media="(min-width: 769px)"
                :srcset="getResponsiveImage(heroProduct.image, 'desktop')"
              >
              <img
                :src="getResponsiveImage(heroProduct.image, 'desktop')"
                :alt="heroProduct.name"
                class="max-w-full h-auto rounded-lg"
                loading="eager"
              >
            </picture>
          </div>
        </div>
      </div>
    </section>

    <section class="py-12 md:py-16 lg:py-20">
      <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 md:gap-8">
          <div class="bg-gray-100 rounded-lg p-6 text-center group hover:shadow-lg transition-shadow">
            <picture v-if="headphonesCategoryImage.desktop">
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

          <div class="bg-gray-100 rounded-lg p-6 text-center group hover:shadow-lg transition-shadow">
            <picture v-if="speakersCategoryImage.desktop">
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

          <div class="bg-gray-100 rounded-lg p-6 text-center group hover:shadow-lg transition-shadow">
            <picture v-if="earphonesCategoryImage.desktop">
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

    <section class="py-12 md:py-16 lg:py-20 bg-gray-50">
      <div class="container mx-auto px-4">
        <h2 class="text-2xl md:text-3xl font-bold text-center mb-8 md:mb-12">All Products</h2>

        <div v-if="loading" class="text-center">
          <LoadingSpinner class="mx-auto" />
        </div>

        <div v-else-if="error" class="text-center text-red-500">
          <p>{{ error }}</p>
        </div>

        <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 md:gap-8">
          <ProductCard
            v-for="product in allProducts"
            :key="product.id"
            :product="product"
          />
        </div>
      </div>
    </section>

    <section class="py-12 md:py-16 lg:py-20">
      <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 md:gap-12 items-center">
          <div class="order-2 lg:order-1 text-center lg:text-left">
            <h2 class="text-2xl md:text-3xl lg:text-4xl font-bold mb-4 md:mb-6">
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
          <div class="order-1 lg:order-2">
            <picture v-if="headphonesCategoryImage.desktop">
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
import { ref, onMounted, computed } from 'vue'
import { useHead } from '#app'
import { useResponsiveImage } from '~/composables/useResponsiveImage'
import ProductCard from '~/components/ProductCard.vue'
import LoadingSpinner from '~/components/LoadingSpinner.vue'

const { getResponsiveImage } = useResponsiveImage()

const loading = ref(true)
const error = ref(null)
const allProducts = ref([])
const heroProduct = computed(() => {
  return allProducts.value.find(product => product.slug === 'xx99-mark-two-headphones') || null
})

const headphonesCategoryImage = computed(() => {
  const headphone = allProducts.value.find(p => p.category === 'headphones')
  return headphone ? headphone.categoryImage : { mobile: '', tablet: '', desktop: '' }
})

const speakersCategoryImage = computed(() => {
  const speaker = allProducts.value.find(p => p.category === 'speakers')
  return speaker ? speaker.categoryImage : { mobile: '', tablet: '', desktop: '' }
})

const earphonesCategoryImage = computed(() => {
  const earphone = allProducts.value.find(p => p.category === 'earphones')
  return earphone ? earphone.categoryImage : { mobile: '', tablet: '', desktop: '' }
})

onMounted(async () => {
  try {
    const response = await fetch('/products.json')
    if (!response.ok) {
      throw new Error('Failed to fetch products')
    }
    const data = await response.json()
    allProducts.value = data
  } catch (err) {
    error.value = 'Failed to load products'
    console.error('Error loading products:', err)
  } finally {
    loading.value = false
  }
})

useHead({
  title: 'Audiophile - Premium Audio Equipment',
  meta: [
    { name: 'description', content: 'Experience natural, lifelike audio and exceptional build quality made for the passionate music enthusiast.' }
  ]
})
</script>