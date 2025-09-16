import { getServerSession } from "next-auth";
import { NextResponse } from "next/server";
import { authOptions } from "@lib/authOptions";

export const GET = async (req: Request) => {
  const session = await getServerSession(authOptions);

  if (!session) {
    return NextResponse.json(
      { message: "Unauthorized" },
      { status: 401 }
    );
  }

  return NextResponse.json(
    { message: "Success", session },
    { status: 200 }
  );
};