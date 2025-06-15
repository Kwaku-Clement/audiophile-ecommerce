import fs from 'fs'
import path from 'path'

export default defineNuxtConfig({
  devtools: { enabled: true },
  compatibilityDate: '2025-06-15',
  css: ["~/assets/css/main.css"],
  modules: ["@pinia/nuxt"],
  ssr: true,
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
    }
  },
  app: {
    baseURL: "/audiophile-ecommerce/",
    buildAssetsDir: "/_nuxt/",
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