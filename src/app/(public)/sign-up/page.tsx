import { Form } from "@base-ui-components/react/form";
import TextField from "@/components/_UI/Forms/TextField";
import Button from "@/components/_UI/Button";

const AuthSignUpPage = () => {
  return (
    <div className="form-container">
      <Form>
        <TextField label="Username" name="username" type="text" required />
        <TextField label="Email" name="email" type="email" required />
        <TextField label="Password" name="password" type="password" required />
        <Button type="submit" className="submit-button">Sign Up</Button>
      </Form>
    </div>
  );
}

export default AuthSignUpPage;