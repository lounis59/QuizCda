<template>
  
    
    <div class="home">
      <div class="Btn" @click="goLog" v-if="!store.getters.isLogged">
        Connexion
      </div>
      <div class="Btn" @click="goSign" v-if="!store.getters.isLogged">
        Inscription
      </div>
      <div class="message" v-if="store.getters.isLogged"> bonjour {{ user }}</div>
      <div class="Btn" v-if="store.getters.isLogged" @click="goProfil">Profil</div>
      <div class="Btn" @click="goLogOut" v-if="store.getters.isLogged" >
        Deconnexion
      </div>
      <div class="Btn" v-if="store.getters.isLogged" @click="goPlay">
        Jouer
      </div>
    </div>

  

</template>

<script setup>
import { ref , computed, onMounted} from 'vue';
import { useRouter } from 'vue-router';
import { useStore } from 'vuex';


const route = useRouter();
const store = useStore();
const user = store.getters.isUser
console.log(user, "ici");

const goLog = () => {
  route.push('/sign')
}
const goSign = () => {
  route.push('/register')
}

const goLogOut = () => {
  store.dispatch('logout')
}
const goPlay = () => {
  route.push('/play')
}
const goProfil = () => {
  route.push('/profil')
}

onMounted(() => {
  
})
</script>

<style lang="scss" >
.home{
  width: 80vw;
  height: max-content;
  // min-height: 30vh;
  border: 2px solid var(--main-color-div);
  margin-top: 100px;
  border-radius: 10px;
  box-shadow: 10px 10px 20px black,-10px 10px 20px black;
  display: flex;
  flex-direction:column;
  justify-content: space-around;
  align-items: center;
  .Btn{
    width: 150px;
    height: 50px;
    color: var(--main-color-div);
    border: 2px solid var(--main-color-div);
    text-align: center;
    padding-top: 22.5px;
    border-radius: 10px;
    font-size: 1.5rem;
    margin-top: 30px;
  }
  .Btn:hover {
    cursor: pointer;
  }
  
}
</style>
