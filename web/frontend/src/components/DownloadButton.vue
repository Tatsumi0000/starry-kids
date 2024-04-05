<script setup lang="ts">
import { defineProps } from "vue";

const props = defineProps<{
  text: string;
  size: number;
  disabled: boolean;
}>();
const convertTextTiImage = () => {
  const canvas = document.createElement("canvas");
  const ctx = canvas.getContext("2d")!;

  ctx.font = props.size.toString + "px serif";
  canvas.width = ctx.measureText(props.text).width;
  canvas.height = ctx.measureText(props.text).width * props.text.length;
  ctx.fillText(props.text, 0, props.size);

  const imageDataURL = canvas.toDataURL("image/png");
  const link = document.createElement("a");
  link.download = "image.png";
  link.href = imageDataURL;
  link.click();
};
</script>

<template>
  <v-btn :disabled="disabled" @click="convertTextTiImage">画像に変換</v-btn>
</template>

<style scoped></style>
