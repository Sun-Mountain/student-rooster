import db from '@db/lib';
import { Profile, Prisma } from '@prisma/client';
import type { User } from '@prisma/client';

export type ProfileCreateInput = Prisma.ProfileCreateInput;

export type ProfileUpdateInput = Prisma.ProfileUpdateInput;

export async function getProfileById(id: string, user: User): Promise<Profile | null> {
  const profile = await db.profile.findFirst({
    where: {
      OR: [
        { userId: user.id },
        { id },
      ]
    },
  });
  return profile;
}

export async function createProfile(data: ProfileCreateInput): Promise<Profile> {
  const profile = await db.profile.create({ data });
  return profile;
}

export async function updateProfile(id: string, data: ProfileUpdateInput, user: User): Promise<Profile | null> {
  const profile = await db.profile.updateMany({
    where: {
      id,
      userId: user.id,
    },
    data,
  });
  if (profile.count === 0) return null;
  return db.profile.findUnique({ where: { id } }) as Promise<Profile>;
}