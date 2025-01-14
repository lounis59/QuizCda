<template>
<div class="home">
   <p>Username :</p>
   <p class="data">{{ store.state.users.name }}</p>
   <p>Email :</p>
   <p class="data">{{ store.state.users.email }}</p>
   <p>Prenom :</p>
   <p class="data">{{ store.state.users.firstName }}</p>
   <p>Nom :</p>
   <p class="data">{{ store.state.users.lastName }}</p>
   <p>Compte creer :</p>
   <p class="data">{{ store.state.users.createdAt}}</p>
   <div class="Btn" @click="goUpdate"> Modifier</div>
</div>
</template>


<script setup>
import { useRouter } from 'vue-router';
import { useStore } from 'vuex';


const store = useStore();
const route = useRouter();

const goUpdate = () => {
    route.push('/update')
}
console.log(store.state.users.firstName);
</script>

<style lang="scss" scoped>
.home{
    padding: 20px;
}
p{
    color: var(--main-color-div);
}
.data{
    border: 1px solid var(--main-color-div);
    margin: 20px;
    padding: 10px;
    width: max-content;
    height: max-content;
    border-radius: 20px;
}
</style>