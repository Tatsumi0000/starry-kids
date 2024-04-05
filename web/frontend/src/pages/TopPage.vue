<script setup lang="ts">
import { onErrorCaptured, ref, computed, ComputedRef } from "vue";
import {
  TextToMoonsUsecase,
  TextToMoonsUsecaseImpl,
} from "../features/starrykids/usecase/TextToMoonsUsecase";
import { TextToMoonsRequest } from "../features/starrykids/model/TextToMoons";
import TheFooter from "../components/TheFooter.vue";
import DownloadButton from "../components/DownloadButton.vue";

// リクエストするときのサイズ
const size = ref<number>(15);
// textareaのフォントサイズ
const textareaFontSize = ref<number>(15);
// textareaのフォントサイズをpxに変換
const computedTextareaFontSize = computed(() => `${textareaFontSize.value}px`);
const text = ref<string>("");
const isValid = ref<boolean>(false);
const response = ref<string[]>([]);
const copySnackbar = ref({
  show: false,
  text: "コピーしました",
});
const validateSnackbar = ref({
  show: false,
  text: "入力内容に不備があります",
});

const howToUses = ref<string[]>([
  "入力したテキストを月の絵文字に変換します",
  "月のサイズは10 ~ 100の数字を入力してください（おすすめは15）",
  "月文字にしたいテキストは1 ~ 20文字以内にしてください",
  "初回変換時は少し時間がかかります",
]);

const usecase: TextToMoonsUsecase = new TextToMoonsUsecaseImpl();
const request: ComputedRef<TextToMoonsRequest> = computed(() => ({
  size: size.value,
  text: text.value,
}));
const moonText: ComputedRef<string> = computed(() => {
  return response.value.join("");
});
const inputNumberOnly = (inputValue: string): boolean | string => {
  // 数字のみの入力を許可する
  const regex = /^[0-9]+$/;
  return regex.test(inputValue) || "数字を入力してください";
};
const inputNumber10to100 = (inputValue: string): boolean | string => {
  // 10 ~ 100の数字のみの入力を許可する
  const regex = /^[1-9][0-9]$|^100$/;
  return regex.test(inputValue) || "10 ~ 100の数字を入力してください";
};

const inputText1to20 = (inputValue: string): boolean | string => {
  // 文字数が1 ~ 20文字の入力を許可する
  if (1 <= inputValue.length && inputValue.length <= 20) return true;
  return "変換できる文字数は1 ~ 20文字までです";
};

const sendRequest = async () => {
  if (isValid.value) {
    try {
      const result = await usecase.getMoons(request.value);
      response.value = result.response;
    } catch (error) {
      // if (error instanceof Error) throw new Error(error.message);
      throw new Error("不明なエラーが発生しました");
    }
  } else {
    throw new Error("入力内容に不備があります");
  }
};
const copy = () => {
  navigator.clipboard.writeText(moonText.value);
  copySnackbar.value.show = true;
};

onErrorCaptured((err: Error) => {
  validateSnackbar.value.text = err.message;
  validateSnackbar.value.show = true;
  return false;
});
</script>

<template>
  <v-app>
    <v-container>
      <v-row>
        <v-col class="d-flex justify-center">
          <v-card width="400" color="primary">
            <v-card-item>
              <v-card-title>このサービスについて</v-card-title>
              <div v-for="howToUse in howToUses" :key="howToUse">
                {{ howToUse }}
              </div>
            </v-card-item>
          </v-card>
        </v-col>
      </v-row>
      <v-row>
        <v-col cols="12" md="6" lg="6">
          <v-sheet class="bg-deep-purple pa-12" rounded>
            <v-card class="mx-auto px-6 py-8" max-width="344">
              <v-form @submit.prevent v-model="isValid">
                <v-text-field
                  v-model="size"
                  :rules="[inputNumberOnly, inputNumber10to100]"
                  label="月のサイズ"
                  placeholder="10 ~ 100"
                ></v-text-field>

                <v-text-field
                  v-model="text"
                  label="月文字にしたいテキスト"
                  placeholder="Hello!"
                  :rules="[inputText1to20]"
                  counter="20"
                ></v-text-field>

                <v-btn
                  block
                  color="success"
                  size="large"
                  type="submit"
                  variant="elevated"
                  @click="sendRequest"
                >
                  変換
                </v-btn>
              </v-form>
            </v-card>
          </v-sheet>
        </v-col>
        <v-col cols="12" md="6" lg="6">
          <v-row class="mt-2 ml-1 mb-2">
            <v-btn @click="copy">コピー</v-btn>
            <DownloadButton
              class="ml-2"
              :text="moonText"
              :size="textareaFontSize"
              :disabled="moonText.length === 0"
            />
          </v-row>
          <v-row class="mt-2 ml-1">
            <v-chip variant="outlined" color="primary" label>
              テキストサイズ
            </v-chip>
            <v-slider
              v-model="textareaFontSize"
              :min="5"
              :max="30"
              :step="1"
              thumb-label
              color="primary"
            ></v-slider>
          </v-row>
          <v-textarea
            v-model="moonText"
            readonly
            auto-grow
            class="textarea-fontsize"
          />
        </v-col>
      </v-row>
    </v-container>
    <v-snackbar color="green" v-model="copySnackbar.show">
      {{ copySnackbar.text }}
    </v-snackbar>
    <v-snackbar color="red" v-model="validateSnackbar.show">
      {{ validateSnackbar.text }}
    </v-snackbar>
    <TheFooter />
  </v-app>
</template>

<style scoped lang="scss">
.logo {
  height: 6em;
  padding: 1.5em;
  will-change: filter;
  transition: filter 300ms;
}
.logo:hover {
  filter: drop-shadow(0 0 2em #646cffaa);
}
.logo.vue:hover {
  filter: drop-shadow(0 0 2em #42b883aa);
}

.textarea-fontsize :deep(textarea) {
  font-size: v-bind(computedTextareaFontSize);
}
</style>
