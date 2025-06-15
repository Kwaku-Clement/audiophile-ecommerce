<template>
  <footer class="bg-black text-white">
    <div class="container mx-auto px-4 py-12">
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
        <!-- Logo and Description -->
        <div class="lg:col-span-2">
          <h3 class="text-2xl font-bold mb-4">audiophile</h3>
          <p class="text-gray-400 mb-6 max-w-md">
            Audiophile is an all in one stop to fulfill your audio needs. We're a small team of music lovers
            and sound specialists who are devoted to helping you get the most out of personal audio.
            Come and visit our demo facility - we're open 7 days a week.
          </p>
          <div class="flex space-x-4">
            <a href="#" class="text-white hover:text-orange-500 transition-colors" aria-label="Facebook">
              <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
                <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/>
              </svg>
            </a>
            <a href="#" class="text-white hover:text-orange-500 transition-colors" aria-label="Twitter">
              <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
                <path d="M23.953 4.57a10 10 0 01-2.825.775 4.958 4.958 0 002.163-2.723c-.951.555-2.005.959-3.127 1.184a4.92 4.92 0 00-8.384 4.482C7.69 8.095 4.067 6.13 1.64 3.162a4.822 4.822 0 00-.666 2.475c0 1.71.87 3.213 2.188 4.096a4.904 4.904 0 01-2.228-.616v.06a4.923 4.923 0 003.946 4.827 4.996 4.996 0 01-2.212.085 4.936 4.936 0 004.604 3.417 9.867 9.867 0 01-6.102 2.105c-.39 0-.779-.023-1.17-.067a13.995 13.995 0 007.557 2.209c9.053 0 13.998-7.496 13.998-13.985 0-.21 0-.42-.015-.63A9.935 9.935 0 0024 4.59z"/>
              </svg>
            </a>
            <a href="#" class="text-white hover:text-orange-500 transition-colors" aria-label="Instagram">
              <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12.017 0C5.396 0 .029 5.367.029 11.987c0 6.62 5.367 11.987 11.988 11.987 6.62 0 11.987-5.367 11.987-11.987C24.014 5.367 18.637.001 12.017.001zM8.449 16.988c-1.297 0-2.448-.49-3.323-1.297C4.198 14.895 3.708 13.744 3.708 12.447s.49-2.448 1.418-3.323C6.001 8.198 7.152 7.708 8.449 7.708s2.448.49 3.323 1.416c.875.875 1.365 2.026 1.365 3.323s-.49 2.448-1.365 3.323c-.875.807-2.026 1.218-3.323 1.218z"/>
              </svg>
            </a>
          </div>
        </div>

        <!-- Quick Links -->
        <div>
          <h4 class="font-bold mb-4 text-lg">Quick Links</h4>
          <ul class="space-y-2">
            <li><NuxtLink to="/" class="text-gray-400 hover:text-white transition-colors">Home</NuxtLink></li>
            <li><NuxtLink to="/headphones" class="text-gray-400 hover:text-white transition-colors">Headphones</NuxtLink></li>
            <li><NuxtLink to="/speakers" class="text-gray-400 hover:text-white transition-colors">Speakers</NuxtLink></li>
            <li><NuxtLink to="/earphones" class="text-gray-400 hover:text-white transition-colors">Earphones</NuxtLink></li>
          </ul>
        </div>

        <!-- Contact Info -->
        <div>
          <h4 class="font-bold mb-4 text-lg">Contact</h4>
          <div class="space-y-2 text-gray-400">
            <p>Weija SCC, Accra, Ghana</p>
            <p>Opposite New Vission Hotel</p>
            <p>+233 241 065594</p>
            <p>caduasante@gmail.com</p>
          </div>
        </div>
      </div>

      <div class="border-t border-gray-800 mt-8 pt-8 text-center text-gray-400">
        <p>&copy; 2025 Audiophile. All Rights Reserved.</p>
      </div>
    </div>
  </footer>
</template>

<style scoped>
.footer {
  background-color: #191919;
  color: white;
  padding: 75px 0 48px;
}

.footer-content {
  position: relative;
}

.footer-content::before {
  content: '';
  position: absolute;
  top: -75px;
  left: 0;
  width: 101px;
  height: 4px;
  background-color: #D87D4A;
}

.footer-top {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 36px;
}

.footer-logo a {
  font-size: 25px;
  font-weight: 700;
  color: white;
  text-decoration: none;
  letter-spacing: -0.36px;
}

.footer-nav {
  display: flex;
  gap: 34px;
}

.footer-nav a {
  color: white;
  text-decoration: none;
  font-weight: 700;
  font-size: 13px;
  letter-spacing: 2px;
  text-transform: uppercase;
  transition: color 0.3s ease;
}

.footer-nav a:hover {
  color: #D87D4A;
}

.footer-middle {
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
  margin-bottom: 56px;
}

.footer-description {
  font-size: 15px;
  line-height: 25px;
  color: #979797;
  max-width: 540px;
}

.social-links {
  display: flex;
  gap: 16px;
}

.social-links a {
  transition: opacity 0.3s ease;
}

.social-links a:hover {
  opacity: 0.7;
}

.copyright {
  font-size: 15px;
  font-weight: 700;
  color: #979797;
}

@media (max-width: 768px) {
  .footer-top,
  .footer-middle {
    flex-direction: column;
    align-items: flex-start;
    gap: 32px;
  }

  .footer-nav {
    flex-direction: column;
    gap: 16px;
  }

  .social-links {
    align-self: center;
  }

  .footer-description {
    text-align: center;
  }

  .copyright {
    text-align: center;
  }
}
</style>
