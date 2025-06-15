declare module "*.vue" {
    import type { DefineComponent } from "vue"
    const component: DefineComponent<{}, {}, any>
    export default component
  }

  declare module "#app" {
    interface NuxtApp {
      // Add any custom properties here
    }
  }

  declare module "@vue/runtime-core" {
    interface ComponentCustomProperties {
      // Add any global properties here
    }
  }
