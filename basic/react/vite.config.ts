import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  root: "./",
  resolve: {
    alias: [{ find: "@/", replacement: `${__dirname}/src/` }],
  },
  plugins: [react()],
  server: {
    host: "0.0.0.0",
  },
})
