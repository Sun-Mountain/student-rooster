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
          Don't have an account? <Link href="/sign-up">Sign Up Here</Link>
        </p>
      )}
      {showLogin && (
        <p>
          Already have an account? <Link href="/login">Login Here</Link>
        </p>
      )}
      <p>
        <Link href="/forgot-password">Forgot your password?</Link>
      </p>
      <p>
        <Link href="/verify-email">Didn't receive a verification email?</Link>
      </p>
    </>
  )
};