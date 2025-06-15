<template>
  <div>
    <div v-if="loading" class="container mx-auto px-4 py-20">
      <LoadingSpinner />
    </div>

    <div v-else-if="error" class="container mx-auto px-4 py-20 text-center text-red-500">
      <p>{{ error }}</p>
    </div>

    <div v-else-if="product">

      <!-- Product Details -->
      <section class="py-8 md:py-12">
        <div class="container mx-auto px-4">
          <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 md:gap-12 items-center">
            <div>
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
                  class="w-full h-auto rounded-lg"
                >
              </picture>
            </div>
            <div class="text-center md:text-left">
              <p v-if="product.new" class="text-orange-500 text-sm tracking-widest mb-4">NEW PRODUCT</p>
              <h1 class="text-2xl md:text-3xl lg:text-4xl font-bold mb-4 md:mb-6">{{ product.name }}</h1>
              <p class="text-gray-600 mb-6 md:mb-8">{{ product.description }}</p>
              <p class="text-xl md:text-2xl font-bold mb-6 md:mb-8">${{ product.price.toLocaleString() }}</p>

              <div class="flex flex-col sm:flex-row items-center justify-center md:justify-start space-y-4 sm:space-y-0 sm:space-x-4">
                <div class="flex items-center space-x-2">
                  <button
                    @click="quantity = Math.max(1, quantity - 1)"
                    class="w-10 h-10 bg-gray-100 hover:bg-gray-200 flex items-center justify-center font-medium"
                  >
                    -
                  </button>
                  <span class="w-12 text-center font-medium">{{ quantity }}</span>
                  <button
                    @click="quantity++"
                    class="w-10 h-10 bg-gray-100 hover:bg-gray-200 flex items-center justify-center font-medium"
                  >
                    +
                  </button>
                </div>
                <button
                  @click="addToCart"
                  class="bg-orange-500 hover:bg-orange-600 text-white px-6 md:px-8 py-3 font-medium transition-colors w-full sm:w-auto"
                >
                  Add to Cart
                </button>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- Features -->
      <section class="py-12 md:py-20">
        <div class="container mx-auto px-4">
          <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 md:gap-12">
            <div>
              <h2 class="text-xl md:text-2xl font-bold mb-4 md:mb-6">Features</h2>
              <div class="prose prose-gray max-w-none">
                <p v-for="paragraph in product.features.split('\n\n')" :key="paragraph" class="mb-4 text-gray-600">
                  {{ paragraph }}
                </p>
              </div>
            </div>
            <div>
              <h2 class="text-xl md:text-2xl font-bold mb-4 md:mb-6">In the Box</h2>
              <ul class="space-y-2">
                <li
                  v-for="item in product.includes"
                  :key="item.item"
                  class="flex"
                >
                  <span class="text-orange-500 font-bold w-8">{{ item.quantity }}x</span>
                  <span class="text-gray-600">{{ item.item }}</span>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </section>

      <!-- Gallery -->
      <section class="py-12 md:py-20">
        <div class="container mx-auto px-4">
          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 md:gap-6">
            <div v-for="(galleryItem, key) in product.gallery" :key="key">
              <picture>
                <source
                  media="(max-width: 480px)"
                  :srcset="getResponsiveImage(galleryItem, 'mobile')"
                >
                <source
                  media="(max-width: 768px)"
                  :srcset="getResponsiveImage(galleryItem, 'tablet')"
                >
                <source
                  media="(min-width: 769px)"
                  :srcset="getResponsiveImage(galleryItem, 'desktop')"
                >
                <img
                  :src="getResponsiveImage(galleryItem, 'desktop')"
                  :alt="`${product.name} gallery image`"
                  class="w-full h-auto rounded-lg"
                  loading="lazy"
                >
              </picture>
            </div>
          </div>
        </div>
      </section>

      <!-- You May Also Like -->
      <section class="py-12 md:py-20 bg-gray-50">
        <div class="container mx-auto px-4">
          <h2 class="text-xl md:text-2xl font-bold text-center mb-8 md:mb-12">You may also like</h2>
          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 md:gap-8">
            <div
              v-for="suggestion in product.others"
              :key="suggestion.slug"
              class="text-center"
            >
              <picture>
                <source
                  media="(max-width: 480px)"
                  :srcset="getResponsiveImage(suggestion.image, 'mobile')"
                >
                <source
                  media="(max-width: 768px)"
                  :srcset="getResponsiveImage(suggestion.image, 'tablet')"
                >
                <source
                  media="(min-width: 769px)"
                  :srcset="getResponsiveImage(suggestion.image, 'desktop')"
                >
                <img
                  :src="getResponsiveImage(suggestion.image, 'desktop')"
                  :alt="suggestion.name"
                  class="w-full h-48 md:h-64 object-cover rounded-lg mb-4"
                  loading="lazy"
                >
              </picture>
              <h3 class="text-lg md:text-xl font-bold mb-4">{{ suggestion.name }}</h3>
              <NuxtLink
                  :to="`/product/${suggestion.slug}`"
                  class="inline-block bg-orange-500 hover:bg-orange-600 text-white px-6 md:px-8 py-3 font-medium transition-colors"
              >
                  See Product
              </NuxtLink>
            </div>
          </div>
        </div>
      </section>

      <!-- Categories Section -->
      <section class="py-20 bg-gray-50">
        <div class="container mx-auto px-4">
          <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div class="bg-white rounded-lg p-6 text-center group hover:shadow-lg transition-shadow">
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

            <div class="bg-white rounded-lg p-6 text-center group hover:shadow-lg transition-shadow">
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

            <div class="bg-white rounded-lg p-6 text-center group hover:shadow-lg transition-shadow">
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
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import { useRoute } from '#app'
import { useCartStore } from '~/stores/cart'
import { useHead } from '#app'
import { useResponsiveImage } from '~/composables/useResponsiveImage'
import LoadingSpinner from '~/components/LoadingSpinner.vue'

const { getResponsiveImage } = useResponsiveImage()
const route = useRoute()
const cartStore = useCartStore()

const quantity = ref(1)

const { data: products, pending: loading, error } = await useLazyFetch('/products.json', {
  key: 'products',
  transform: (data) => data,
  server: true
})

const product = computed(() => {
  return products.value?.find(p => p.slug === route.params.slug) || null
})

const headphonesCategoryImage = computed(() => {
  const headphone = products.value?.find(p => p.category === 'headphones')
  return headphone ? headphone.categoryImage : { mobile: '', tablet: '', desktop: '' }
})

const speakersCategoryImage = computed(() => {
  const speaker = products.value?.find(p => p.category === 'speakers')
  return speaker ? speaker.categoryImage : { mobile: '', tablet: '', desktop: '' }
})

const earphonesCategoryImage = computed(() => {
  const earphone = products.value?.find(p => p.category === 'earphones')
  return earphone ? earphone.categoryImage : { mobile: '', tablet: '', desktop: '' }
})

const addToCart = () => {
  if (product.value) {
    cartStore.addItem({
      id: product.value.id,
      name: product.value.name,
      price: product.value.price,
      image: product.value.image,
      quantity: quantity.value
    })
    quantity.value = 1
  }
}

useHead({
  title: computed(() => product.value ? `${product.value.name} - Audiophile` : 'Product - Audiophile'),
  meta: [
    {
      name: 'description',
      content: computed(() => product.value?.description || 'Premium audio equipment.')
    }
  ]
})
</script>
