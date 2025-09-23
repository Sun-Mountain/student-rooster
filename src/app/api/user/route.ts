import { NextResponse } from "next/server";
import { getServerSession } from "next-auth/next";
import { authOptions } from "@lib/authOptions";
import { createUser, deleteUserById, getUserByIdentifier } from "@db/lib/user";

import { hash } from "bcrypt";
import { requireAuth } from "@/lib/auth";

export async function POST(req: Request) {
  try {
    const body = await req.json();
    const { email, username, password } = body;

    // Check if email or username already exists
    const existingUser = await getUserByIdentifier(undefined, email, username);

    if (existingUser) {
      return NextResponse.json(
        { message: "Email or username already exists" },
        { status: 400 }
      );
    }

    // Create new user
    const hashedPassword = await hash(password, 15);

    const newUser = await createUser({
      email,
      username,
      password: hashedPassword,
    });

    const { password: _, ...userWithoutPassword } = newUser;

    return NextResponse.json(
      { message: "User created successfully", user: userWithoutPassword },
      { status: 201 }
    );
  }
  catch (err) {
    console.log(err);
    return NextResponse.json(
      { message: "Internal server error" },
      { status: 500 }
    );
  }
};

export async function DELETE(req: Request) {
  return requireAuth("deleteOwn", "user") || (async () => {
    try {
      const session = await getServerSession(authOptions);
      const userId = session?.user?.id;
      if (!userId) {
        return NextResponse.json(
          { message: "User ID not found in session" },
          { status: 400 }
        );
      }

      await deleteUserById(userId);

      return NextResponse.json(
        { message: "User deleted successfully" },
        { status: 200 }
      );
    }
    catch (err) {
      console.log(err);
      return NextResponse.json(
        { message: "Internal server error" },
        { status: 500 }
      );
    }
  })();
}

// export async function DELETE(req: Request) {
//   return withAuth({
//     resource: "user",
//     action: "deleteOwn",
//     authErrorMessage: "You do not have permission to delete this account"
//   })(async (permission: Permission, session) => {
//     try {
//       const userId = session?.user?.id;
//       if (!userId) {
//         return NextResponse.json(
//           { message: "User ID not found in session" },
//           { status: 400 }
//         );
//       }

//       await deleteUserById(userId);

//       return NextResponse.json(
//         { message: "User deleted successfully" },
//         { status: 200 }
//       );
//     }
//     catch (err) {
//       console.log(err);
//       return NextResponse.json(
//         { message: "Internal server error" },
//         { status: 500 }
//       );
//     }
//   });
// }