'use client';

import { useSession } from "next-auth/react";

const AccountPage = () => {
  const { data: session } = useSession();
  const isAuthenticated = !!session;
  const username = session?.user?.username || 'User';
  const email = session?.user?.email || 'No email provided';
  const id = session?.user?.id || 'No ID provided';

  return (
    <div className="content-container">
      <h1>Account Page</h1>
      {isAuthenticated ? (
        <>
          <p>Welcome, {username}!</p>
          <p>Email: {email}</p>
          <p>ID: {id}</p>
        </>
      ) : (
        <p>Loading user information...</p>
      )}
    </div>
  )
}

export default AccountPage;