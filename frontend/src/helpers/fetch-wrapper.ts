import { useAuthStore } from "@/stores";
import router from "@/router";

export const fetchWrapper = {
  get: request("GET"),
  post: request("POST"),
  put: request("PUT"),
  delete: request("DELETE"),
};

function request(method: string) {
  return async function (url: string, body?: any) {
    const authStore = useAuthStore();
    const requestOptions: RequestInit = {
      method,
      headers: { 
        "Content-Type": "application/json"
      }
    };

    if (body) {
      requestOptions.body = JSON.stringify(body);
    }

    if (authStore.user?.token) {
      requestOptions.headers = {
        ...requestOptions.headers,
        Authorization: `Bearer ${authStore.user.token}`,
      };
    }

    const response = await fetch(url, requestOptions);
    const data = await response.json();

    if (!response.ok) {
      if ([401, 403].includes(response.status) && authStore.user?.token) {
        // auto logout if 401 Unauthorized or 403 Forbidden response returned from api
        authStore.logout();
        router.push("/login");
      }

      const error = (data && data.message) || response.statusText;
      return Promise.reject(error);
    }

    return data;
  };
}