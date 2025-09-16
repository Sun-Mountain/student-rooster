'use client';

import { FC } from "react";
import { useRouter } from "next/navigation";
import { signIn } from "next-auth/react";

import { Form } from "@base-ui-components/react/form";
import TextField from "@/components/_UI/Forms/TextField";
import Button from "@/components/_UI/Button";

const LoginForm: FC = () => {
  const router = useRouter();

  const onSubmit = async (event: { preventDefault: () => void; currentTarget: HTMLFormElement | undefined; }) => {
    event.preventDefault();
    const formData = new FormData(event.currentTarget);
    const values = Object.fromEntries(formData.entries());

    const result = await signIn("credentials", {
      email: values.email as string,
      password: values.password as string,
      callbackUrl: `${window.location.origin}/dashboard`
    });

    if (result?.error) {
      console.log("Failed to login:", result.error);
      // Optionally, set error state here to display error message to user
    } else {
      router.push(result?.url || '/dashboard');
    }
  }

  return (
    <Form onSubmit={onSubmit}>
      <TextField label="Email" name="email" type="email" required />
      <TextField label="Password" name="password" type="password" required />
      <div className="btn-container">
        <Button type="submit" className="submit-button">
          Login
        </Button>
      </div>
    </Form>
  );
}

export default LoginForm;