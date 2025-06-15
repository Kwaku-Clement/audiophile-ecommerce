export default defineNuxtPlugin(() => {
    // Fix for GitHub Pages routing issues
    if (process.client) {
      const router = useRouter()

      // Handle browser back/forward navigation
      window.addEventListener('popstate', () => {
        router.replace(window.location.pathname)
      })

      // Ensure proper hydration after navigation
      router.afterEach((to, from) => {
        if (from.name && to.name) {
          // Force a small delay to ensure DOM is ready
          nextTick(() => {
            // Trigger any component reactivation
            const event = new CustomEvent('route-changed', {
              detail: { to, from }
            })
            window.dispatchEvent(event)
          })
        }
      })
    }
  })