import type { Metadata } from "next";
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
        <Navigation />
        <main>
          {children}
        </main>
        <Footer />
      </body>
    </html>
  );
}
