export interface ResponsiveImage {
  mobile?: string
  tablet?: string
  desktop?: string
}

export type ImageInput = string | ResponsiveImage

export const useResponsiveImage = () => {
const { public: { appBaseURL } } = useRuntimeConfig();

  const prefixPath = (path: string): string => {
      if (!path) return '';

      if (path.startsWith(appBaseURL)) {
          return path;
      }

      const normalizedBase = appBaseURL.endsWith('/') && appBaseURL.length > 1 ? appBaseURL.slice(0, -1) : appBaseURL;

    const normalizedPath = path.startsWith('/') ? path.slice(1) : path;

      return `${normalizedBase}/${normalizedPath}`;
  };

  const getResponsiveImage = (imageObj: ImageInput, size: keyof ResponsiveImage = "desktop"): string => {
    let finalPath = "";

    if (!imageObj) {
      console.warn(`[getResponsiveImage] Image object is null or undefined for size: ${size}.`);
      finalPath = "/placeholder.svg?height=400&width=400&text=Product+Image";
    } else if (typeof imageObj === "string") {
      finalPath = imageObj;
    } else if (typeof imageObj === "object") {
      const fallbackOrder: (keyof ResponsiveImage)[] = [size, "desktop", "tablet", "mobile"];

      for (const fallbackSize of fallbackOrder) {
        if (imageObj[fallbackSize]) {
          finalPath = imageObj[fallbackSize] as string;
          break;
        }
      }
    }

    if (!finalPath) {
      console.warn(`[getResponsiveImage] No specific image path found for size: ${size} in object:`, imageObj);
      finalPath = "/placeholder.svg?height=400&width=400&text=Product+Image";
    }

    return prefixPath(finalPath);
  };

  const getImageSrcSet = (imageObj: ImageInput): string => {
    if (typeof imageObj === "string") {
      return prefixPath(imageObj);
    }

    if (imageObj && typeof imageObj === "object") {
      const srcSet: string[] = [];
      if (imageObj.mobile) srcSet.push(`${prefixPath(imageObj.mobile)} 480w`);
      if (imageObj.tablet) srcSet.push(`${prefixPath(imageObj.tablet)} 768w`);
      if (imageObj.desktop) srcSet.push(`${prefixPath(imageObj.desktop)} 1200w`);

      if (srcSet.length > 0) {
        return srcSet.join(", ");
      }
    }
    return prefixPath("/placeholder.svg?height=400&width=400&text=Product+Image");
  };

  const getImageSizes = (): string => {
    return "(max-width: 480px) 480px, (max-width: 768px) 768px, 1200px"
  }

  const getResponsiveImageForViewport = (imageObj: ImageInput): string => {
    if (typeof window !== "undefined") {
      const width = window.innerWidth;
      if (width <= 480) {
        return getResponsiveImage(imageObj, "mobile");
      } else if (width <= 768) {
        return getResponsiveImage(imageObj, "tablet");
      } else {
        return getResponsiveImage(imageObj, "desktop");
      }
    }
    return getResponsiveImage(imageObj, "desktop");
  };

  return {
    getResponsiveImage,
    getImageSrcSet,
    getImageSizes,
    getResponsiveImageForViewport,
  };
};
