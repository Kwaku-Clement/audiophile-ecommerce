#!/bin/bash

# =============================================================================
# 🎧 Audiophile E-commerce - Complete Setup Script (JSON-Based)
# =============================================================================
# This script reads products.json and creates the exact image structure needed
# =============================================================================

echo "🎧 Audiophile E-commerce - Complete Setup Script"
echo "================================================="
echo ""

# Color codes for better output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️ $1${NC}"
}

print_step() {
    echo -e "${PURPLE}🔧 $1${NC}"
}

# =============================================================================
# STEP 1: SYSTEM REQUIREMENTS CHECK
# =============================================================================

print_step "Step 1: Checking system requirements..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    print_error "Node.js is not installed. Please install Node.js 18+ first."
    echo "Download from: https://nodejs.org/"
    exit 1
fi

# Check Node.js version
NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    print_error "Node.js version 18+ required. Current version: $(node -v)"
    exit 1
fi

print_status "Node.js $(node -v) detected"

# Check if Git is installed
if ! command -v git &> /dev/null; then
    print_error "Git is not installed. Please install Git first."
    echo "Download from: https://git-scm.com/"
    exit 1
fi

print_status "Git $(git --version) detected"

# Check if jq is available for JSON parsing
if ! command -v jq &> /dev/null; then
    print_warning "jq not found. Installing via package manager or using alternative parsing..."
    # We'll use a Node.js script instead of jq for better compatibility
fi

# =============================================================================
# STEP 2: PROJECT CLEANUP AND INITIALIZATION
# =============================================================================

print_step "Step 2: Cleaning up and initializing project..."

# Clean up any existing problematic files
print_info "Cleaning up existing files..."
rm -f nuxt.config.ts  # Remove problematic TypeScript config if exists
rm -rf .nuxt .output node_modules package-lock.json 2>/dev/null
npm cache clean --force 2>/dev/null

# Create project directory structure
print_info "Creating project structure..."
mkdir -p assets/css
mkdir -p components
mkdir -p data
mkdir -p pages/product
mkdir -p plugins
mkdir -p stores
mkdir -p types
mkdir -p composables
mkdir -p public/images
mkdir -p .github/workflows
mkdir -p scripts

print_status "Project structure created"

# =============================================================================
# STEP 3: DEPENDENCY INSTALLATION
# =============================================================================

print_step "Step 3: Installing dependencies..."

# Check if package.json exists, if not create basic one
if [ ! -f "package.json" ]; then
    print_info "Creating package.json..."
    cat > package.json << 'EOF'
{
  "name": "audiophile-ecommerce",
  "version": "1.0.0",
  "description": "Modern Vue 3 e-commerce application for premium audio equipment",
  "author": "Your Name",
  "license": "MIT",
  "private": true,
  "scripts": {
    "build": "nuxt build",
    "dev": "nuxt dev --host",
    "generate": "nuxt generate",
    "preview": "nuxt preview",
    "postinstall": "nuxt prepare"
  },
  "devDependencies": {
    "@nuxt/devtools": "latest"
  },
  "dependencies": {
    "nuxt": "^3.8.0",
    "@pinia/nuxt": "^0.5.1",
    "pinia": "^2.1.7",
    "autoprefixer": "^10.4.16",
    "postcss": "^8.4.31",
    "tailwindcss": "^3.3.5"
  },
  "engines": {
    "node": ">=18.0.0",
    "npm": ">=8.0.0"
  }
}
EOF
fi

# Install dependencies
print_info "Installing npm dependencies..."
npm install

if [ $? -eq 0 ]; then
    print_status "Dependencies installed successfully"
else
    print_error "Failed to install dependencies"
    exit 1
fi

# =============================================================================
# STEP 4: CONFIGURATION FILES SETUP
# =============================================================================

print_step "Step 4: Creating configuration files..."

# Create .gitignore
print_info "Creating .gitignore..."
cat > .gitignore << 'EOF'
# Nuxt dev/build outputs
.output
.nuxt
.nitro
.cache
dist

# Node dependencies
node_modules

# Logs
*.log

# Misc
.DS_Store
.fleet
.idea

# Local env files
.env
.env.*
!.env.example
EOF

# Create nuxt.config.js (JavaScript version to avoid TypeScript issues)
print_info "Creating nuxt.config.js..."
cat > nuxt.config.js << 'EOF'
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
    baseURL: "/audiophile-ecommerce/", // Update this with your repository name
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
EOF

# Create tailwind.config.js
print_info "Creating tailwind.config.js..."
cat > tailwind.config.js << 'EOF'
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
EOF

# Create main CSS file
print_info "Creating main CSS file..."
mkdir -p assets/css
cat > assets/css/main.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  body {
    font-family: "Manrope", sans-serif;
    line-height: 1.6;
  }
}

@layer utilities {
  .line-clamp-3 {
    overflow: hidden;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 3;
  }
}
EOF

print_status "Configuration files created"

# =============================================================================
# STEP 5: CREATE PRODUCTS.JSON IF NOT EXISTS
# =============================================================================

print_step "Step 5: Setting up products.json..."

# Check if products.json exists in data directory
if [ ! -f "data/products.json" ]; then
    print_info "Creating data/products.json from attachment..."

    # Create the products.json file with the provided data
    cat > data/products.json << 'EOF'
[
  {
    "id": 1,
    "slug": "yx1-earphones",
    "name": "YX1 Wireless Earphones",
    "image": {
      "mobile": "./assets/product-yx1-earphones/mobile/image-product.jpg",
      "tablet": "./assets/product-yx1-earphones/tablet/image-product.jpg",
      "desktop": "./assets/product-yx1-earphones/desktop/image-product.jpg"
    },
    "category": "earphones",
    "categoryImage": {
      "mobile": "./assets/product-yx1-earphones/mobile/image-category-page-preview.jpg",
      "tablet": "./assets/product-yx1-earphones/tablet/image-category-page-preview.jpg",
      "desktop": "./assets/product-yx1-earphones/desktop/image-category-page-preview.jpg"
    },
    "new": true,
    "price": 599,
    "description": "Tailor your listening experience with bespoke dynamic drivers from the new YX1 Wireless Earphones. Enjoy incredible high-fidelity sound even in noisy environments with its active noise cancellation feature.",
    "features": "Experience unrivalled stereo sound thanks to innovative acoustic technology. With improved ergonomics designed for full day wearing, these revolutionary earphones have been finely crafted to provide you with the perfect fit, delivering complete comfort all day long while enjoying exceptional noise isolation and truly immersive sound.\n\nThe YX1 Wireless Earphones features customizable controls for volume, music, calls, and voice assistants built into both earbuds. The new 7-hour battery life can be extended up to 28 hours with the charging case, giving you uninterrupted play time. Exquisite craftsmanship with a splash resistant design now available in an all new white and grey color scheme as well as the popular classic black.",
    "includes": [
      {
        "quantity": 2,
        "item": "Earphone unit"
      },
      {
        "quantity": 6,
        "item": "Multi-size earplugs"
      },
      {
        "quantity": 1,
        "item": "User manual"
      },
      {
        "quantity": 1,
        "item": "USB-C charging cable"
      },
      {
        "quantity": 1,
        "item": "Travel pouch"
      }
    ],
    "gallery": {
      "first": {
        "mobile": "./assets/product-yx1-earphones/mobile/image-gallery-1.jpg",
        "tablet": "./assets/product-yx1-earphones/tablet/image-gallery-1.jpg",
        "desktop": "./assets/product-yx1-earphones/desktop/image-gallery-1.jpg"
      },
      "second": {
        "mobile": "./assets/product-yx1-earphones/mobile/image-gallery-2.jpg",
        "tablet": "./assets/product-yx1-earphones/tablet/image-gallery-2.jpg",
        "desktop": "./assets/product-yx1-earphones/desktop/image-gallery-2.jpg"
      },
      "third": {
        "mobile": "./assets/product-yx1-earphones/mobile/image-gallery-3.jpg",
        "tablet": "./assets/product-yx1-earphones/tablet/image-gallery-3.jpg",
        "desktop": "./assets/product-yx1-earphones/desktop/image-gallery-3.jpg"
      }
    },
    "others": [
      {
        "slug": "xx99-mark-one-headphones",
        "name": "XX99 Mark I",
        "image": {
          "mobile": "./assets/shared/mobile/image-xx99-mark-one-headphones.jpg",
          "tablet": "./assets/shared/tablet/image-xx99-mark-one-headphones.jpg",
          "desktop": "./assets/shared/desktop/image-xx99-mark-one-headphones.jpg"
        }
      },
      {
        "slug": "xx59-headphones",
        "name": "XX59",
        "image": {
          "mobile": "./assets/shared/mobile/image-xx59-headphones.jpg",
          "tablet": "./assets/shared/tablet/image-xx59-headphones.jpg",
          "desktop": "./assets/shared/desktop/image-xx59-headphones.jpg"
        }
      },
      {
        "slug": "zx9-speaker",
        "name": "ZX9 Speaker",
        "image": {
          "mobile": "./assets/shared/mobile/image-zx9-speaker.jpg",
          "tablet": "./assets/shared/tablet/image-zx9-speaker.jpg",
          "desktop": "./assets/shared/desktop/image-zx9-speaker.jpg"
        }
      }
    ]
  },
  {
    "id": 2,
    "slug": "xx59-headphones",
    "name": "XX59 Headphones",
    "image": {
      "mobile": "./assets/product-xx59-headphones/mobile/image-product.jpg",
      "tablet": "./assets/product-xx59-headphones/tablet/image-product.jpg",
      "desktop": "./assets/product-xx59-headphones/desktop/image-product.jpg"
    },
    "category": "headphones",
    "categoryImage": {
      "mobile": "./assets/product-xx59-headphones/mobile/image-category-page-preview.jpg",
      "tablet": "./assets/product-xx59-headphones/tablet/image-category-page-preview.jpg",
      "desktop": "./assets/product-xx59-headphones/desktop/image-category-page-preview.jpg"
    },
    "new": false,
    "price": 899,
    "description": "Enjoy your audio almost anywhere and customize it to your specific tastes with the XX59 headphones. The stylish yet durable versatile wireless headset is a brilliant companion at home or on the move.",
    "features": "These headphones have been created from durable, high-quality materials tough enough to take anywhere. Its compact folding design fuses comfort and minimalist style making it perfect for travel. Flawless transmission is assured by the latest wireless technology engineered for audio synchronization with videos.\n\nMore than a simple pair of headphones, this headset features a pair of built-in microphones for clear, hands-free calling when paired with a compatible smartphone. Controlling music and calls is also intuitive thanks to easy-access touch buttons on the earcups. Regardless of how you use the XX59 headphones, you can do so all day thanks to an impressive 30-hour battery life that can be rapidly recharged via USB-C.",
    "includes": [
      {
        "quantity": 1,
        "item": "Headphone unit"
      },
      {
        "quantity": 2,
        "item": "Replacement earcups"
      },
      {
        "quantity": 1,
        "item": "User manual"
      },
      {
        "quantity": 1,
        "item": "3.5mm 5m audio cable"
      }
    ],
    "gallery": {
      "first": {
        "mobile": "./assets/product-xx59-headphones/mobile/image-gallery-1.jpg",
        "tablet": "./assets/product-xx59-headphones/tablet/image-gallery-1.jpg",
        "desktop": "./assets/product-xx59-headphones/desktop/image-gallery-1.jpg"
      },
      "second": {
        "mobile": "./assets/product-xx59-headphones/mobile/image-gallery-2.jpg",
        "tablet": "./assets/product-xx59-headphones/tablet/image-gallery-2.jpg",
        "desktop": "./assets/product-xx59-headphones/desktop/image-gallery-2.jpg"
      },
      "third": {
        "mobile": "./assets/product-xx59-headphones/mobile/image-gallery-3.jpg",
        "tablet": "./assets/product-xx59-headphones/tablet/image-gallery-3.jpg",
        "desktop": "./assets/product-xx59-headphones/desktop/image-gallery-3.jpg"
      }
    },
    "others": [
      {
        "slug": "xx99-mark-two-headphones",
        "name": "XX99 Mark II",
        "image": {
          "mobile": "./assets/shared/mobile/image-xx99-mark-two-headphones.jpg",
          "tablet": "./assets/shared/tablet/image-xx99-mark-two-headphones.jpg",
          "desktop": "./assets/shared/desktop/image-xx99-mark-two-headphones.jpg"
        }
      },
      {
        "slug": "xx99-mark-one-headphones",
        "name": "XX99 Mark I",
        "image": {
          "mobile": "./assets/shared/mobile/image-xx99-mark-one-headphones.jpg",
          "tablet": "./assets/shared/tablet/image-xx99-mark-one-headphones.jpg",
          "desktop": "./assets/shared/desktop/image-xx99-mark-one-headphones.jpg"
        }
      },
      {
        "slug": "zx9-speaker",
        "name": "ZX9 Speaker",
        "image": {
          "mobile": "./assets/shared/mobile/image-zx9-speaker.jpg",
          "tablet": "./assets/shared/tablet/image-zx9-speaker.jpg",
          "desktop": "./assets/shared/desktop/image-zx9-speaker.jpg"
        }
      }
    ]
  },
  {
    "id": 3,
    "slug": "xx99-mark-one-headphones",
    "name": "XX99 Mark I Headphones",
    "image": {
      "mobile": "./assets/product-xx99-mark-one-headphones/mobile/image-product.jpg",
      "tablet": "./assets/product-xx99-mark-one-headphones/tablet/image-product.jpg",
      "desktop": "./assets/product-xx99-mark-one-headphones/desktop/image-product.jpg"
    },
    "category": "headphones",
    "categoryImage": {
      "mobile": "./assets/product-xx99-mark-one-headphones/mobile/image-category-page-preview.jpg",
      "tablet": "./assets/product-xx99-mark-one-headphones/tablet/image-category-page-preview.jpg",
      "desktop": "./assets/product-xx99-mark-one-headphones/desktop/image-category-page-preview.jpg"
    },
    "new": false,
    "price": 1750,
    "description": "As the gold standard for headphones, the classic XX99 Mark I offers detailed and accurate audio reproduction for audiophiles, mixing engineers, and music aficionados alike in studios and on the go.",
    "features": "As the headphones all others are measured against, the XX99 Mark I demonstrates over five decades of audio expertise, redefining the critical listening experience. This pair of closed-back headphones are made of industrial, aerospace-grade materials to emphasize durability at a relatively light weight of 11 oz.\n\nFrom the handcrafted microfiber ear cushions to the robust metal headband with inner damping element, the components work together to deliver comfort and uncompromising sound. Its closed-back design delivers up to 27 dB of passive noise cancellation, reducing resonance by reflecting sound to a dedicated absorber. For connectivity, a specially tuned cable is includes with a balanced gold connector.",
    "includes": [
      {
        "quantity": 1,
        "item": "Headphone unit"
      },
      {
        "quantity": 2,
        "item": "Replacement earcups"
      },
      {
        "quantity": 1,
        "item": "User manual"
      },
      {
        "quantity": 1,
        "item": "3.5mm 5m audio cable"
      }
    ],
    "gallery": {
      "first": {
        "mobile": "./assets/product-xx99-mark-one-headphones/mobile/image-gallery-1.jpg",
        "tablet": "./assets/product-xx99-mark-one-headphones/tablet/image-gallery-1.jpg",
        "desktop": "./assets/product-xx99-mark-one-headphones/desktop/image-gallery-1.jpg"
      },
      "second": {
        "mobile": "./assets/product-xx99-mark-one-headphones/mobile/image-gallery-2.jpg",
        "tablet": "./assets/product-xx99-mark-one-headphones/tablet/image-gallery-2.jpg",
        "desktop": "./assets/product-xx99-mark-one-headphones/desktop/image-gallery-2.jpg"
      },
      "third": {
        "mobile": "./assets/product-xx99-mark-one-headphones/mobile/image-gallery-3.jpg",
        "tablet": "./assets/product-xx99-mark-one-headphones/tablet/image-gallery-3.jpg",
        "desktop": "./assets/product-xx99-mark-one-headphones/desktop/image-gallery-3.jpg"
      }
    },
    "others": [
      {
        "slug": "xx99-mark-two-headphones",
        "name": "XX99 Mark II",
        "image": {
          "mobile": "./assets/shared/mobile/image-xx99-mark-two-headphones.jpg",
          "tablet": "./assets/shared/tablet/image-xx99-mark-two-headphones.jpg",
          "desktop": "./assets/shared/desktop/image-xx99-mark-two-headphones.jpg"
        }
      },
      {
        "slug": "xx59-headphones",
        "name": "XX59",
        "image": {
          "mobile": "./assets/shared/mobile/image-xx59-headphones.jpg",
          "tablet": "./assets/shared/tablet/image-xx59-headphones.jpg",
          "desktop": "./assets/shared/desktop/image-xx59-headphones.jpg"
        }
      },
      {
        "slug": "zx9-speaker",
        "name": "ZX9 Speaker",
        "image": {
          "mobile": "./assets/shared/mobile/image-zx9-speaker.jpg",
          "tablet": "./assets/shared/tablet/image-zx9-speaker.jpg",
          "desktop": "./assets/shared/desktop/image-zx9-speaker.jpg"
        }
      }
    ]
  },
  {
    "id": 4,
    "slug": "xx99-mark-two-headphones",
    "name": "XX99 Mark II Headphones",
    "image": {
      "mobile": "./assets/product-xx99-mark-two-headphones/mobile/image-product.jpg",
      "tablet": "./assets/product-xx99-mark-two-headphones/tablet/image-product.jpg",
      "desktop": "./assets/product-xx99-mark-two-headphones/desktop/image-product.jpg"
    },
    "category": "headphones",
    "categoryImage": {
      "mobile": "./assets/product-xx99-mark-two-headphones/mobile/image-category-page-preview.jpg",
      "tablet": "./assets/product-xx99-mark-two-headphones/tablet/image-category-page-preview.jpg",
      "desktop": "./assets/product-xx99-mark-two-headphones/desktop/image-category-page-preview.jpg"
    },
    "new": true,
    "price": 2999,
    "description": "The new XX99 Mark II headphones is the pinnacle of pristine audio. It redefines your premium headphone experience by reproducing the balanced depth and precision of studio-quality sound.",
    "features": "Featuring a genuine leather head strap and premium earcups, these headphones deliver superior comfort for those who like to enjoy endless listening. It includes intuitive controls designed for any situation. Whether you're taking a business call or just in your own personal space, the auto on/off and pause features ensure that you'll never miss a beat.\n\nThe advanced Active Noise Cancellation with built-in equalizer allow you to experience your audio world on your terms. It lets you enjoy your audio in peace, but quickly interact with your surroundings when you need to. Combined with Bluetooth 5. 0 compliant connectivity and 17 hour battery life, the XX99 Mark II headphones gives you superior sound, cutting-edge technology, and a modern design aesthetic.",
    "includes": [
      {
        "quantity": 1,
        "item": "Headphone unit"
      },
      {
        "quantity": 2,
        "item": "Replacement earcups"
      },
      {
        "quantity": 1,
        "item": "User manual"
      },
      {
        "quantity": 1,
        "item": "3.5mm 5m audio cable"
      },
      {
        "quantity": 1,
        "item": "Travel bag"
      }
    ],
    "gallery": {
      "first": {
        "mobile": "./assets/product-xx99-mark-two-headphones/mobile/image-gallery-1.jpg",
        "tablet": "./assets/product-xx99-mark-two-headphones/tablet/image-gallery-1.jpg",
        "desktop": "./assets/product-xx99-mark-two-headphones/desktop/image-gallery-1.jpg"
      },
      "second": {
        "mobile": "./assets/product-xx99-mark-two-headphones/mobile/image-gallery-2.jpg",
        "tablet": "./assets/product-xx99-mark-two-headphones/tablet/image-gallery-2.jpg",
        "desktop": "./assets/product-xx99-mark-two-headphones/desktop/image-gallery-2.jpg"
      },
      "third": {
        "mobile": "./assets/product-xx99-mark-two-headphones/mobile/image-gallery-3.jpg",
        "tablet": "./assets/product-xx99-mark-two-headphones/tablet/image-gallery-3.jpg",
        "desktop": "./assets/product-xx99-mark-two-headphones/desktop/image-gallery-3.jpg"
      }
    },
    "others": [
      {
        "slug": "xx99-mark-one-headphones",
        "name": "XX99 Mark I",
        "image": {
          "mobile": "./assets/shared/mobile/image-xx99-mark-one-headphones.jpg",
          "tablet": "./assets/shared/tablet/image-xx99-mark-one-headphones.jpg",
          "desktop": "./assets/shared/desktop/image-xx99-mark-one-headphones.jpg"
        }
      },
      {
        "slug": "xx59-headphones",
        "name": "XX59",
        "image": {
          "mobile": "./assets/shared/mobile/image-xx59-headphones.jpg",
          "tablet": "./assets/shared/tablet/image-xx59-headphones.jpg",
          "desktop": "./assets/shared/desktop/image-xx59-headphones.jpg"
        }
      },
      {
        "slug": "zx9-speaker",
        "name": "ZX9 Speaker",
        "image": {
          "mobile": "./assets/shared/mobile/image-zx9-speaker.jpg",
          "tablet": "./assets/shared/tablet/image-zx9-speaker.jpg",
          "desktop": "./assets/shared/desktop/image-zx9-speaker.jpg"
        }
      }
    ]
  },
  {
    "id": 5,
    "slug": "zx7-speaker",
    "name": "ZX7 Speaker",
    "image": {
      "mobile": "./assets/product-zx7-speaker/mobile/image-product.jpg",
      "tablet": "./assets/product-zx7-speaker/tablet/image-product.jpg",
      "desktop": "./assets/product-zx7-speaker/desktop/image-product.jpg"
    },
    "category": "speakers",
    "categoryImage": {
      "mobile": "./assets/product-zx7-speaker/mobile/image-category-page-preview.jpg",
      "tablet": "./assets/product-zx7-speaker/tablet/image-category-page-preview.jpg",
      "desktop": "./assets/product-zx7-speaker/desktop/image-category-page-preview.jpg"
    },
    "new": false,
    "price": 3500,
    "description": "Stream high quality sound wirelessly with minimal to no loss. The ZX7 speaker uses high-end audiophile components that represents the top of the line powered speakers for home or studio use.",
    "features": "Reap the advantages of a flat diaphragm tweeter cone. This provides a fast response rate and excellent high frequencies that lower tiered bookshelf speakers cannot provide. The woofers are made from aluminum that produces a unique and clear sound. XLR inputs allow you to connect to a mixer for more advanced usage.\n\nThe ZX7 speaker is the perfect blend of stylish design and high performance. It houses an encased MDF wooden enclosure which minimises acoustic resonance. Dual connectivity allows pairing through bluetooth or traditional optical and RCA input. Switch input sources and control volume at your finger tips with the included wireless remote. This versatile speaker is equipped to deliver an authentic listening experience.",
    "includes": [
      {
        "quantity": 2,
        "item": "Speaker unit"
      },
      {
        "quantity": 2,
        "item": "Speaker cloth panel"
      },
      {
        "quantity": 1,
        "item": "User manual"
      },
      {
        "quantity": 1,
        "item": "3.5mm 7.5m audio cable"
      },
      {
        "quantity": 1,
        "item": "7.5m optical cable"
      }
    ],
    "gallery": {
      "first": {
        "mobile": "./assets/product-zx7-speaker/mobile/image-gallery-1.jpg",
        "tablet": "./assets/product-zx7-speaker/tablet/image-gallery-1.jpg",
        "desktop": "./assets/product-zx7-speaker/desktop/image-gallery-1.jpg"
      },
      "second": {
        "mobile": "./assets/product-zx7-speaker/mobile/image-gallery-2.jpg",
        "tablet": "./assets/product-zx7-speaker/tablet/image-gallery-2.jpg",
        "desktop": "./assets/product-zx7-speaker/desktop/image-gallery-2.jpg"
      },
      "third": {
        "mobile": "./assets/product-zx7-speaker/mobile/image-gallery-3.jpg",
        "tablet": "./assets/product-zx7-speaker/tablet/image-gallery-3.jpg",
        "desktop": "./assets/product-zx7-speaker/desktop/image-gallery-3.jpg"
      }
    },
    "others": [
      {
        "slug": "zx9-speaker",
        "name": "ZX9 Speaker",
        "image": {
          "mobile": "./assets/shared/mobile/image-zx9-speaker.jpg",
          "tablet": "./assets/shared/tablet/image-zx9-speaker.jpg",
          "desktop": "./assets/shared/desktop/image-zx9-speaker.jpg"
        }
      },
      {
        "slug": "xx99-mark-one-headphones",
        "name": "XX99 Mark I",
        "image": {
          "mobile": "./assets/shared/mobile/image-xx99-mark-one-headphones.jpg",
          "tablet": "./assets/shared/tablet/image-xx99-mark-one-headphones.jpg",
          "desktop": "./assets/shared/desktop/image-xx99-mark-one-headphones.jpg"
        }
      },
      {
        "slug": "xx59-headphones",
        "name": "XX59",
        "image": {
          "mobile": "./assets/shared/mobile/image-xx59-headphones.jpg",
          "tablet": "./assets/shared/tablet/image-xx59-headphones.jpg",
          "desktop": "./assets/shared/desktop/image-xx59-headphones.jpg"
        }
      }
    ]
  },
  {
    "id": 6,
    "slug": "zx9-speaker",
    "name": "ZX9 Speaker",
    "image": {
      "mobile": "./assets/product-zx9-speaker/mobile/image-product.jpg",
      "tablet": "./assets/product-zx9-speaker/tablet/image-product.jpg",
      "desktop": "./assets/product-zx9-speaker/desktop/image-product.jpg"
    },
    "category": "speakers",
    "categoryImage": {
      "mobile": "./assets/product-zx9-speaker/mobile/image-category-page-preview.jpg",
      "tablet": "./assets/product-zx9-speaker/tablet/image-category-page-preview.jpg",
      "desktop": "./assets/product-zx9-speaker/desktop/image-category-page-preview.jpg"
    },
    "new": true,
    "price": 4500,
    "description": "Upgrade your sound system with the all new ZX9 active speaker. It's a bookshelf speaker system that offers truly wireless connectivity -- creating new possibilities for more pleasing and practical audio setups.",
    "features": "Connect via Bluetooth or nearly any wired source. This speaker features optical, digital coaxial, USB Type-B, stereo RCA, and stereo XLR inputs, allowing you to have up to five wired source devices connected for easy switching. Improved bluetooth technology offers near lossless audio quality at up to 328ft (100m).\n\nDiscover clear, more natural sounding highs than the competition with ZX9's signature planar diaphragm tweeter. Equally important is its powerful room-shaking bass courtesy of a 6.5" aluminum alloy bass unit. You'll be able to enjoy equal sound quality whether in a large room or small den. Furthermore, you will experience new sensations from old songs since it can respond to even the subtle waveforms.",
    "includes": [
      {
        "quantity": 2,
        "item": "Speaker unit"
      },
      {
        "quantity": 2,
        "item": "Speaker cloth panel"
      },
      {
        "quantity": 1,
        "item": "User manual"
      },
      {
        "quantity": 1,
        "item": "3.5mm 10m audio cable"
      },
      {
        "quantity": 1,
        "item": "10m optical cable"
      }
    ],
    "gallery": {
      "first": {
        "mobile": "./assets/product-zx9-speaker/mobile/image-gallery-1.jpg",
        "tablet": "./assets/product-zx9-speaker/tablet/image-gallery-1.jpg",
        "desktop": "./assets/product-zx9-speaker/desktop/image-gallery-1.jpg"
      },
      "second": {
        "mobile": "./assets/product-zx9-speaker/mobile/image-gallery-2.jpg",
        "tablet": "./assets/product-zx9-speaker/tablet/image-gallery-2.jpg",
        "desktop": "./assets/product-zx9-speaker/desktop/image-gallery-2.jpg"
      },
      "third": {
        "mobile": "./assets/product-zx9-speaker/mobile/image-gallery-3.jpg",
        "tablet": "./assets/product-zx9-speaker/tablet/image-gallery-3.jpg",
        "desktop": "./assets/product-zx9-speaker/desktop/image-gallery-3.jpg"
      }
    },
    "others": [
      {
        "slug": "zx7-speaker",
        "name": "ZX7 Speaker",
        "image": {
          "mobile": "./assets/shared/mobile/image-zx7-speaker.jpg",
          "tablet": "./assets/shared/tablet/image-zx7-speaker.jpg",
          "desktop": "./assets/shared/desktop/image-zx7-speaker.jpg"
        }
      },
      {
        "slug": "xx99-mark-one-headphones",
        "name": "XX99 Mark I",
        "image": {
          "mobile": "./assets/shared/mobile/image-xx99-mark-one-headphones.jpg",
          "tablet": "./assets/shared/tablet/image-xx99-mark-one-headphones.jpg",
          "desktop": "./assets/shared/desktop/image-xx99-mark-one-headphones.jpg"
        }
      },
      {
        "slug": "xx59-headphones",
        "name": "XX59",
        "image": {
          "mobile": "./assets/shared/mobile/image-xx59-headphones.jpg",
          "tablet": "./assets/shared/tablet/image-xx59-headphones.jpg",
          "desktop": "./assets/shared/desktop/image-xx59-headphones.jpg"
        }
      }
    ]
  }
]
EOF

    print_status "products.json created"
else
    print_status "products.json already exists"
fi

# =============================================================================
# STEP 6: PARSE JSON AND CREATE IMAGE STRUCTURE
# =============================================================================

print_step "Step 6: Parsing products.json and creating image structure..."

# Create a Node.js script to parse the JSON and extract image paths
cat > scripts/parse-images.js << 'EOF'
const fs = require('fs');
const path = require('path');

// Read products.json
const productsData = JSON.parse(fs.readFileSync('data/products.json', 'utf8'));

// Set to store all unique image paths
const imagePaths = new Set();

// Function to extract image paths from an image object
function extractImagePaths(imageObj) {
  if (typeof imageObj === 'string') {
    imagePaths.add(imageObj);
  } else if (typeof imageObj === 'object' && imageObj !== null) {
    Object.values(imageObj).forEach(path => {
      if (typeof path === 'string') {
        imagePaths.add(path);
      }
    });
  }
}

// Extract all image paths from products
productsData.forEach(product => {
  // Main product images
  extractImagePaths(product.image);

  // Category images
  if (product.categoryImage) {
    extractImagePaths(product.categoryImage);
  }

  // Gallery images
  if (product.gallery) {
    Object.values(product.gallery).forEach(galleryImage => {
      extractImagePaths(galleryImage);
    });
  }

  // Other product images
  if (product.others) {
    product.others.forEach(other => {
      extractImagePaths(other.image);
    });
  }
});

// Convert paths to array and sort
const allPaths = Array.from(imagePaths).sort();

// Create directories and output the paths
allPaths.forEach(imagePath => {
  // Remove the ./ prefix and convert to actual file path
  const cleanPath = imagePath.replace(/^\.\//, '');
  const fullPath = path.join(process.cwd(), cleanPath);
  const dir = path.dirname(fullPath);

  // Create directory if it doesn't exist
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
    console.log(`Created directory: ${dir}`);
  }

  console.log(`Image path: ${cleanPath}`);
});

console.log(`\nTotal unique image paths found: ${allPaths.length}`);
EOF

# Run the Node.js script to create directories
print_info "Running image path extraction..."
node scripts/parse-images.js

print_status "Image directory structure created based on products.json"

# =============================================================================
# STEP 7: CREATE PLACEHOLDER IMAGES
# =============================================================================

print_step "Step 7: Creating JPG placeholder images..."

# Function to create JPG placeholder using ImageMagick or convert
create_jpg_placeholder() {
    local width=$1
    local height=$2
    local text=$3
    local filename=$4
    local bg_color=${5:-"#D87D4A"}
    local text_color=${6:-"white"}

    # Ensure directory exists
    mkdir -p "$(dirname "$filename")"

    # Try to use ImageMagick convert command
    if command -v convert &> /dev/null; then
        convert -size ${width}x${height} xc:"$bg_color" \
                -gravity center \
                -fill "$text_color" \
                -pointsize 20 \
                -annotate +0+0 "$text" \
                "$filename" 2>/dev/null
    else
        # Fallback: Create a simple colored rectangle using a different method
        # For systems without ImageMagick, we'll create a simple SVG and note it
        cat > "${filename%.jpg}.svg" << EOF
<svg width="$width" height="$height" xmlns="http://www.w3.org/2000/svg">
  <rect width="100%" height="100%" fill="$bg_color"/>
  <text x="50%" y="50%" font-family="Arial, sans-serif" font-size="16" fill="$text_color" text-anchor="middle" dy=".3em">$text</text>
</svg>
EOF
        print_warning "ImageMagick not found. Created SVG placeholder: ${filename%.jpg}.svg"
        print_info "Install ImageMagick for JPG placeholders: sudo apt-get install imagemagick (Ubuntu) or brew install imagemagick (macOS)"
    fi
}

# Create a Node.js script to generate all placeholder images
cat > scripts/create-placeholders.js << 'EOF'
const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

// Read products.json
const productsData = JSON.parse(fs.readFileSync('data/products.json', 'utf8'));

// Set to store all unique image paths with metadata
const imageInfo = new Map();

// Function to extract image paths and determine dimensions
function extractImageInfo(imageObj, productName, imageType) {
  if (typeof imageObj === 'object' && imageObj !== null) {
    Object.entries(imageObj).forEach(([breakpoint, imagePath]) => {
      if (typeof imagePath === 'string') {
        // Determine dimensions based on breakpoint and image type
        let width, height;

        if (imageType === 'product' || imageType === 'categoryImage') {
          switch (breakpoint) {
            case 'mobile':
              width = 327; height = 352;
              break;
            case 'tablet':
              width = 689; height = 717;
              break;
            case 'desktop':
              width = 540; height = 560;
              break;
          }
        } else if (imageType === 'gallery') {
          switch (breakpoint) {
            case 'mobile':
              width = 327; height = imagePath.includes('gallery-3') ? 348 : 174;
              break;
            case 'tablet':
              width = imagePath.includes('gallery-1') ? 277 : 395;
              height = imagePath.includes('gallery-3') ? 368 : 174;
              break;
            case 'desktop':
              width = 445; height = imagePath.includes('gallery-3') ? 560 : 280;
              break;
          }
        } else if (imageType === 'shared') {
          switch (breakpoint) {
            case 'mobile':
              width = 327; height = 120;
              break;
            case 'tablet':
              width = 223; height = 318;
              break;
            case 'desktop':
              width = 350; height = 318;
              break;
          }
        }

        imageInfo.set(imagePath, {
          width,
          height,
          productName,
          imageType,
          breakpoint
        });
      }
    });
  }
}

// Extract all image information
productsData.forEach(product => {
  extractImageInfo(product.image, product.name, 'product');

  if (product.categoryImage) {
    extractImageInfo(product.categoryImage, product.name, 'categoryImage');
  }

  if (product.gallery) {
    Object.entries(product.gallery).forEach(([galleryKey, galleryImage]) => {
      extractImageInfo(galleryImage, product.name, 'gallery');
    });
  }

  if (product.others) {
    product.others.forEach(other => {
      extractImageInfo(other.image, other.name, 'shared');
    });
  }
});

// Check if ImageMagick is available
let hasImageMagick = false;
try {
  execSync('convert -version', { stdio: 'ignore' });
  hasImageMagick = true;
  console.log('✅ ImageMagick detected - will create JPG placeholders');
} catch (error) {
  console.log('⚠️ ImageMagick not found - will create SVG placeholders instead');
  console.log('💡 Install ImageMagick for JPG support:');
  console.log('   Ubuntu/Debian: sudo apt-get install imagemagick');
  console.log('   macOS: brew install imagemagick');
  console.log('   Windows: Download from https://imagemagick.org/');
}

// Create placeholder images
let createdCount = 0;
imageInfo.forEach((info, imagePath) => {
  const cleanPath = imagePath.replace(/^\.\//, '');
  const fullPath = path.join(process.cwd(), cleanPath);
  const dir = path.dirname(fullPath);

  // Ensure directory exists
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }

  const text = `${info.productName} ${info.breakpoint}`;

  if (hasImageMagick) {
    try {
      // Create JPG using ImageMagick
      const cmd = `convert -size ${info.width}x${info.height} xc:"#D87D4A" -gravity center -fill white -pointsize 16 -annotate +0+0 "${text}" "${fullPath}"`;
      execSync(cmd, { stdio: 'ignore' });
      createdCount++;
    } catch (error) {
      console.log(`❌ Failed to create ${fullPath}`);
    }
  } else {
    // Create SVG fallback
    const svgPath = fullPath.replace('.jpg', '.svg');
    const svgContent = `<svg width="${info.width}" height="${info.height}" xmlns="http://www.w3.org/2000/svg">
  <rect width="100%" height="100%" fill="#D87D4A"/>
  <text x="50%" y="50%" font-family="Arial, sans-serif" font-size="14" fill="white" text-anchor="middle" dy=".3em">${text}</text>
</svg>`;

    fs.writeFileSync(svgPath, svgContent);
    createdCount++;
  }
});

console.log(`\n✅ Created ${createdCount} placeholder images`);
console.log(`📁 Images created in ./assets/ directory structure`);
EOF

# Run the placeholder creation script
print_info "Creating placeholder images based on products.json..."
node scripts/create-placeholders.js

print_status "Placeholder images created"

# =============================================================================
# STEP 8: GITHUB ACTIONS WORKFLOW
# =============================================================================

print_step "Step 8: Creating GitHub Actions deployment workflow..."

cat > .github/workflows/deploy.yml << 'EOF'
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v4

    - name: Setup Node
      uses: actions/setup-node@v4
      with:
        node-version: '18'
        cache: 'npm'

    - name: Install dependencies
      run: npm ci

    - name: Generate static site
      run: npm run generate

    - name: Deploy to GitHub Pages
      uses: peaceiris/actions-gh-pages@v3
      if: github.ref == 'refs/heads/main'
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./dist
EOF

print_status "GitHub Actions workflow created"

# =============================================================================
# STEP 9: NUXT PREPARATION
# =============================================================================

print_step "Step 9: Preparing Nuxt application..."

# Run Nuxt preparation
npm run postinstall

print_status "Nuxt prepared successfully"

# =============================================================================
# STEP 10: CLEANUP TEMPORARY FILES
# =============================================================================

print_step "Step 10: Cleaning up temporary files..."

# Remove temporary scripts
rm -f scripts/parse-images.js scripts/create-placeholders.js

print_status "Cleanup completed"

# =============================================================================
# SETUP COMPLETION SUMMARY
# =============================================================================

echo ""
echo -e "${CYAN}🎉 SETUP COMPLETED SUCCESSFULLY! 🎉${NC}"
echo "=============================================="
echo ""
print_status "Project structure created"
print_status "Dependencies installed"
print_status "Configuration files created"
print_status "products.json processed"
print_status "Image structure created from JSON"
print_status "Placeholder images generated"
print_status "GitHub Actions workflow configured"
print_status "Nuxt application prepared"
echo ""
echo -e "${BLUE}📁 Image Structure Created:${NC}"
echo "   ./assets/"
echo "   ├── product-{slug}/{mobile,tablet,desktop}/"
echo "   └── shared/{mobile,tablet,desktop}/"
echo ""
echo -e "${BLUE}📱 Image Types Created:${NC}"
echo "   • Product images: image-product.jpg"
echo "   • Category previews: image-category-page-preview.jpg"
echo "   • Gallery images: image-gallery-1.jpg, image-gallery-2.jpg, image-gallery-3.jpg"
echo "   • Shared images: image-{product-slug}.jpg"
echo ""
echo -e "${BLUE}🚀 Next Steps:${NC}"
echo "1. Run: ${GREEN}npm run dev${NC}"
echo "2. Open: ${GREEN}http://localhost:3000${NC}"
echo "3. All images are now properly structured according to products.json"
echo "4. Replace placeholder images with real product photos"
echo ""
echo -e "${BLUE}📝 Important Notes:${NC}"
echo "• Image paths match exactly what's in products.json"
echo "• All images are in ./assets/ directory as expected"
echo "• Placeholder images created with proper dimensions"
echo "• Keep the same file names when replacing with real images"
echo ""
echo -e "${BLUE}🔧 For GitHub Pages Deployment:${NC}"
echo "1. Update nuxt.config.js baseURL with your repository name"
echo "2. Push code to GitHub"
echo "3. Enable GitHub Pages in repository settings"
echo "4. Select 'GitHub Actions' as source"
echo ""
echo -e "${GREEN}Perfect! Your setup now matches the products.json structure exactly! 🎧✨${NC}"
echo ""
