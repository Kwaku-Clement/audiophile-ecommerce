# 🖼️ Image Sources & Alternatives

## Option 1: Use the Complete Setup Script (Recommended)

Run the complete setup script to automatically create all responsive placeholder images:

\`\`\`bash
chmod +x scripts/complete-setup.sh
./scripts/complete-setup.sh
\`\`\`

This will create all required directories and responsive placeholder images for mobile, tablet, and desktop breakpoints.

## Option 2: Use Individual Image Setup Script

For just images without full project setup:

\`\`\`bash
chmod +x scripts/setup-images.sh
./scripts/setup-images.sh
\`\`\`

This creates the complete responsive image structure with proper breakpoint support.

## Option 3: Manual Placeholder Creation

If you prefer to create placeholders manually, you can use these services:

### Placeholder Services

- **Placeholder.com**: `https://via.placeholder.com/WIDTH×HEIGHT/COLOR/TEXTCOLOR?text=YOUR+TEXT`
- **Picsum**: `https://picsum.photos/WIDTH/HEIGHT` (random photos)
- **Lorem Picsum**: `https://picsum.photos/seed/SEED/WIDTH/HEIGHT` (consistent photos)

### Example URLs for Manual Download - Mobile Images

\`\`\`bash

# Hero image (1200x600)

curl "https://via.placeholder.com/1200x600/D87D4A/FFFFFF?text=XX99+Mark+II+Headphones" -o public/images/design-preview.png

# Mobile category thumbnails (150x150)

curl "https://via.placeholder.com/150x150/F1F1F1/333333?text=Headphones" -o public/images/shared/mobile/image-category-thumbnail-headphones.png
curl "https://via.placeholder.com/150x150/F1F1F1/333333?text=Speakers" -o public/images/shared/mobile/image-category-thumbnail-speakers.png
curl "https://via.placeholder.com/150x150/F1F1F1/333333?text=Earphones" -o public/images/shared/mobile/image-category-thumbnail-earphones.png

# Mobile product images (327x352)

curl "https://via.placeholder.com/327x352/D87D4A/FFFFFF?text=XX99+Mark+II" -o public/images/product/xx99-mark-two-headphones/mobile/image-product.jpg
curl "https://via.placeholder.com/327x352/D87D4A/FFFFFF?text=XX99+Mark+I" -o public/images/product/xx99-mark-one-headphones/mobile/image-product.jpg
curl "https://via.placeholder.com/327x352/D87D4A/FFFFFF?text=XX59" -o public/images/product/xx59-headphones/mobile/image-product.jpg
\`\`\`

### Example URLs for Manual Download - Tablet Images

\`\`\`bash

# Tablet category thumbnails (200x200)

curl "https://via.placeholder.com/200x200/F1F1F1/333333?text=Headphones" -o public/images/shared/tablet/image-category-thumbnail-headphones.png
curl "https://via.placeholder.com/200x200/F1F1F1/333333?text=Speakers" -o public/images/shared/tablet/image-category-thumbnail-speakers.png
curl "https://via.placeholder.com/200x200/F1F1F1/333333?text=Earphones" -o public/images/shared/tablet/image-category-thumbnail-earphones.png

# Tablet product images (689x717)

curl "https://via.placeholder.com/689x717/D87D4A/FFFFFF?text=XX99+Mark+II" -o public/images/product/xx99-mark-two-headphones/tablet/image-product.jpg
curl "https://via.placeholder.com/689x717/D87D4A/FFFFFF?text=XX99+Mark+I" -o public/images/product/xx99-mark-one-headphones/tablet/image-product.jpg
curl "https://via.placeholder.com/689x717/D87D4A/FFFFFF?text=XX59" -o public/images/product/xx59-headphones/tablet/image-product.jpg
\`\`\`

### Example URLs for Manual Download - Desktop Images

\`\`\`bash

# Desktop category thumbnails (200x200)

curl "https://via.placeholder.com/200x200/F1F1F1/333333?text=Headphones" -o public/images/shared/desktop/image-category-thumbnail-headphones.png
curl "https://via.placeholder.com/200x200/F1F1F1/333333?text=Speakers" -o public/images/shared/desktop/image-category-thumbnail-speakers.png
curl "https://via.placeholder.com/200x200/F1F1F1/333333?text=Earphones" -o public/images/shared/desktop/image-category-thumbnail-earphones.png

# Desktop product images (540x560)

curl "https://via.placeholder.com/540x560/D87D4A/FFFFFF?text=XX99+Mark+II" -o public/images/product/xx99-mark-two-headphones/desktop/image-product.jpg
curl "https://via.placeholder.com/540x560/D87D4A/FFFFFF?text=XX99+Mark+I" -o public/images/product/xx99-mark-one-headphones/desktop/image-product.jpg
curl "https://via.placeholder.com/540x560/D87D4A/FFFFFF?text=XX59" -o public/images/product/xx59-headphones/desktop/image-product.jpg
\`\`\`

## Option 4: Use Real Product Images

### Where to Find Audio Equipment Images

1. **Unsplash** (Free): https://unsplash.com/s/photos/headphones
2. **Pexels** (Free): https://www.pexels.com/search/audio%20equipment/
3. **Pixabay** (Free): https://pixabay.com/images/search/headphones/

### Image Requirements

- **Format**: JPG for photos, PNG for graphics with transparency
- **Quality**: High resolution (at least 2x the display size)
- **Optimization**: Compress images for web (use tools like TinyPNG)

### Responsive Image Sizes

\`\`\`
📱 Mobile (≤480px):
• Hero Image: 1200x600px
• Product Images: 327x352px
• Category Thumbnails: 150x150px
• Gallery Images: 327x174px, 327x348px
• Shared Images: 327x120px

📱 Tablet (481px-768px):
• Hero Image: 1200x600px
• Product Images: 689x717px
• Category Thumbnails: 200x200px
• Gallery Images: 277x174px, 395x174px, 395x368px
• Shared Images: 223x318px

🖥️ Desktop (≥769px):
• Hero Image: 1200x600px
• Product Images: 540x560px
• Category Thumbnails: 200x200px
• Gallery Images: 445x280px, 445x560px
• Shared Images: 350x318px
\`\`\`

## Option 5: AI-Generated Images

You can use AI tools to generate product images:

1. **DALL-E 2/3**: Create realistic product images
2. **Midjourney**: Generate high-quality audio equipment images
3. **Stable Diffusion**: Free alternative for image generation

### Example Prompts

\`\`\`
"Professional product photo of premium black headphones on white background, studio lighting, high resolution"
"Modern wireless speaker in orange and black colors, minimalist design, product photography"
"Luxury earphones in charging case, clean white background, commercial photography style"
"Premium audio equipment showcase, multiple angles, professional lighting, e-commerce style"
\`\`\`

## 🎯 Quick Start Commands

\`\`\`bash

# Create all responsive directories

mkdir -p public/images/shared/{mobile,tablet,desktop}
mkdir -p public/images/product/{xx99-mark-two-headphones,xx99-mark-one-headphones,xx59-headphones,zx9-speaker,zx7-speaker,yx1-earphones}/{mobile,tablet,desktop}

# Run the complete setup script (recommended)

chmod +x scripts/complete-setup.sh
./scripts/complete-setup.sh

# Or run just the image setup script

chmod +x scripts/setup-images.sh
./scripts/setup-images.sh

# Or manually download a few key responsive images

curl "https://via.placeholder.com/1200x600/D87D4A/FFFFFF?text=Audiophile+Hero" -o public/images/design-preview.png
curl "https://via.placeholder.com/327x352/D87D4A/FFFFFF?text=XX99+Mark+II+Mobile" -o public/images/product/xx99-mark-two-headphones/mobile/image-product.jpg
curl "https://via.placeholder.com/689x717/D87D4A/FFFFFF?text=XX99+Mark+II+Tablet" -o public/images/product/xx99-mark-two-headphones/tablet/image-product.jpg
curl "https://via.placeholder.com/540x560/D87D4A/FFFFFF?text=XX99+Mark+II+Desktop" -o public/images/product/xx99-mark-two-headphones/desktop/image-product.jpg
\`\`\`

## 📱 Testing Responsive Images

After setting up images, test that they load correctly across all breakpoints:

1. **Start development server**: `npm run dev`
2. **Open browser developer tools** (F12)
3. **Use device toolbar** to test different screen sizes:
   - **iPhone SE (375px)** - Should load mobile images
   - **iPad (768px)** - Should load tablet images
   - **Desktop (1200px+)** - Should load desktop images
4. **Check Network tab** to verify correct images load for each breakpoint
5. **Test image loading** on actual devices if possible
6. **Check browser console** for any 404 image errors

### Breakpoint Testing Checklist

- [ ] Mobile (≤480px): 327px width images load
- [ ] Tablet (481px-768px): 689px width images load
- [ ] Desktop (≥769px): 540px width images load
- [ ] All gallery images display correctly
- [ ] Category thumbnails show proper sizes
- [ ] "You may also like" images are appropriate size

## 🔄 Replacing Placeholder Images

When you get real product images:

1. **Keep the same file names** and directory structure
2. **Match the responsive dimensions** shown above
3. **Optimize images** for web (compress file sizes)
4. **Test thoroughly** across all breakpoints
5. **Update alt text** in components if needed

\`\`\`bash

# Example: Replace responsive product images

cp your-mobile-headphones.jpg public/images/product/xx99-mark-two-headphones/mobile/image-product.jpg
cp your-tablet-headphones.jpg public/images/product/xx99-mark-two-headphones/tablet/image-product.jpg
cp your-desktop-headphones.jpg public/images/product/xx99-mark-two-headphones/desktop/image-product.jpg

# Replace hero image

cp your-hero-image.jpg public/images/design-preview.png

# Replace category thumbnails for all breakpoints

cp your-headphones-thumb-mobile.png public/images/shared/mobile/image-category-thumbnail-headphones.png
cp your-headphones-thumb-tablet.png public/images/shared/tablet/image-category-thumbnail-headphones.png
cp your-headphones-thumb-desktop.png public/images/shared/desktop/image-category-thumbnail-headphones.png
\`\`\`

## 🎨 Image Optimization Tips

1. **Use appropriate formats**:

   - JPG for photographs
   - PNG for graphics with transparency
   - SVG for simple graphics and icons

2. **Optimize file sizes**:

   - Use tools like TinyPNG, ImageOptim, or Squoosh
   - Target 80-90% quality for JPGs
   - Keep file sizes under 200KB when possible

3. **Responsive considerations**:

   - Serve smaller images for mobile devices
   - Use `srcset` and `sizes` attributes (handled automatically)
   - Consider WebP format for modern browsers

4. **Accessibility**:
   - Always include descriptive alt text
   - Ensure sufficient contrast for text overlays
   - Test with screen readers

Your e-commerce site will now have complete responsive image support that looks professional across all devices! 🎉📱💻
