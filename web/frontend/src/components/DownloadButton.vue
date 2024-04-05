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
  // 改行コードで分割
  const lines = props.text.split("\n");

  ctx.font = props.size.toString + "px serif";
  // 1行あたりの高さを取得
  const lineHeight =
    ctx.measureText(props.text).actualBoundingBoxAscent +
    ctx.measureText(props.text).actualBoundingBoxDescent;

  canvas.width = ctx.measureText(lines[0]).width;
  canvas.height = lineHeight * lines.length;

  // canvas要素では改行を認識してくれないので「/n」で分割して1行ずつ描画
  lines.map((line, index) => {
    ctx.fillText(line, 0, 0 + (index + 1) * lineHeight);
  });

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
