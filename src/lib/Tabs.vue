<template>
  <div class="peng-tabs">
    <!-- 导航区 -->
    <div class="peng-tabs-nav" ref="container">
      <div
        class="peng-tabs-nav-item"
        :class="{ selected: item == selected }"
        v-for="(item, index) in titles"
        :ref="
          (el) => {
            if (item == selected) selectedItem = el;
          }
        "
        :key="index"
        @click="select(item)"
      >
        {{ item }}
      </div>
      <!-- 会滑动的线 -->
      <div class="peng-tabs-nav-indicator" ref="indicator"></div>
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
import { computed, ref, watchEffect, onMounted } from "vue";
export default {
  props: {
    selected: {
      type: String,
    },
  },
  setup(props, context) {
    // @ts-ignore
    //在上面导航区div中，使用  :ref=" (el) => {if (el) navItems[index] = el;}"

    // ref<> ，尖括号中是TS的参数
    //selectedItem是当前选中的div
    const selectedItem = ref<HTMLDivElement>(null);
    const indicator = ref<HTMLDivElement>(null);
    const container = ref<HTMLDivElement>(null);

    //使用watchEffect，在初次以及后续每次变化的时候触发，
    //实时计算出下划线的宽度以及移动后的位置
    //将watchEffect嵌套在onMounted中是官方文档给的做法，因为watchEffect会在onMounted之前执行，
    //但是此时很多变量还没有值，产生报错，这样做可以避免问题的出现
    onMounted(() => {
      watchEffect(() => {
        //获取被选中元素的div宽度
        const { width } = selectedItem.value.getBoundingClientRect();
        //成功将“导航1”的宽度赋值给下划线
        indicator.value.style.width = width + "px";
        //获取container这个div的left值，在计算下换线移动位置的时候用到
        const { left: left1 } = container.value.getBoundingClientRect();
        //获取当前所选择的这个标签的left
        const { left: left2 } = selectedItem.value.getBoundingClientRect();
        const left = left2 - left1;
        //点击不同的导航，下划线的left都要重新计算、生效
        indicator.value.style.left = left + "px";
      });
    });

    //defaults获取插槽内的东西
    const defaults = context.slots.default();
    //遍历插槽内东西，判断有无非tag标签
    defaults.forEach((tag) => {
      // @ts-ignore
      if (tag.type.name != Tab.name) {
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

    return {
      defaults,
      titles,
      current,
      select,
      selectedItem,
      indicator,
      container,
    };
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
    position: relative;
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
    &-indicator {
      position: absolute;
      height: 3px;
      background: $blue;
      left: 0;
      bottom: -1px;
      width: 100px;
      transition: all 250ms;
    }
  }
  &-content {
    padding: 8px 0;
  }
}
</style>
