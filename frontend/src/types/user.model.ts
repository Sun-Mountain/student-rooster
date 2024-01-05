export interface Login {
  email: string;
  password: string;
}

export interface Register {
  email: string;
  username: string;
  password: string;
}

export interface User {
  id: number;
  email: string;
  username: string;
  token: string;
  created_at: string;
}
