<script setup lang="ts">
import { onMounted, ref } from "vue";
import {
  TextToMoonsUsecaseImpl,
  TextToMoonsUsecase,
} from "../features/starrykids/usecase/TextToMoonsUsecase";
import { TextToMoonsRequest } from "../features/starrykids/model/TextToMoons";

defineProps<{ msg: string }>();

const count = ref(0);
const usecase: TextToMoonsUsecase = new TextToMoonsUsecaseImpl();
const request: TextToMoonsRequest = { text: "all", size: 20 };

onMounted(async () => {
  const moons = await usecase.getMoons(request);
  console.log(moons);
  moons.response.forEach((moon: string) => {
    console.log(moon);
  });
});
</script>

<template> 
  <h1>{{ msg }}</h1>
  <v-btn color="red"></v-btn>
  <div class="card">
    <button type="button" @click="count++">count is {{ count }}</button>
    <p>
      Edit
      <code>components/HelloWorld.vue</code> to test HMR
    </p>
  </div>

  <p>
    Check out
    <a href="https://vuejs.org/guide/quick-start.html#local" target="_blank"
      >create-vue</a
    >, the official Vue + Vite starter
  </p>
  <p>
    Install
    <a href="https://github.com/vuejs/language-tools" target="_blank">Volar</a>
    in your IDE for a better DX
  </p>
  <p class="read-the-docs">Click on the Vite and Vue logos to learn more</p>
</template>

<style scoped>
.read-the-docs {
  color: #888;
}
</style>
