<template>
  <div>
    <div class="topnavAndBanner">
      <Topnav />
      <div class="banner">
        <h1>Peng-UI</h1>
        <h2>一个厉害的 UI 框架</h2>
        <p class="actions">
          <a href="https://github.com">GitHub</a>
          <router-link to="/doc">开始使用</router-link>
        </p>
      </div>
    </div>
    <div class="features">
      <svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-Vue"></use>
      </svg>
      <svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-typescript"></use>
      </svg>
      <svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-dengpao"></use>
      </svg>
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
.features svg {
  width: 80px;
  height: 80px;
}
//主页背景渐变色
.topnavAndBanner {
  background: linear-gradient(
    147deg,
    rgb(192, 230, 237) 59%,
    rgb(180, 180, 205) 100%
  );
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
