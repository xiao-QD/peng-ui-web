<template>
  <h1>Button组件展示</h1>
  <!-- 1.常规用法 -->
  <div class="demo">
    <h2>常规用法</h2>
    <div class="demo-component">
      <component :is="Bdemo1" />
    </div>
    <div class="demo-actions">
      <Button @click="show1 = !show1">查看代码</Button>
    </div>
    <div class="demo-code" v-show="show1">
      <pre>{{ Bdemo1.__sourceCode }}</pre>
    </div>
  </div>

  <!-- 2.不同大小 -->
  <div class="demo">
    <h2>不同大小</h2>
    <div class="demo-component">
      <component :is="Bdemo2"></component>
    </div>
    <div class="demo-actions">
      <Button @click="show2 = !show2">查看代码</Button>
    </div>
    <div class="demo-code" v-show="show2">
      <pre>{{ Bdemo2.__sourceCode }}</pre>
    </div>
  </div>

  <!-- 3不同优先级 -->
  <div class="demo">
    <h2>不同level</h2>
    <div class="demo-component">
      <component :is="Bdemo3"></component>
    </div>
    <div class="demo-actions">
      <Button @click="show3 = !show3">查看代码</Button>
    </div>
    <div class="demo-code" v-show="show3">
      <pre>{{ Bdemo3.__sourceCode }}</pre>
    </div>
  </div>

  <!-- 4支持禁用 -->
  <div class="demo">
    <h2>支持禁用</h2>
    <div class="demo-component">
      <component :is="Bdemo4"></component>
    </div>
    <div class="demo-actions">
      <Button @click="show4 = !show4">查看代码</Button>
    </div>
    <div class="demo-code" v-show="show4">
      <pre>{{ Bdemo4.__sourceCode }}</pre>
    </div>
  </div>

  <!-- 5加载中 -->
  <div class="demo">
    <h2>加载中</h2>
    <div class="demo-component">
      <component :is="Bdemo5"></component>
    </div>
    <div class="demo-actions">
      <Button @click="show5 = !show5">查看代码</Button>
    </div>
    <div class="demo-code" v-show="show5">
      <pre>{{ Bdemo5.__sourceCode }}</pre>
    </div>
  </div>
</template>
<script lang="ts">
import Button from "../lib/Button.vue";
import Bdemo1 from "./Bdemo/Bdemo1.vue";
import Bdemo2 from "./Bdemo/Bdemo2.vue";
import Bdemo3 from "./Bdemo/Bdemo3.vue";
import Bdemo4 from "./Bdemo/Bdemo4.vue";
import Bdemo5 from "./Bdemo/Bdemo5.vue";
import { ref } from "vue";

export default {
  components: { Button },
  setup() {
    const show1 = ref(false);
    const show2 = ref(false);
    const show3 = ref(false);
    const show4 = ref(false);
    const show5 = ref(false);

    return {
      Bdemo1,
      Bdemo2,
      Bdemo3,
      Bdemo4,
      Bdemo5,

      show1,
      show2,
      show3,
      show4,
      show5,
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
