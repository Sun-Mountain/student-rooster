'use client';

import Link from "next/link";
import { useSession } from "next-auth/react";
import { signOut } from "next-auth/react";
import Button from "@/components/_UI/Button";

const Navigation = () => {
  const { data: session } = useSession();
  const isAuthenticated = !!session;

  const handleSignOut = () => {
    signOut({ callbackUrl: '/' });
  }

  return (
    <nav>
      <div className="nav-logo">
        <h1>Student Rooster</h1>
      </div>
      <ul className="nav-menu">
        <li>
          <Link href="/">Home</Link>
        </li>
        {isAuthenticated ? (
          <li>
            <Button buttonAction={handleSignOut}>
              Sign Out
            </Button>
          </li>
        ) : (
          <li>
            <Link href="/login">Login</Link>
          </li>
        )}
      </ul>
    </nav>
  );
}

export default Navigation;