export interface ResponsiveImage {
    mobile?: string
    tablet?: string
    desktop?: string
  }

  export type ImageInput = string | ResponsiveImage

  export const useResponsiveImage = () => {
    const getResponsiveImage = (imageObj: ImageInput, size: keyof ResponsiveImage = "desktop"): string => {
      if (typeof imageObj === "string") {
        return imageObj
      }

      if (imageObj && typeof imageObj === "object") {
        const fallbackOrder: (keyof ResponsiveImage)[] = [size, "desktop", "tablet", "mobile"]

        for (const fallbackSize of fallbackOrder) {
          if (imageObj[fallbackSize]) {
            return imageObj[fallbackSize] as string
          }
        }
      }

      return "/assets/product-yx1-earphones/mobile/image-product.jpg";    }

    const getImageSrcSet = (imageObj: ImageInput): string => {
      if (typeof imageObj === "string") {
        return imageObj
      }

      if (imageObj && typeof imageObj === "object") {
        const srcSet: string[] = []
        if (imageObj.mobile) srcSet.push(`${imageObj.mobile} 480w`)
        if (imageObj.tablet) srcSet.push(`${imageObj.tablet} 768w`)
        if (imageObj.desktop) srcSet.push(`${imageObj.desktop} 1200w`)

        if (srcSet.length > 0) {
          return srcSet.join(", ")
        }
      }

      return "/assets/product-yx1-earphones/mobile/image-product.jpg";    }

    const getImageSizes = (): string => {
      return "(max-width: 480px) 480px, (max-width: 768px) 768px, 1200px"
    }

    // Helper function to get the best image for current viewport
    const getResponsiveImageForViewport = (imageObj: ImageInput): string => {
      if (typeof window !== "undefined") {
        const width = window.innerWidth
        if (width <= 480) {
          return getResponsiveImage(imageObj, "mobile")
        } else if (width <= 768) {
          return getResponsiveImage(imageObj, "tablet")
        } else {
          return getResponsiveImage(imageObj, "desktop")
        }
      }
      return getResponsiveImage(imageObj, "desktop")
    }

    return {
      getResponsiveImage,
      getImageSrcSet,
      getImageSizes,
      getResponsiveImageForViewport,
    }
  }
