<script setup lang="ts">
import myIcon from "../assets/tatsumi0000.webp";
import { ref } from "vue";

const icon = ref(myIcon);
const openWindow = (url: string) => {
  window.open(url, "_blank");
};
</script>

<template>
  <v-container>
    <v-footer app class="bg-indigo-lighten-1 flex-column">
      <v-btn
        class="ma-2"
        color="primary"
        @click="openWindow('https://github.com/Tatsumi0000/starry-kids/')"
      >
        <v-icon start icon="mdi-github"></v-icon>
        <span>GitHub</span>
      </v-btn>
      <v-row>
        <v-col cols="2">
          <v-img :src="icon" height="40" width="40" />
        </v-col>
        <v-col cols="10">
          Copyright © {{ new Date().getFullYear() }}, Tatsumi0000 All Rights Reserved.
        </v-col>
      </v-row>
    </v-footer>
  </v-container>
</template>

<style scoped lang="scss"></style>
