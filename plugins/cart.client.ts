import { defineNuxtPlugin } from "nuxt/app"

export default defineNuxtPlugin(async () => {
  const { useCartStore } = await import("../stores/cart")
  const cartStore = useCartStore()
  cartStore.loadFromLocalStorage()
})