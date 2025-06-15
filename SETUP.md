# 🚀 Complete Setup Guide

This guide will walk you through setting up the Audiophile E-commerce project from scratch.

## 📋 Prerequisites Checklist

Before starting, make sure you have:

- [ ] **Node.js 18+** installed ([Download here](https://nodejs.org/))
- [ ] **Git** installed ([Download here](https://git-scm.com/))
- [ ] **GitHub account** created ([Sign up here](https://github.com/))
- [ ] **Code editor** (VS Code recommended)

### Verify Installation

\`\`\`bash
node --version # Should show v18.0.0 or higher
npm --version # Should show 8.0.0 or higher
git --version # Should show git version
\`\`\`

## 🏗️ Project Setup

### Step 1: Create New Repository on GitHub

1. Go to [GitHub](https://github.com) and sign in
2. Click the **"New"** button or go to [github.com/new](https://github.com/new)
3. Fill in repository details:
   - **Repository name**: `audiophile-ecommerce`
   - **Description**: `Modern Vue 3 e-commerce application for audio equipment`
   - **Visibility**: Public (required for GitHub Pages)
   - **Initialize**: ✅ Add a README file
4. Click **"Create repository"**

### Step 2: Clone and Setup Project

\`\`\`bash

# Clone your new repository

git clone https://github.com/YOUR_USERNAME/audiophile-ecommerce.git
cd audiophile-ecommerce

# Remove the default README (we'll replace it)

rm README.md

# Initialize the project structure

mkdir -p assets/css components data pages/product plugins stores public/images
\`\`\`

### Step 3: Create Package.json

\`\`\`bash

# Initialize npm project

npm init -y

# Install dependencies

npm install nuxt@latest @pinia/nuxt pinia autoprefixer postcss tailwindcss

# Install dev dependencies

npm install -D @nuxt/devtools
\`\`\`

### Step 4: Add All Project Files

Copy all the files from the previous code project into your local directory:

- Copy `app.vue`, `nuxt.config.ts`, `tailwind.config.js`, etc.
- Copy all components into `components/` folder
- Copy all pages into `pages/` folder
- Copy the product data into `/products.json`
- Copy styles into `assets/css/main.css`

### Step 5: Test Locally

\`\`\`bash

# Start development server

npm run dev

# Open browser to http://localhost:3000

# You should see the Audiophile homepage

\`\`\`

### Step 6: Commit and Push

\`\`\`bash

# Add all files

git add .

# Commit changes

git commit -m "Initial commit: Add complete Audiophile e-commerce application"

# Push to GitHub

git push origin main
\`\`\`

## 🌐 GitHub Pages Deployment

### Step 1: Update Configuration

Edit `nuxt.config.ts` and update the baseURL:

\`\`\`typescript
export default defineNuxtConfig({
app: {
baseURL: '/audiophile-ecommerce/', // Replace with your repo name
},
// ... rest of config
})
\`\`\`

### Step 2: Create GitHub Actions Workflow

The workflow file should already be in `.github/workflows/deploy.yml`. If not, create it:

\`\`\`bash
mkdir -p .github/workflows
\`\`\`

Then add the deploy.yml file content.

### Step 3: Enable GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings** tab
3. Scroll down to **Pages** section
4. Under **Source**, select **GitHub Actions**
5. Save the settings

### Step 4: Deploy

\`\`\`bash

# Commit the configuration changes

git add .
git commit -m "Configure for GitHub Pages deployment"
git push origin main
\`\`\`

The GitHub Action will automatically:

- Install dependencies
- Build the project
- Deploy to GitHub Pages

### Step 5: Access Your Site

After deployment (usually 2-5 minutes), your site will be available at:
\`\`\`
https://YOUR_USERNAME.github.io/audiophile-ecommerce/
\`\`\`

## 🔧 Troubleshooting

### Common Issues and Solutions

**1. Build Fails - "Cannot resolve module"**
\`\`\`bash

# Clear cache and reinstall

rm -rf node_modules package-lock.json .nuxt
npm install
\`\`\`

**2. Images Not Loading on GitHub Pages**

- Ensure all images are in `public/images/` directory
- Check that image paths in `products.json` start with `/images/`
- Verify `baseURL` is set correctly in `nuxt.config.ts`

**3. GitHub Pages Shows 404**

- Check that GitHub Pages is enabled in repository settings
- Verify the GitHub Action completed successfully
- Ensure `baseURL` matches your repository name

**4. Local Development Issues**
\`\`\`bash

# Check Node.js version

node --version # Should be 18+

# Clear Nuxt cache

rm -rf .nuxt .output

# Restart dev server

npm run dev
\`\`\`

**5. Cart Not Working**

- Check browser console for JavaScript errors
- Verify localStorage is enabled in browser
- Test in incognito/private mode

## 📱 Testing Your Deployment

### Functionality Checklist

Test these features on your deployed site:

- [ ] **Homepage loads** with hero section and featured products
- [ ] **Navigation works** between all pages
- [ ] **Product pages** display correctly with images
- [ ] **Add to cart** functionality works
- [ ] **Cart modal** opens and shows items
- [ ] **Quantity updates** work in cart
- [ ] **Checkout modal** opens with form
- [ ] **Form validation** works on checkout
- [ ] **Order confirmation** appears after checkout
- [ ] **Responsive design** works on mobile
- [ ] **All images load** correctly

### Performance Testing

\`\`\`bash

# Test build locally

npm run generate
npm run preview

# Check bundle size

npm run build
\`\`\`

## 🚀 Next Steps

### Enhancements You Can Add

1. **User Authentication**

   - Add login/signup functionality
   - User profiles and order history

2. **Payment Integration**

   - Stripe or PayPal integration
   - Real payment processing

3. **Backend Integration**

   - Connect to a real database
   - Admin panel for product management

4. **Advanced Features**

   - Product search and filtering
   - User reviews and ratings
   - Wishlist functionality
   - Email notifications

5. **Performance Optimization**
   - Image optimization
   - Lazy loading
   - PWA features

### Deployment Alternatives

**Vercel (Recommended for production)**

1. Go to [vercel.com](https://vercel.com)
2. Import your GitHub repository
3. Deploy with one click

**Netlify**

1. Go to [netlify.com](https://netlify.com)
2. Connect GitHub repository
3. Set build command: `npm run generate`
4. Set publish directory: `dist`

## 📞 Getting Help

If you encounter issues:

1. **Check the console** for error messages
2. **Review the GitHub Actions** logs for deployment issues
3. **Compare your code** with the working example
4. **Search GitHub Issues** for similar problems
5. **Create a new issue** with detailed error information

## 🎉 Congratulations!

You now have a fully functional e-commerce application deployed on GitHub Pages!

Your site should be live at: `https://YOUR_USERNAME.github.io/audiophile-ecommerce/`

Share your creation and start building amazing features! 🚀
