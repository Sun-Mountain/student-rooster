import { defineStore } from 'pinia';

import { BASE_URL, fetchWrapper } from '@/helpers';
import { User } from '@/types';
import { useAuthStore } from '@/stores';

import router from "@/router";

export const useUserStore = defineStore({
  id: 'user',
  actions: {
    async register(user: User) {
      try {
        const response = await fetchWrapper.post(`${BASE_URL}/auth/signup`, { user });
        router.push('/')
        return response;
      } catch (err) {
        console.log(err);
      }
    },
    async delete(id: number) {
      try {
        const authStore = useAuthStore();
        await fetchWrapper.delete(`${BASE_URL}/users/${id}`, { token: authStore.user?.token });
        router.push('/')
      } catch (err) {
        console.log(err);
      }
    }
  }
})