<template>
  <div class="peng-tabs">
    <!-- 导航区 -->
    <div class="peng-tabs-nav">
      <div
        class="peng-tabs-nav-item"
        :class="{ selected: item == selected }"
        v-for="(item, index) in titles"
        :key="index"
        @click="select(item)"
      >
        {{ item }}
      </div>
    </div>
    <!-- 内容区 -->
    <div class="peng-tabs-content">
      <component
        class="peng-tabs-content-item"
        :is="current"
        :key="current.props.title"
      ></component>
    </div>
  </div>
</template>

<script lang="ts">
import Tab from "./Tab.vue";
import { computed } from "vue";
export default {
  props: {
    selected: {
      type: String,
    },
  },
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

    //记录一下当前被选中的tab，谁被选中就展示谁的内容
    //filter返回的是一个数组，我们要的是一个变量，所以在最后加一个[0]进行取值
    const current = computed(() => {
      return defaults.filter((tag) => {
        return tag.props.title == props.selected;
      })[0];
    });

    //定义选择函数，用户点击某个标签，就通知父组件渲染相应tag的内容
    const select = (title: String) => {
      context.emit("update:selected", title);
    };

    return { defaults, titles, current, select };
  },
};
</script>

<style lang="scss">
$blue: #40a9ff;
$color: #333;
$border-color: #d9d9d9;
.peng-tabs {
  &-nav {
    display: flex;
    color: $color;
    border-bottom: 1px solid $border-color;
    &-item {
      padding: 8px 0;
      margin: 0 16px;
      cursor: pointer;
      &:first-child {
        margin-left: 0;
      }
      &.selected {
        color: $blue;
      }
    }
  }
  &-content {
    padding: 8px 0;
  }
}
</style>
