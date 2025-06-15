/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./components/**/*.{js,vue,ts}",
    "./layouts/**/*.vue",
    "./pages/**/*.vue",
    "./plugins/**/*.{js,ts}",
    "./app.vue",
    "./error.vue"
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Manrope", "sans-serif"],
      },
      colors: {
        orange: {
          500: "#D87D4A",
          600: "#CD5A2B",
        },
      },
    },
  },
  plugins: [],
}
