import { Form } from "@base-ui-components/react/form";
import TextField from "@/components/_UI/Forms/TextField";
import Button from "@/components/_UI/Button";

const LoginPage = () => {
  return (
    <>
      <div className="form-container">
        <h1>Login</h1>
        <Form>
          <TextField label="Email" name="email" type="email" required />
          <TextField label="Password" name="password" type="password" required />
          <div className="btn-container">
            <Button type="submit" className="submit-button">
              Login
            </Button>
          </div>
        </Form>
      </div>
      <div className="center-content">
        <p>Don't have an account? <a href="/sign-up">Sign Up</a></p>
      </div>
    </>
  );
}

export default LoginPage;