import Link from "next/link";
import Button from "@/components/_UI/Button";

interface MainNavProps {
  isAuthenticated: boolean;
  handleSignOut: () => void;
}

export const MainNav = ({ isAuthenticated, handleSignOut }: MainNavProps) => {
  return (
    <ul className="nav-menu">
      <li>
        <Link href="/">Home</Link>
      </li>
      {isAuthenticated ? (
        <li>
          <Button
            buttonAction={handleSignOut}
            className="icon"
            id="sign-out-btn"
            ariaLabel="Sign out of the application"
          >
            Sign Out
          </Button>
        </li>
      ) : (
        <li>
          <Link href="/sign-in">Sign In</Link>
        </li>
      )}
    </ul>
  );
}