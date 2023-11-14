import { createApp } from "vue";
import App from "./App.vue";
import vuetify from "../plugins/vuetify";
import router from "./configs/router";
import "@mdi/font/css/materialdesignicons.css";

const app = createApp(App);
app.use(vuetify);
app.use(router);
app.mount("#app");
