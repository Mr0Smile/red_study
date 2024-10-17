import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";

import ElementPlus from "element-plus";
import zhCn from "element-plus/dist/locale/zh-cn.mjs";
import * as ElementPlusIconsVue from "@element-plus/icons-vue";

import VueMarkdownEditor from "@kangc/v-md-editor";
import "@kangc/v-md-editor/lib/style/base-editor.css";
import vuepressTheme from "@kangc/v-md-editor/lib/theme/vuepress.js";
import "@kangc/v-md-editor/lib/theme/style/vuepress.css";

import Prism from "prismjs";

import "@/assets/css/global.css";

const app = createApp(App);

VueMarkdownEditor.use(vuepressTheme, {
	Prism,
});

app.use(router);
app.use(ElementPlus, {
	locale: zhCn,
});
app.use(VueMarkdownEditor);
app.mount("#app");

for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
	app.component(key, component);
}
