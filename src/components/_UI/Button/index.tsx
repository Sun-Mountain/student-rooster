'use client';

import {
  MouseEventHandler,
  MouseEvent,
  ReactNode,
  // useState
} from 'react';

interface ButtonProps {
  children: ReactNode;
  ariaLabel?: string;
  buttonAction?: MouseEventHandler<HTMLButtonElement> | undefined;
  className?: string;
  defaultDisabled?: boolean;
  id?: string;
  type?: "button" | "submit" | "reset";
}

const Button = ({
  children,
  ariaLabel,
  buttonAction,
  className,
  defaultDisabled = false,
  id,
  type = "button",
}: ButtonProps) => {

  // TODO:
  // set up loading state for async actions
  // connect to disabled??
  // const [ isLoading, setIsLoading ] = useState(false);

  function handleClick(e: MouseEvent<HTMLButtonElement>) {
    if (buttonAction) buttonAction(e);
  }

  return (
    <button
      aria-label={ariaLabel}
      className={className}
      disabled={defaultDisabled}
      id={id}
      onClick={handleClick}
      type={type}
    >
      {children}
    </button>
  )
}

export default Button;