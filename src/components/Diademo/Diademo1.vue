<demo>
    弹窗
</demo>
<template>
  <Button @click="toggle">打开Dialog</Button>
  <Dialog
    v-model:visible="x"
    :closeOnClickOverlay="false"
    :ok="confirm"
    :cancel="cancel"
  >
    <!-- 标题部分 -->
    <template v-slot:title>
      <strong>加粗的标题</strong>
    </template>

    <!-- 内容部分 -->
    <template v-slot:content>
      <strong>hi</strong>
      <div>hi2</div>
    </template>
  </Dialog>
</template>

<script>
import Dialog from "../../lib/Dialog.vue";
import Button from "../../lib/Button.vue";
import { ref } from "vue";
export default {
  components: { Dialog, Button },
  setup() {
    const x = ref(false);
    const toggle = () => {
      x.value = !x.value;
    };
    const confirm = () => {
      return false;
    };
    const cancel = () => {};

    return {
      x,
      toggle,
      confirm,
      cancel,
    };
  },
};
</script>

<style></style>
