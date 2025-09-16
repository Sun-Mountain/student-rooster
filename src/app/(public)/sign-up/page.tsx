'use client';

import { useState } from "react";
import { useRouter } from "next/navigation";
import { Form } from "@base-ui-components/react/form";
import TextField from "@/components/_UI/Forms/TextField";
import Button from "@/components/_UI/Button";

const AuthSignUpPage = () => {
  const router = useRouter();
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const onSubmit = async (event: { preventDefault: () => void; currentTarget: HTMLFormElement | undefined; }) => {
    event.preventDefault();
    const formData = new FormData(event.currentTarget);
    const values = Object.fromEntries(formData.entries());

    setIsLoading(true);
    const response = await await fetch ('/api/user', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(values),
    });

    if (!response.ok) {
      const errorData = await response.json();
      setError(errorData.message || 'An error occurred. Please try again.');
      console.log('Error:', errorData);
      console.log({error})
      setIsLoading(false);
      return;
    } else {
      router.push('/login');
    }
  };

  return (
    <>
      <div className="form-container">
        <h1>Sign Up</h1>
        <Form onSubmit={onSubmit}>
          <TextField label="Username" name="username" type="text" required />
          <TextField label="Email" name="email" type="email" required />
          <TextField label="Password" name="password" type="password" required />
          <div className="btn-container">
            <Button type="submit" className="submit-button" defaultDisabled={isLoading}>
              Sign Up
            </Button>
          </div>
        </Form>
      </div>
      <div className="center-content">
        <p>Already have an account? <a href="/login">Login</a></p>
      </div>
    </>
  );
}

export default AuthSignUpPage;