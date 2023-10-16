import { createRouter, createWebHistory } from "vue-router";
import TopPage from "../pages/TopPage.vue";

const routes = [
  { path: "/", name: "TopPage", component: TopPage },
  { path: "/:catchAll(.*)", redirect: "/" },
];

const router = createRouter({
  history: createWebHistory(),
  routes: routes,
});

export default router;
