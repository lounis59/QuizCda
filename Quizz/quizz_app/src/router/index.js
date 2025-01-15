import { createRouter, createWebHashHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import Sign from '../views/Sign.vue'
import RegisterView from '@/views/RegisterView.vue'
import Profil from '@/views/Profil.vue'
import UpdateProfile from '@/views/UpdateProfile.vue'
import Play from '@/views/Play.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView,
    
  },
  {
    path: '/sign',
    name: 'sign',
    component: Sign,
  
  },
  {
    path: '/register',
    name: 'register',
    component: RegisterView,
  
  },
  {
    path: '/profil',
    name: 'profil',
    component: Profil,
  
  },
  {
    path: '/update',
    name: 'update',
    component: UpdateProfile,
  },
  {
    path: '/play',
    name: 'play',
    component: Play
  }
]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

export default router
