import { defineStore } from 'pinia';

import { API_URL, fetchWrapper } from '@/helpers';
import { type Register } from '@/types';
import { useAuthStore } from '@/stores';

import router from "@/router";

export const useUserStore = defineStore({
  id: 'user',
  actions: {
    async register(user: Register) {
      try {
        const response = await fetchWrapper.post(`${API_URL}/auth/signup`, { user });
        router.push('/')
        return response;
      } catch (err) {
        console.log(err);
      }
    },
    async delete(id: number) {
      try {
        const authStore = useAuthStore();
        await fetchWrapper.delete(`${API_URL}/users/${id}`, { token: authStore.user?.token });
        router.push('/')
      } catch (err) {
        console.log(err);
      }
    }
  }
})