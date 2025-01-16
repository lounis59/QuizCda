<template>
<div>
    <div class="Btn" v-if="visibility" @click="$emit('showQuestion')">{{ theme }}</div>
    <div class="question " v-for="index of questions" :key="index" v-else>
        <legend >{{ index.question}}</legend>
        <div >
                <label for="1" > {{ index.reponce }}</label>
                <input type="radio" :name="theme" id="1" >
        </div>
        

    </div>
</div>
</template>

<script setup>
import { ref } from 'vue';


const props = defineProps({
    theme: String,
    question: String,
    reponse: String,
    visibility: Boolean,
    questions: Array,
    responses: Array
})


</script>

<style lang="scss" scoped>
.question{
        width: max-content;
        height: max-content;
        padding: 20px;
        border: solid 1px var(--main-color-div);
        border-radius: 10px;
        margin :30px;
        label,legend{
                margin: 30px;
                color: var(--main-color-div);
        }
}
</style>