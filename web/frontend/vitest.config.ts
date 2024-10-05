import { defineConfig } from "vitest/config";
import { fileURLToPath, URL } from "node:url";
import vue from "@vitejs/plugin-vue";
import vuetify from "vite-plugin-vuetify";

export default defineConfig({
    plugins: [vue(), vuetify({ autoImport: true })],
    test: {
      globals: true,
      environment: "jsdom",
      server: {
        deps: {
          inline: ["vuetify"],
        },
      },
    },
    resolve: {
    alias: {
      "@": fileURLToPath(new URL("./src", import.meta.url)),
    },
  },
});
