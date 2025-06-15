import { defineStore } from "pinia"
import type { ResponsiveImage } from "~/composables/useResponsiveImage"

export interface CartItem {
  id: number
  name: string
  price: number
  image: string | ResponsiveImage
  quantity: number
}

interface CartState {
  items: CartItem[]
}

export const useCartStore = defineStore("cart", {
  state: (): CartState => ({
    items: [],
  }),

  getters: {
    totalItems: (state): number => {
      return state.items.reduce((total: number, item: CartItem): number => total + item.quantity, 0)
    },
    totalPrice: (state): number => {
      return state.items.reduce((total: number, item: CartItem): number => total + item.price * item.quantity, 0)
    },
  },

  actions: {
    addItem(product: CartItem): void {
      const existingItem: CartItem | undefined = this.items.find((item: CartItem) => item.id === product.id)
      if (existingItem) {
        existingItem.quantity += product.quantity
      } else {
        this.items.push({ ...product })
      }
      this.saveToLocalStorage()
    },

    updateQuantity(id: number, quantity: number): void {
      const item: CartItem | undefined = this.items.find((item: CartItem) => item.id === id)
      if (item) {
        if (quantity <= 0) {
          this.removeItem(id)
        } else {
          item.quantity = quantity
        }
        this.saveToLocalStorage()
      }
    },

    removeItem(id: number): void {
      const index: number = this.items.findIndex((item: CartItem) => item.id === id)
      if (index > -1) {
        this.items.splice(index, 1)
        this.saveToLocalStorage()
      }
    },

    clearCart(): void {
      this.items = []
      this.saveToLocalStorage()
    },

    saveToLocalStorage(): void {
      if (process.client) {
        try {
          localStorage.setItem("cart", JSON.stringify(this.items))
        } catch (error) {
          console.error("Failed to save cart to localStorage:", error)
        }
      }
    },

    loadFromLocalStorage(): void {
      if (process.client) {
        try {
          const saved = localStorage.getItem("cart")
          if (saved) {
            const parsed = JSON.parse(saved)
            if (Array.isArray(parsed)) {
              this.items = parsed
            }
          }
        } catch (error) {
          console.error("Failed to load cart from localStorage:", error)
          this.items = []
        }
      }
    },
  },
})