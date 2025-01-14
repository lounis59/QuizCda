import { createStore } from "vuex";

const store = createStore({
    state: {
        token: localStorage.getItem('token') || null,
        users: localStorage.getItem('user') || null,
        route: null,
        show: false,
        name: "",
        mdpErr: false
    },
    mutations: {
        setToken(state, token){
            state.token = token
            localStorage.setItem('token', token);
        },
        setUser(state, users){
          state.users= {...users};
          localStorage.setItem('user', users)
          console.log('COUCOU', state.users);
        }
        ,clearAuth(state) {
            state.token = null;
            state.users = null;
            localStorage.removeItem('token');
        },
        updateRoute(state, route){
          state.route = route
        },
        clearRoute(state ){
          state.route = null
        },
        showText(state){
          if(!state.show){

            state.show = true
          }else{
            state.show = false
          }
        },
        mdpErrUpd(state){
          if(!state.mdpErr){

            state.mdpErr = true
          }else{
            state.mdpErr = false
          }
        }
    },
    actions: {
        login({ commit }, token) {
            commit('setToken', token.token);
            const decodedToken = JSON.parse(atob(token.token.split('.')[1]));
            commit('setUser', decodedToken);
            
            
          },
          logout({ commit }) {
            commit('clearAuth');
          },
          checkAuth({ commit, state }) {
            if (state.token) {
              const decodedToken = JSON.parse(atob(state.token.split('.')[1]));
              commit('setUser', decodedToken);
            }
          },
          saveRoute({ commit }, route){
            commit('clearRoute')
            commit('updateRoute', route)
          },
          showT({commit}){
            commit('showText')
          },
          showErr({commit}){
            commit('mdpErrUpd')
          },
          test({commit}, user){
            commit('setUser',user)
          },
          initAuth({commit}){
            const token = localStorage.getItem('token')
            if (token) {
              try{
                const user = JSON.parse(atob(token.split(".")[1]))
                console.log('ici mec ',token);
                console.log('ici mec ',user);
                
                commit('setToken', token)
                commit('setUser', user)

              }catch (err) {
                console.log(err);
                commit('clearAuth')
              }
            }
          }
    },
    getters: {
      isLogged: state => !!state.token,
      isUser: state => state.users?.name
    }
})

export default store;


