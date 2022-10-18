<template>
  <h1>Dialog组件展示</h1>
  <!-- 1.普通用法 -->
  <div class="demo">
    <h2>常规用法</h2>
    <div class="demo-component">
      <component :is="Diademo1" />
    </div>
    <div class="demo-actions">
      <Button @click="show1 = !show1">查看代码</Button>
    </div>
    <div class="demo-code" v-show="show1">
      <pre>{{ Diademo1.__sourceCode }}</pre>
    </div>
  </div>

  <!-- 一键打开dialog -->
  <div class="demo">
    <h2>一键打开dialog</h2>
    <div class="demo-component">
      <component :is="Diademo2" />
    </div>
    <div class="demo-actions">
      <Button @click="show2 = !show2">查看代码</Button>
    </div>
    <div class="demo-code" v-show="show2">
      <pre>{{ Diademo2.__sourceCode }}</pre>
    </div>
  </div>
</template>

<script lang="ts">
import Dialog from "../lib/Dialog.vue";
import Button from "../lib/Button.vue";
import Diademo1 from "./Diademo/Diademo1.vue";
import Diademo2 from "./Diademo/Diademo2.vue";

import { ref } from "vue";
export default {
  components: {
    Dialog,
    Button,
  },
  setup() {
    const show1 = ref(false);
    const show2 = ref(false);
    return {
      Diademo1,
      Diademo2,
      show1,
      show2,
    };
  },
};
</script>

<style lang="scss" scoped>
$border-color: #d9d9d9;
.demo {
  border: 1px solid $border-color;
  margin: 16px 0 32px;
  > h2 {
    font-size: 20px;
    padding: 8px 16px;
    border-bottom: 1px solid $border-color;
  }
  &-component {
    padding: 16px;
  }
  &-actions {
    padding: 8px 16px;
    border-top: 1px dashed $border-color;
  }
  &-code {
    padding: 8px 16px;
    border-top: 1px dashed $border-color;
    > pre {
      line-height: 1.1;
      font-family: Consolas, "Courier New", Courier, monospace;
      margin: 0;
    }
  }
}
</style>
