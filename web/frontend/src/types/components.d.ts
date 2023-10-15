declare module "@vue/runtime-core" {
  type VuetifyComponents = typeof import("vuetify/components");
  export type GlobalComponents = VuetifyComponents;
}
export {};
