<template>
  <div class="main">
    <BackBtn v-if="route.fullPath != '/'" />
    <div class="title" @click="goHome">
      <h1 >Quizz</h1>

    </div>
    <router-view/>
  </div>
</template>

<script setup>
import HomeViewVue from "./views/HomeView.vue";
import { computed, onMounted, ref } from "vue";
import { useStore } from "vuex";
import BackBtn from "./components/BackBtn.vue";
import { useRoute, useRouter } from "vue-router";

const router = useRouter()
const route = useRoute()


const goHome = () => {
  router.push('/')
}
onMounted(()=>{
  
})
</script>
<style lang="scss">
*
{
  margin: 0;
  padding: 0;
  --main-bg-color:rgb(42, 78, 42);
  --main-color-div: rgb(194, 199, 53);
}
body{
  background: var(--main-bg-color);
  overflow-x: hidden;
  
}
.main{
  position: relative;
  width: 100vw;
  height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  .title{
    position: relative;
    margin-top: 20px;
    width: 80%;
    height: 30vh;
    text-align: center;
    display: flex;
    justify-content: center;
    align-items: center;
    color: var(--main-color-div);
    border: 2px solid var(--main-color-div) ;
    border-radius: 10px;
    box-shadow: 10px 10px 20px black, -10px 10px 20px black;
    
  }
  .title:hover{
    cursor: pointer;
  }
}
</style>
