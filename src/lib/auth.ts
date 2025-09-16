import { getServerSession } from "next-auth/next";
import type { Session } from "next-auth";
import { NextResponse } from "next/server";
import { ac } from "@lib/accessControl";
import { authOptions } from "@lib/authOptions";

type Action = "createAny" | "createOwn" | "readAny" | "readOwn" | "updateAny" | "updateOwn" | "deleteAny" | "deleteOwn";

export const requireAuth = async (req: Request, action: Action, resource: string) => {
  const session: Session | null = await getServerSession(authOptions);

  if (!session) {
    return NextResponse.json(
      { message: "Unauthorized" },
      { status: 401 }
    );
  }
  const userRole = session.user.role;

  const permissionCheck = (ac.can(userRole))[action](resource);

  if (!permissionCheck.granted) {
    return NextResponse.json(
      { message: "Forbidden" },
      { status: 403 }
    );
  }

  return null;
}

export const loggedIn = async (next: (session: Session) => void) => {
  const session: Session | null = await getServerSession(authOptions);

  if (!session) {
    return NextResponse.json(
      { message: "Unauthorized" },
      { status: 401 }
    );
  }
  
  return next(session);
}