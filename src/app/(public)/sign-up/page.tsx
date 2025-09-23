import Link from "next/link";
import SignUpForm from "@/components/Forms/SignUpForm";
import { AccountLinks } from "@/content/Navigation/AccountLinks";

const AuthSignUpPage = () => {
  return (
    <>
      <div className="form-container">
        <h1>Sign Up</h1>
        <SignUpForm />
      </div>
      <AccountLinks showSignInLink />
    </>
  );
}

export default AuthSignUpPage;