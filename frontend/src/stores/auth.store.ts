import {defineStore} from 'pinia';

import { BASE_URL, fetchWrapper } from '@/helpers';
import { Login } from '@/types';
import router from "@/router";

export const useAuthStore = defineStore({
  id: 'auth',
  state: () => ({
    token: localStorage.getItem('token') || '',
    currentUser: JSON.parse(localStorage.getItem('currentUser')!),
    returnURl: null
  }),
  actions: {
    async loginUser(values: Login) {
      try {
        const response = await fetchWrapper.post(`${BASE_URL}/users/sign_in`, { user: values });
        this.currentUser = JSON.stringify(response.body.user);
        localStorage.setItem('currentUser', this.currentUser);
        this.token = response.body.token;
        localStorage.setItem('token', this.token);
        router.push(this.returnURl || '/');
        return response;
      } catch (err) {
        console.log(err);
      }
    },
    async logoutUser() {
      try {
        await fetchWrapper.delete(`${BASE_URL}/users/sign_out`, { token: this.token });
        this.currentUser = '';
        this.token = '';
        localStorage.removeItem('currentUser');
        localStorage.removeItem('token');
        router.push('/login');
      } catch (err) {
        console.log(err);
      }
    }
  }
})