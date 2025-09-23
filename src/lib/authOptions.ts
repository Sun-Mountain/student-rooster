import { NextAuthOptions, User as NextAuthUser } from "next-auth";
import CredentialsProvider from "next-auth/providers/credentials";
import { PrismaAdapter } from "@next-auth/prisma-adapter";
import { compare } from "bcrypt";
import { db } from "@db/lib";

// Extend the User type to include 'role'
declare module "next-auth" {
  interface User {
    role: string;
    username: string;
  }
  interface Session {
    user: {
      id: string;
      email: string;
      username: string;
      role: string;
    }
  }
}

declare module "next-auth/jwt" {
  interface JWT {
    id: string;
    username: string;
    role: string;
  }
}

export const authOptions: NextAuthOptions = {
  adapter: PrismaAdapter(db),
  session: {
    strategy: "jwt",
  },
  pages: {
    signIn: '/sign-in',
    signOut: '/sign-out',
    // error: '/login', // Error code passed in query string as ?error=
    // newUser: '/sign-up' // New users will be directed here on first sign in (leave the property out if not of interest)
  },
  providers: [
    CredentialsProvider({
      name: "Credentials",
      credentials: {
        email: { label: "Email", type: "email" },
        password: { label: "Password", type: "password" },
      },
      async authorize(credentials) {
        if (!credentials?.email || !credentials?.password) {
          throw new Error("Email and password are required");
        }

        const existingUser = await db.user.findFirst({
          where: { email: credentials.email },
        });

        if (!existingUser || !existingUser.password) {
          throw new Error("No user found with the given email or password");
        }

        const { id, email, username, role} = existingUser;

        return { id, email, username, role };
      },
    }),
  ],
  callbacks: {
    async jwt({ token, user }) {
      if (user) {
        token.username = user.name ?? user.username ?? "";
        token.id = user.id;
        token.role = user.role ?? "USER";
      }
      return token;
    },
    async session({ session, token }) {
      if (token && session.user) {
        session.user.id = token.id as string;
      }
      return {
        ...session,
        user: {
          ...session.user,
          username: token.username as string,
          id: token.id as string,
          role: token.role as string,
        },
      };
    },
  },
};