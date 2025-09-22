import { db } from "@db/lib";
import {
  createProfile,
  getProfileById,
  updateProfile
} from "@db/lib/profiles";
import { Profile, User, Prisma } from "@prisma/client";
import type { Permission } from "accesscontrol";
import { NextResponse, NextRequest } from "next/server";