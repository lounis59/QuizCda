<template>
<div class="home">
    <div class="Btn" @click="selectTheme" v-if="!theme">Choisir un theme</div>
    <div class="Btn" @click="removeTheme" v-if="theme">Retour</div>
    <div v-if="theme">

        <BtnQuestion :theme=" index.theme " v-for="index in theme" :key="index"  :visibility="show" @showQuestion="showMe" :question="index.theme.question"/>
    </div>
</div>

</template>

<script setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import BtnQuestion from '@/components/BtnQuestion.vue';

const route = useRouter();
const theme = ref('');
const show = ref(true)

const showMe = ()=>{
    show.value = !show.value
}
const selectTheme = () => 
{
    
    fetch('data/question.json')
    .then(response => response.json())
    .then(data => {
        theme.value = data;    
        console.log('ici' ,theme.value)})
    .catch(error => console.error('erreur lors du chargement du JSON:', error)); 
    show.value = !show.value

}
const removeTheme = () => {
    theme.value = '';
}



</script>

<style lang="scss" >

</style>