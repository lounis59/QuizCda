<template>
<div class="Btn back" @click="back">Retour</div>

</template>

<script setup>
import { useStore } from 'vuex';
import { useRouter , useRoute} from 'vue-router';

const store = useStore();
const router = useRouter();
const route = useRoute()
const comonRoute = route.fullPath

console.log('aaaaaaaaa', comonRoute);

const back = () => {

    // store.dispatch('saveRoute', comonRoute)
    router.back()
    

}

</script>

<style lang="scss">
.back{
    position: relative;
    margin: 30px;
    left: 0px;
    top:50px;
    width: 150px;
    height: 50px;
    color: var(--main-color-div);
    border: 2px solid var(--main-color-div);
    text-align: center;
    padding-top: 22.5px;
    border-radius: 10px;
    font-size: 1.5rem;
}
</style>