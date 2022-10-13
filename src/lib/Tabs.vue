<template>
  <div>
    <div v-for="(item, index) in titles" :key="index">{{ item }}</div>
    <component v-for="item in defaults" :is="item"></component>
  </div>
</template>

<script lang="ts">
import Tab from "./Tab.vue";
export default {
  setup(props, context) {
    //defaults获取插槽内的东西
    const defaults = context.slots.default();
    //遍历插槽内东西，判断有无非tag标签
    defaults.forEach((tag) => {
      if (tag.type != Tab) {
        throw new Error("监测到Tabs的字标签不是Tab,请改为Tab");
      }
    });

    //获取所有tab的title
    const titles = defaults.map((item) => {
      return item.props.title;
    });

    return { defaults, titles };
  },
};
</script>

<style></style>
