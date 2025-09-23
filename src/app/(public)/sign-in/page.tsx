import SignInForm from "@/components/Forms/SignInForm";
import { AccountLinks } from "@/content/Navigation/AccountLinks";

const AuthLoginPage = () => {

  return (
    <>
      <div className="form-container">
        <h1>Sign In</h1>
        <SignInForm />
      </div>
      <AccountLinks showSignUpLink />
    </>
  );
}

export default AuthLoginPage;