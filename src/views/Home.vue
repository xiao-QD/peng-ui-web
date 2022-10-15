<template>
  <div>
    <div class="topnavAndBanner">
      <Topnav />
      <div class="banner">
        <h1>Peng-UI</h1>
        <h2>一个厉害的 UI 框架</h2>
        <p class="actions">
          <a href="https://github.com/xiao-QD/peng-ui-2">GitHub</a>
          <router-link to="/doc">开始使用</router-link>
        </p>
      </div>
    </div>
    <div class="features">
      <ul>
        <li>
          <svg>
            <use xlink:href="#icon-Vue"></use>
          </svg>
          <h3>基于 Vue 3</h3>
          <p>骄傲地使用了 Vue 3 Composition API</p>
        </li>

        <li>
          <svg>
            <use xlink:href="#icon-typescript"></use>
          </svg>
          <h3>基于 TypeScript</h3>
          <p>源代码采用 TypeScript 书写（非严格检查）</p>
        </li>

        <li>
          <svg>
            <use xlink:href="#icon-dengpao"></use>
          </svg>
          <h3>代码易读</h3>
          <p>每个组件的源代码都极其简洁</p>
        </li>
      </ul>
    </div>
  </div>
</template>
<script lang="ts">
import Topnav from "../components/Topnav.vue";
export default {
  components: { Topnav },
};
</script>
<style lang="scss" scoped>
//主页下面3个标签的样式
.features {
  margin: 64px auto;
  width: 400px;
  @media (min-width: 800px) {
    width: 800px;
  }
  @media (min-width: 1200px) {
    width: 1200px;
  }
  > ul {
    display: flex;
    flex-wrap: wrap;
    > li {
      width: 400px;
      margin: 16px 0;
      display: grid;
      justify-content: start;
      align-content: space-between;
      grid-template-areas:
        "icon title"
        "icon text";
      grid-template-columns: 80px auto;
      grid-template-rows: 1fr auto;
      > svg {
        grid-area: icon;
        width: 64px;
        height: 64px;
      }
      > h3 {
        grid-area: title;
        font-size: 28px;
      }
      > p {
        grid-area: text;
      }
    }
  }
}
//主页背景渐变色
.topnavAndBanner {
  background: linear-gradient(
    147deg,
    rgb(192, 230, 237) 59%,
    rgb(180, 180, 205) 100%
  );
  //实现圆弧效果
  clip-path: ellipse(80% 60% at 50% 40%);
}

.banner {
  padding: 100px 0;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;

  > .actions {
    padding: 8px 0;
    a {
      margin: 0 8px;
      background: rgb(189 203 231);
      display: inline-block;
      height: 38px;
      line-height: 28px;
      border-radius: 22px;
      padding: 4px 20px;
      &:hover {
        text-decoration: none;
        // background: #eee;
        background: rgb(119 109 132 / 41%);
        cursor: pointer;
      }
    }
  }
}
</style>
