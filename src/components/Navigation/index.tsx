'use client';

import Link from "next/link";
import { useSession } from "next-auth/react";

const Navigation = () => {
  const { data: session } = useSession();
  const isAuthenticated = !!session;

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
          <>
            Logged in!
          </>
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