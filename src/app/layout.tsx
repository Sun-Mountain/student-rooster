import type { Metadata } from "next";
import Provider from "@/components/Providers/SessionProvider";
import "@styles/global.scss";
import Navigation from "@/components/Navigation";
import Footer from "@/components/Footer";


export const metadata: Metadata = {
  title: "Student Rooster",
  description: "A student tracker web app",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body>
        <Provider>
          <Navigation />
          <main>
            {children}
          </main>
          <Footer />
        </Provider>
      </body>
    </html>
  );
}
