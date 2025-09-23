import Link from "next/link";

interface AccountLinksProps {
  showSignInLink?: boolean;
  showSignUpLink?: boolean;
}

export const AccountLinks = ({ showSignInLink, showSignUpLink }: AccountLinksProps) => {
  return (
    <div className="center-content">
      {showSignInLink && <p>Already have an account? <Link href="/sign-in">Sign In Here</Link></p>}
      {showSignUpLink && <p>Don't have an account? <Link href="/sign-up">Sign Up Here</Link></p>}
    </div>
  )
}