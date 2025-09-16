'use client';

import { SessionProvider as NextSessionProvider } from "next-auth/react";
import { FC, ReactNode } from "react";

const Provider: FC<{ children: ReactNode }> = ({ children }) => {
  return (
    <NextSessionProvider>
      {children}
    </NextSessionProvider>
  );
};

export default Provider;
