import path from "path";
/* eslint-disable import/no-extraneous-dependencies */
import { defineConfig } from "vite";
import solidPlugin from "vite-plugin-solid";

export default defineConfig({
  plugins: [solidPlugin()],
  server: {
    port: 3000,
  },
  build: {
    target: "esnext",
  },
  resolve: {
    alias: {
      "@assets": path.resolve(__dirname, "src/assets"),
      "@features": path.resolve(__dirname, "src/features"),
    },
  },
});
