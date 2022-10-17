import "./lib/peng.scss";
import "./index.scss";
import { createApp } from "vue";
import App from "./App.vue";
import { router } from "./router";
//引入下载好的github-markdown-css,用于介绍、安装、开始页
import 'github-markdown-css'



const app = createApp(App);
app.use(router);
app.mount("#app");
