'use client';

import { useState } from "react";
import { signOut, useSession } from "next-auth/react";
import { MainNav } from "@/components/_Content/Navigation/MainNav";
import Button from "@/components/_UI/Button";
import { Drawer } from "@/components/_UI/Drawer";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faBars } from "@fortawesome/free-solid-svg-icons";

import { useWindowSize } from "@/helpers/useWindowSize";

const Navigation = () => {
  const [isNavOpen, setIsNavOpen] = useState(false);

  const { data: session } = useSession();
  const windowSize = useWindowSize();
  const isAuthenticated = !!session;

  const handleSignOut = () => {
    signOut({ callbackUrl: '/' });
  }

  const toggleNav = () => {
    setIsNavOpen(!isNavOpen);
  }

  return (
    <nav>
      <div className="nav-logo">
        <h1>Student Rooster</h1>
      </div>
      {windowSize.width && windowSize.width < 992 ? (
        <>
          <Button buttonAction={toggleNav}>
            <FontAwesomeIcon icon={faBars} />
          </Button>
          <Drawer drawerOpen={isNavOpen} toggleDrawer={toggleNav}>
            <MainNav isAuthenticated={isAuthenticated} handleSignOut={handleSignOut} />
          </Drawer>
        </>
      ) : (
        <div className="nav-links">
          <MainNav isAuthenticated={isAuthenticated} handleSignOut={handleSignOut} />
        </div>
      )}
    </nav>
  );
}

export default Navigation;