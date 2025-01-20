<template>
<div>
    <div class="Btn" v-if="visibility" @click="$emit('showQuestion')">{{ theme }}</div>
    <div class="question " v-for="index of questions" :key="index" v-else>
        <div class="Q" @click="getResponse(index.id)">{{ index.question}}</div>
        <div v-for="item in responce" :key="item" v-if="show">
            
        
                <label for="1" > {{ item }}</label>
                <input type="radio" :name="theme" id="1" >
               
        </div>
        

    </div>
</div>
</template>

<script setup>
import { ref } from 'vue';

const url = process.env.VUE_APP_API_URL
const responce = ref([])
const show = ref(false)
const props = defineProps({
    theme: String,
    question: String,
    reponse: String,
    visibility: Boolean,
    questions: Array,
    responses: Array
})
 const getResponse = async (id) => {
    try{
        const response = await fetch(`${url}/api/themes/response/${id}`,
        {
        method: 'GET',
            headers: {
                'Content-Type' : 'application/json'
            }
        }
        )
        if(response.ok){
            responce.value = []
            const data = await response.json()
            const tableau = ref()
            data.forEach(elem => {
                tableau.value = elem.mauvaise.split(" , ")
                responce.value.push(elem.bonne ,tableau.value.forEach(index => responce.value.push(index)) )
                
                
            })
            console.log("ici le tableau",tableau.value);
            tableau.value = []
            
            show.value = !show.value
            console.log("jkdsygfiuh",responce.value);
            
        }
    } catch (err) {
        console.log(err);
        
    }
 }

</script>

<style lang="scss" scoped>
.question,.Q{
        width: max-content;
        height: max-content;
        padding: 20px;
        border: solid 1px var(--main-color-div);
        border-radius: 10px;
        margin :30px;
        label{
                margin: 30px;
                color: var(--main-color-div);
        }
        
}
</style>