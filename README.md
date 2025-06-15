# 🎧 Audiophile E-commerce

A modern, responsive e-commerce application for premium audio equipment built with Vue 3, Nuxt.js, and Tailwind CSS.

![Audiophile Preview](public/images/design-preview.png)

## ✨ Features

- 🛍️ **Complete E-commerce Functionality** - Browse products, add to cart, checkout
- 📱 **Fully Responsive Design** - Optimized for desktop, tablet, and mobile
- 🛒 **Persistent Shopping Cart** - Cart state saved in localStorage
- 💳 **Checkout Process** - Complete form validation and order processing
- 📦 **Order Confirmation** - Professional order confirmation system
- ⚡ **Fast Performance** - Optimized loading and smooth animations
- 🎨 **Modern UI/UX** - Clean design with smooth transitions
- 🔍 **SEO Optimized** - Meta tags and structured data
- 🌙 **Error Handling** - Comprehensive error states and loading indicators

## 🛠️ Tech Stack

- **Framework**: [Nuxt 3](https://nuxt.com/) - The Intuitive Vue Framework
- **Frontend**: [Vue 3](https://vuejs.org/) with Composition API
- **Styling**: [Tailwind CSS](https://tailwindcss.com/) - Utility-first CSS framework
- **State Management**: [Pinia](https://pinia.vuejs.org/) - Vue Store
- **TypeScript**: Full TypeScript support
- **Deployment**: GitHub Pages / Vercel compatible

## 🚀 Quick Start

### Prerequisites

Make sure you have the following installed:

- [Node.js](https://nodejs.org/) (version 18 or higher)
- [npm](https://www.npmjs.com/) or [yarn](https://yarnpkg.com/)
- [Git](https://git-scm.com/)

### 📥 Installation

1. **Clone the repository**
   \`\`\`bash
   git clone https://github.com/yourusername/audiophile-ecommerce.git
   cd audiophile-ecommerce
   \`\`\`

2. **Install dependencies**
   \`\`\`bash
   npm install

   # or

   yarn install
   \`\`\`

3. **Start development server**
   \`\`\`bash
   npm run dev

   # or

   yarn dev
   \`\`\`

4. **Open your browser**
   Navigate to [http://localhost:3000](http://localhost:3000)

## 📁 Project Structure

\`\`\`
audiophile-ecommerce/
├── 📁 assets/
│ └── 📁 css/
│ └── main.css # Global styles
├── 📁 components/
│ ├── CartModal.vue # Shopping cart modal
│ ├── CheckoutModal.vue # Checkout process
│ ├── Header.vue # Navigation header
│ ├── Footer.vue # Site footer
│ ├── LoadingSpinner.vue # Loading component
│ ├── OrderConfirmationModal.vue # Order success modal
│ ├── CategoryCard.vue # Product category cards
│ ├── ProductCard.vue # Product display cards
│ └── ProductShowcase.vue # Featured product display
├── 📁 data/
│ └── products.json # Product database
├── 📁 pages/
│ ├── index.vue # Homepage
│ ├── headphones.vue # Headphones category
│ ├── speakers.vue # Speakers category
│ ├── earphones.vue # Earphones category
│ └── 📁 product/
│ └── [slug].vue # Individual product pages
├── 📁 plugins/
│ └── cart.client.ts # Cart persistence plugin
├── 📁 stores/
│ └── cart.ts # Pinia cart store
├── 📁 public/
│ └── 📁 images/ # Static images
├── error.vue # Error page
├── app.vue # Root component
├── nuxt.config.ts # Nuxt configuration
├── tailwind.config.js # Tailwind configuration
└── package.json # Dependencies
\`\`\`

## 🎯 Available Scripts

\`\`\`bash

# Development

npm run dev # Start development server
npm run build # Build for production
npm run generate # Generate static site
npm run preview # Preview production build

# Deployment

npm run deploy # Deploy to GitHub Pages (after setup)
\`\`\`

## 🌐 Deployment Options

### Option 1: GitHub Pages (Free)

1. **Fork this repository** or create your own from this template

2. **Update configuration** in `nuxt.config.ts`:
   \`\`\`typescript
   export default defineNuxtConfig({
   app: {
   baseURL: '/your-repository-name/', // Replace with your repo name
   }
   })
   \`\`\`

3. **Enable GitHub Pages**:

   - Go to your repository settings
   - Scroll to "Pages" section
   - Select "GitHub Actions" as source
   - The workflow will automatically deploy on push to main

4. **Push your changes**:
   \`\`\`bash
   git add .
   git commit -m "Configure for GitHub Pages"
   git push origin main
   \`\`\`

5. **Access your site**: `https://yourusername.github.io/your-repository-name/`

### Option 2: Vercel (Recommended)

1. **Connect to Vercel**:

   - Go to [vercel.com](https://vercel.com)
   - Import your GitHub repository
   - Vercel auto-detects Nuxt.js settings

2. **Deploy**: Automatic deployment on every push to main branch

3. **Custom domain**: Add your custom domain in Vercel dashboard

### Option 3: Netlify

1. **Connect to Netlify**:
   - Go to [netlify.com](https://netlify.com)
   - Import from GitHub
   - Build command: `npm run generate`
   - Publish directory: `dist`

## 🛒 How to Use

### For Users

1. **Browse Products**: Navigate through categories or view featured items
2. **Product Details**: Click any product to view detailed information
3. **Add to Cart**: Select quantity and add items to your cart
4. **Checkout**: Complete the checkout form with your details
5. **Order Confirmation**: Receive confirmation of your order

### For Developers

1. **Add Products**: Edit `data/products.json` to add new products
2. **Customize Styling**: Modify Tailwind classes or add custom CSS
3. **Add Features**: Extend functionality with new Vue components
4. **Configure**: Update `nuxt.config.ts` for your needs

## 🎨 Customization

### Adding New Products

Edit `data/products.json`:
\`\`\`json
{
"id": 7,
"slug": "new-product",
"name": "New Product Name",
"image": "/images/product/new-product.jpg",
"category": "headphones",
"categoryImage": "/images/category-headphones.png",
"new": true,
"price": 1299,
"description": "Product description...",
"features": "Product features...",
"includes": [
{ "quantity": 1, "item": "Headphone unit" },
{ "quantity": 1, "item": "User manual" }
],
"gallery": [
"/images/product/gallery-1.jpg",
"/images/product/gallery-2.jpg"
],
"others": []
}
\`\`\`

### Styling Changes

- **Colors**: Update `tailwind.config.js` color palette
- **Fonts**: Modify font imports in `nuxt.config.ts`
- **Layout**: Edit component templates and Tailwind classes

## 🔧 Configuration

### Environment Variables

Create `.env` file for custom configuration:
\`\`\`env
NUXT_PUBLIC_SITE_URL=https://yourdomain.com
NUXT_PUBLIC_SITE_NAME=Audiophile
\`\`\`

### SEO Configuration

Update meta tags in `nuxt.config.ts`:
\`\`\`typescript
app: {
head: {
title: 'Your Site Title',
meta: [
{ name: 'description', content: 'Your site description' }
]
}
}
\`\`\`

## 🐛 Troubleshooting

### Common Issues

**Build fails on GitHub Pages**

- Ensure `baseURL` is set correctly in `nuxt.config.ts`
- Check that all image paths are correct

**Cart not persisting**

- Verify localStorage is available in your browser
- Check browser console for errors

**Images not loading**

- Ensure images are in the `public/images/` directory
- Verify image paths in `products.json`

**Development server won't start**
\`\`\`bash

# Clear cache and reinstall

rm -rf node_modules package-lock.json
npm install
npm run dev
\`\`\`

## 📱 Browser Support

- ✅ Chrome (latest)
- ✅ Firefox (latest)
- ✅ Safari (latest)
- ✅ Edge (latest)
- ✅ Mobile browsers

## 🤝 Contributing

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Commit changes**: `git commit -m 'Add amazing feature'`
4. **Push to branch**: `git push origin feature/amazing-feature`
5. **Open a Pull Request**

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Design inspiration from Frontend Mentor
- Icons from Lucide React
- Fonts from Google Fonts
- Built with love using Vue.js ecosystem

## 📞 Support

If you have any questions or need help:

- 📧 **Email**: your-email@example.com
- 🐛 **Issues**: [GitHub Issues](https://github.com/yourusername/audiophile-ecommerce/issues)
- 💬 **Discussions**: [GitHub Discussions](https://github.com/yourusername/audiophile-ecommerce/discussions)

---

⭐ **Star this repository if you found it helpful!**

Made with ❤️ by [Your Name](https://github.com/yourusername)
