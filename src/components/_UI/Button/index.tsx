'use client';

import {
  MouseEventHandler,
  MouseEvent,
  ReactNode,
  // useState
} from 'react';

interface ButtonProps {
  children: ReactNode;
  buttonAction?: MouseEventHandler<HTMLButtonElement> | undefined;
  className?: string;
  defaultDisabled?: boolean;
  type?: "button" | "submit" | "reset";
}

const Button = ({
  children,
  buttonAction,
  className,
  defaultDisabled = false,
  type = "button",
}: ButtonProps) => {

  // TODO:
  // set up loading state for async actions
  // connect to disabled??
  // const [ isLoading, setIsLoading ] = useState(false);

  function handleClick(e: MouseEvent<HTMLButtonElement>) {
    console.log('Button clicked', e);
    if (buttonAction) buttonAction(e);
  }

  return (
    <button
      className={className}
      disabled={defaultDisabled}
      onClick={handleClick}
      type={type}
    >
      {children}
    </button>
  )
}

export default Button;