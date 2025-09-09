import { Form } from "@base-ui-components/react/form";
import TextField from "@/components/_UI/Forms/TextField";
import Button from "@/components/_UI/Button";

const AuthSignUpPage = () => {
  return (
    <div className="form-container">
      <h1>Sign Up</h1>
      <Form>
        <TextField label="Username" name="username" type="text" required />
        <TextField label="Email" name="email" type="email" required />
        <TextField label="Password" name="password" type="password" required />
        <div className="btn-container">
          <Button type="submit" className="submit-button">
            Sign Up
          </Button>
        </div>
      </Form>
    </div>
  );
}

export default AuthSignUpPage;