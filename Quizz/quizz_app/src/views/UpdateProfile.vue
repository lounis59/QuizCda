<template>
 <div class="home">
    <input type="text" :placeholder= store.state.users.name  v-model="username" >
    <input type="text" placeholder="Entrer nouveaux mot de passe"  v-model="password">
    <input type="text" :placeholder= store.state.users.email  v-model="email">
    <input type="text" :placeholder=store.state.users.firstName v-model="firstName">
    <input type="text" :placeholder= store.state.users.lastName  v-model="lastName">
    <div class="Btn" @click="submitUpdate">Valider</div>
 </div>
</template>

<script setup>

import { ref } from 'vue';
import { useRouter } from 'vue-router';
import { useStore } from 'vuex';


const store = useStore();
const username = ref(''),
password = ref(''),
email = ref(''),
firstName = ref(''),
lastName = ref('');
const route =useRouter()

const submitUpdate = async () => {

    try{

        const response = await fetch(`${process.env.VUE_APP_API_URL}/api/users/update`,{
           method: 'PUT',
           headers: {
             'Content-Type': 'application/json',
           },
           body: JSON.stringify({name: username.value, password : password.value, email: email.value, prenom: firstName.value , nom: lastName.value, id : store.state.users.id})
        })
        if (response.ok) {
            const data = await response.json()
            store.dispatch('login' , data)
            console.log("modification reussie" , localStorage.getItem('user'));
         route.push('/profil')
        
        }
    } catch (err) {
        console.log(err);
        
    }
}
</script>

<style lang="scss" scoped>
input{
        margin: 30px;
        width: 200px;
        border-radius: 5px;
        outline: 0;
    }
    input:hover {
        border: 2px solid var(--main-color-div)

    }
</style>