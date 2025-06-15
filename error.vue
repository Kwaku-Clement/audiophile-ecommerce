<template>
    <div class="min-h-screen flex items-center justify-center bg-gray-50">
      <div class="text-center">
        <h1 class="text-6xl font-bold text-gray-900 mb-4">{{ error.statusCode }}</h1>
        <p class="text-xl text-gray-600 mb-8">{{ error.statusMessage }}</p>
        <NuxtLink
          to="/"
          class="inline-block bg-orange-500 hover:bg-orange-600 text-white px-8 py-3 font-medium transition-colors"
        >
          Go Home
        </NuxtLink>
      </div>
    </div>
  </template>

  <script setup>
  import { useError } from '#app'

  const { clearError } = useError()

  const props = defineProps(['error'])
  </script>

  <style scoped>
  .min-h-screen {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #F1F1F1;
  }

  .text-center {
    text-align: center;
    padding: 48px;
    background: white;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    max-width: 500px;
  }

  .text-6xl {
    font-size: 72px;
    font-weight: 700;
    color: #D87D4A;
    margin-bottom: 16px;
  }

  .text-xl {
    font-size: 32px;
    font-weight: 700;
    margin-bottom: 16px;
    text-transform: uppercase;
    letter-spacing: 1.14px;
  }

  .text-gray-600 {
    font-size: 15px;
    line-height: 25px;
    color: #979797;
    margin-bottom: 40px;
  }

  .inline-block {
    display: flex;
    gap: 16px;
    justify-content: center;
  }

  @media (max-width: 768px) {
    .text-center {
      margin: 20px;
      padding: 32px 24px;
    }

    .text-6xl {
      font-size: 48px;
    }

    .text-xl {
      font-size: 24px;
    }

    .inline-block {
      flex-direction: column;
    }
  }
  </style>
