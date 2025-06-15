export default defineNuxtConfig({
  devtools: { enabled: true },
  css: ["~/assets/css/main.css"],
  modules: ["@pinia/nuxt"],

  postcss: {
    plugins: {
      tailwindcss: {},
      autoprefixer: {},
    },
  },

  app: {
    baseURL: "/audiophile-ecommerce/",
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

  nitro: {
    preset: "github-pages",
  },
})
