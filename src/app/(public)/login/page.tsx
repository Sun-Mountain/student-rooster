import Link from "next/link";
import LoginForm from "@/components/Forms/LoginForm";

const AuthLoginPage = () => {

  return (
    <>
      <div className="form-container">
        <h1>Login</h1>
        <LoginForm />
      </div>
      <div className="center-content">
        <p>Don't have an account? <Link href="/sign-up">Sign Up</Link></p>
      </div>
    </>
  );
}

export default AuthLoginPage;