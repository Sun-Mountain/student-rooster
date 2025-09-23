import Link from "next/link";
import SignInForm from "@/components/Forms/SignInForm";

const AuthLoginPage = () => {

  return (
    <>
      <div className="form-container">
        <h1>Sign In</h1>
        <SignInForm />
      </div>
      <div className="center-content">
        <p>Don't have an account? <Link href="/sign-up">Sign Up</Link></p>
      </div>
    </>
  );
}

export default AuthLoginPage;