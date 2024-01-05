import {defineStore} from 'pinia';

import { API_URL, fetchWrapper } from '@/helpers';
import { type Login } from '@/types';
import router from "@/router";

export const useAuthStore = defineStore({
  id: 'auth',
  state: () => ({
    returnURl: '',
    currentUser: {
      token: localStorage.getItem('token') || '',
      email: '',
      username: '',
    },
    isAuthenticated: false,
  }),
  actions: {
    async login(user: Login) {
      try {
        const response = await fetchWrapper.post(`${API_URL}/auth/login`, { user });
        this.currentUser = response.body.user;
        this.currentUser.token = response.body.user.jti;
        this.isAuthenticated = true;
        localStorage.setItem('token', response.token);
        router.push(this.returnURl || '/');
        return response;
      } catch (err) {
        console.log(err);
      }
    },
    async logout() {
      try {
        await fetchWrapper.delete(`${API_URL}/auth/logout`, { user: this.currentUser });
        this.currentUser = {
          token: '',
          email: '',
          username: '',
        };
        this.isAuthenticated = false;
        localStorage.removeItem('token');
        router.push('/');
      } catch (err) {
        console.log(err);
      }
    },
    async getCurrentUser() {
      try {
        const response = await fetchWrapper.get(`${API_URL}/auth/me`);
        this.currentUser = response;
        this.isAuthenticated = true;
        return response;
      } catch (err) {
        console.log(err);
      }
    }
  }
})