import Link from "next/link";

interface AccountLinksProps {
  showLogin?: boolean;
  showSignUp?: boolean;
}

export const AccountLinks = ({
  showLogin,
  showSignUp
}: AccountLinksProps) => {
  return (
    <>
      {showSignUp && (
        <p>
          Don't have an account? <Link href="/signup">Sign Up Here</Link>
        </p>
      )}
      {showLogin && (
        <p>
          Already have an account? <Link href="/login">Login Here</Link>
        </p>
      )}
    </>
  )
};