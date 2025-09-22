
import SignUpForm from "@/components/Forms/SignUpForm";
import { AccountLinks } from "@/components/Links/AccountLinks";

const AuthSignUpPage = () => {
  return (
    <>
      <div className="form-container">
        <h1>Sign Up</h1>
        <SignUpForm />
      </div>
      <div className="center-content">
        <AccountLinks showLogin={true} />
      </div>
    </>
  );
}

export default AuthSignUpPage;