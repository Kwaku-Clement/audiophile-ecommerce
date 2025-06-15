<template>
  <div class="bg-gray-100 rounded-lg p-6 text-center group hover:shadow-lg transition-shadow">
    <img
      :src="image"
      :alt="title"
      class="w-32 h-32 mx-auto mb-4 object-contain"
      loading="lazy"
    >
    <h3 class="text-lg font-bold mb-4">{{ title }}</h3>
    <NuxtLink
      :to="link"
      class="inline-flex items-center text-gray-600 hover:text-orange-500 font-medium transition-colors"
    >
      SHOP
      <svg class="w-4 h-4 ml-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
      </svg>
    </NuxtLink>
  </div>
</template>

<script setup>
defineProps({
  title: String,
  image: String,
  link: String
})
</script>
