import { db } from "@db/lib";
import { User, Prisma } from "@prisma/client";

export async function getUserByIdentifier(userId?: string, email?: string, username?: string): Promise<User | null> {
  return db.user.findFirst({
    where: {
      OR: [
        { id: userId },
        { email },
        { username }
      ]
    }
  });
}

export async function createUser(data: Prisma.UserCreateInput): Promise<User> {
  return db.user.create({
    data
  });
}

export async function getUserById(userId: string): Promise<User | null> {
  return db.user.findUnique({
    where: { id: userId },
  });
}

export async function getUserByEmail(email: string): Promise<User | null> {
  return db.user.findUnique({
    where: { email },
  });
}

export async function getUserByUsername(username: string): Promise<User | null> {
  return db.user.findUnique({
    where: { username },
  });
}

export async function deleteUserById(userId: string): Promise<User> {
  return db.user.delete({
    where: { id: userId },
  });
}