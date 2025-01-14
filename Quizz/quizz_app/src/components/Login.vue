<template>
    <div class="form">
        <form @submit.prevent="handleLogin">
          <input type="text" placeholder="Entrer votre identifiant" v-model="name">
        <input type="password" placeholder="Entrer votre mot de passe" v-model="password">
        <button type="submit" >Connexion</button> 
        </form>
        <router-link to="/register">Creer un compte</router-link>
    </div>
</template>

<script setup>
import { ref , computed} from 'vue';
import { useRouter } from 'vue-router';
import { useStore } from 'vuex';

const password = ref(''),
    name = ref(''),
    url = process.env.VUE_APP_API_URL,
    route = useRouter(),
    store = useStore();

const handleLogin = async () => {
    try{
        const response = await fetch(`${url}/api/users/login`,{
            method: 'POST',
            headers: {
                'Content-type': 'application/json'
            },
            body: JSON.stringify({
                name: name.value,
                password: password.value
            })
        })
        console.log(response);
        
        if(response.ok){
            const data = await response.json()
            store.dispatch('login',data)
            console.log('connexion reussie');
            route.push('/')
            
        } else {
            console.log(response);
            
        }
    }catch(err){
        console.log(err);
        
    }
}
</script>

<style lang="scss" scoped>
form{
    width: 80%;
    height: max-content;
    display: flex;
    flex-direction: column;
    justify-content: space-around;
    align-items: center;
    input{
        margin-top: 30px;
        width: 100%;
        border-radius: 5px;
        outline: 0;
    }
    input:hover {
        border: 2px solid var(--main-color-div)

    }
    button{
        margin-top:30px;
    }
}
</style>