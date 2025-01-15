<template>
<div>
    <div class="Btn" v-if="visibility" @click="$emit('showQuestion')">{{ theme }}</div>
    <div class="question" v-else>
        <legend>{{ question }}</legend>
<label for="1">{{ reponse }}</label>        
        <input type="radio" :name="theme" id="1">
<label for="2">{{ reponse }}</label>
        <input type="radio" :name="theme" id="2">
<label for="3">{{ reponse }}</label>
        <input type="radio" :name="theme" id="3">
<label for="4">{{ reponse }}</label>
        <input type="radio" :name="theme" id="4">
    </div>
</div>
</template>

<script setup>
import { ref } from 'vue';


const props = defineProps({
    theme: String,
    question: String,
    reponse: String,
    visibility: Boolean
})

</script>

<style lang="scss" scoped>

</style>