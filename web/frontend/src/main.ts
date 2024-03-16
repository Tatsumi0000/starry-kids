import { createApp } from "vue";
import App from "./App.vue";
import VueGtag from "vue-gtag";
import vuetify from "../plugins/vuetify";
import router from "./configs/router";
import "@mdi/font/css/materialdesignicons.css";

const app = createApp(App);
app.use(vuetify);
app.use(router);
app.use(VueGtag, {
    config: { id: "G-9VS0SV5JBW" }
});
app.mount("#app");
