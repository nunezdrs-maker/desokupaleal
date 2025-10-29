import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      './': '/src/'
    }
  },
  build: {
    outDir: 'dist',
    assetsDir: 'assets',
    sourcemap: false,
    minify: 'terser',
    terserOptions: {
      compress: {
        drop_console: true,
        drop_debugger: true
      }
    },
    rollupOptions: {
      output: {
        manualChunks: {
          'react-vendor': ['react', 'react-dom'],
          'ui-components': ['lucide-react'],
          'calendar': ['react-calendar'],
          'pdf': ['jspdf']
        }
      }
    },
    chunkSizeWarningLimit: 1000
  },
  server: {
    port: 3000,
    host: true
  },
  optimizeDeps: {
    include: ['react', 'react-dom', 'lucide-react']
  }
})
