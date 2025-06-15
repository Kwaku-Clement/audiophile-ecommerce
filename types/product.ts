export interface ResponsiveImage {
    mobile?: string
    tablet?: string
    desktop?: string
  }

  export interface ProductInclude {
    quantity: number
    item: string
  }

  export interface ProductGallery {
    first: ResponsiveImage
    second: ResponsiveImage
    third: ResponsiveImage
  }

  export interface ProductOther {
    slug: string
    name: string
    image: ResponsiveImage
  }

  export interface Product {
    id: number
    slug: string
    name: string
    image: ResponsiveImage
    category: "headphones" | "speakers" | "earphones"
    categoryImage: ResponsiveImage
    new: boolean
    price: number
    description: string
    features: string
    includes: ProductInclude[]
    gallery: ProductGallery
    others: ProductOther[]
  }
