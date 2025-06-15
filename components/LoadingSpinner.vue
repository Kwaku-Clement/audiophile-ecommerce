<template>
    <div class="loading-container" :class="{ fullscreen }">
      <div class="spinner flex items-center justify-center p-8">
        <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-orange-500"></div>
      </div>
      <p v-if="message" class="loading-message">{{ message }}</p>
    </div>
  </template>

  <script setup>
  defineProps({
    fullscreen: {
      type: Boolean,
      default: false
    },
    message: {
      type: String,
      default: ''
    }
  })
  </script>

  <style scoped>
  .loading-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 40px;
  }

  .loading-container.fullscreen {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgba(255, 255, 255, 0.9);
    z-index: 1000;
  }

  .spinner {
    display: inline-block;
    position: relative;
    width: 80px;
    height: 80px;
  }

  .spinner-ring {
    box-sizing: border-box;
    display: block;
    position: absolute;
    width: 64px;
    height: 64px;
    margin: 8px;
    border: 8px solid #D87D4A;
    border-radius: 50%;
    animation: spinner-ring 1.2s cubic-bezier(0.5, 0, 0.5, 1) infinite;
    border-color: #D87D4A transparent transparent transparent;
  }

  .spinner-ring:nth-child(1) {
    animation-delay: -0.45s;
  }

  .spinner-ring:nth-child(2) {
    animation-delay: -0.3s;
  }

  .spinner-ring:nth-child(3) {
    animation-delay: -0.15s;
  }

  @keyframes spinner-ring {
    0% {
      transform: rotate(0deg);
    }
    100% {
      transform: rotate(360deg);
    }
  }

  .loading-message {
    margin-top: 16px;
    font-size: 16px;
    color: #979797;
    text-align: center;
  }
  </style>
