import fs from 'fs'
import path from 'path'

export default defineNuxtConfig({
  devtools: { enabled: true },
  compatibilityDate: '2025-06-15',
  css: ["~/assets/css/main.css"],
  modules: ["@pinia/nuxt"],
  ssr: true,
  runtimeConfig: {
    public: {
      appBaseURL: process.env.NUXT_APP_BASE_URL || '/audiophile-ecommerce/'
    }
  },
  nitro: {
    preset: "github-pages",
    prerender: {
      routes: [
        '/',
        '/headphones',
        '/speakers',
        '/earphones',
        ...getProductRoutes()
      ],
      crawlLinks: true
    },
    // `output.publicDir` should remain REMOVED/COMMENTED OUT here
  },
  app: {
    baseURL: "/audiophile-ecommerce/", // This remains your application's base path
    // ---- CRUCIAL CHANGE HERE ----
    buildAssetsDir: "_nuxt/", // No leading slash! This makes it relative to baseURL.
    // ---- END CRUCIAL CHANGE ----
    head: {
      title: "Audiophile - Premium Audio Equipment",
      meta: [
        { charset: "utf-8" },
        { name: "viewport", content: "width=device-width, initial-scale=1" },
        {
          name: "description",
          content: "Experience natural, lifelike audio and exceptional build quality made for the passionate music enthusiast.",
        },
      ],
      link: [
        {
          rel: "stylesheet",
          href: "https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;700&display=swap",
        },
      ],
    },
  },
  postcss: {
    plugins: {
      tailwindcss: {},
      autoprefixer: {},
    },
  },
  experimental: {
    payloadExtraction: false
  },
  hooks: {
    'render:route': (url, result, context) => {
      console.log('Rendering:', url)
    }
  }
})

function getProductRoutes() {
  try {
    const productsPath = path.resolve('public/products.json')
    if (!fs.existsSync(productsPath)) {
      console.error('products.json not found at:', productsPath)
      return []
    }
    const products = JSON.parse(fs.readFileSync(productsPath, 'utf-8'))
    const routes = products.map(product => `/product/${product.slug}`)
    console.log('Prerendered product routes:', routes)
    return routes
  } catch (error) {
    console.error('Failed to generate product routes:', error)
    return []
  }
}
