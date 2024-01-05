import {defineStore} from 'pinia';

import { BASE_URL, fetchWrapper } from '@/helpers';
import { Login } from '@/types';
import router from "@/router";

export const useAuthStore = defineStore({
  id: 'auth',
  state: () => ({
    returnURl: '',
    user: {
      token: localStorage.getItem('token') || '',
      currentUser: JSON.parse(localStorage.getItem('currentUser')!),
    }
  }),
  actions: {
    async login(values: Login) {
      try {
        const response = await fetchWrapper.post(`${BASE_URL}/auth/login`, { user: values });
        this.user.currentUser = JSON.stringify(response.body.user);
        localStorage.setItem('currentUser', this.user.currentUser);
        this.user.token = response.body.token;
        localStorage.setItem('token', this.user.token);
        router.push(this.returnURl || '/');
        return response;
      } catch (err) {
        console.log(err);
      }
    },
    async logout() {
      try {
        await fetchWrapper.delete(`${BASE_URL}/auth/logout`, { token: this.user?.token });
        this.user.currentUser = '';
        this.user.token = '';
        localStorage.removeItem('currentUser');
        localStorage.removeItem('token');
        router.push('/login');
      } catch (err) {
        console.log(err);
      }
    }
  }
})