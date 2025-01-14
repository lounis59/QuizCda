<template>
<div class="home">
   
    <form @submit.prevent="handleRegister">
          <input type="text" placeholder="Entrer votre identifiant" v-model="name">
        <input type="password" placeholder="Entrer votre mot de passe" v-model="password" required>
        <p v-if="mdpErr">{{errorMessage}}</p>
        <input type="password" placeholder="Confirmer votre mot de passe" v-model="passwordBis" required>
        <input type="text" v-model="email" placeholder="Entrer votre adresse Email">
        <input type="text" v-model="nom" placeholder="Entrer votre Nom">
        <input type="text" v-model="prenom" placeholder="Enrer votre Prenom">

        <button type="submit" >Connexion</button> 
        <p v-if="isGood">vous ete inscrit !</p>
        </form>
        <router-link to="/sign">Cse connecter</router-link>
</div>
</template>

<script setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';

const name  = ref(''),
    password = ref(''),
    passwordBis = ref(''),
    email = ref(''),
    nom = ref(''),
    prenom = ref(''),
    mdpErr = ref(false),
    isGood = ref(false);
    
const errorMessage = ref('a')
const url = process.env.VUE_APP_API_URL;
const router = useRouter();
const handleRegister = async () => {
   try {
      if (password.value !== passwordBis.value) {
         mdpErr.value = true;
         errorMessage.value = 'les mot de passe sont pareil';
         return;
      }
      const response = await fetch(`${url}/api/users/register`, {
         method: 'POST',
         headers: {
            'Content-type': 'application/json',
         },
         body: JSON.stringify({ name: name.value, password: password.value , email: email.value , firstName: prenom.value , lastName: nom.value})
      })
 
      if (response.ok) {
         const data = await response.json();
         console.log(data , "vous ete inscrit");
         isGood.value = true
         router.push('/sign')
      } else {
         const data = await response.json()
         mdpErr.value = true;
         errorMessage.value = data.message
         alert(data.message)
      }
   } catch (err) {
      console.log(err);
   }
}
</script>

<style lang="scss">
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

