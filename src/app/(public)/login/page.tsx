import Link from "next/link";
import LoginForm from "@/components/Forms/LoginForm";
import { AccountLinks } from "@/components/Links/AccountLinks";

const AuthLoginPage = () => {

  return (
    <>
      <div className="form-container">
        <h1>Login</h1>
        <LoginForm />
      </div>
      <div className="center-content">
        <AccountLinks showSignUp={true} />
      </div>
    </>
  );
}

export default AuthLoginPage;