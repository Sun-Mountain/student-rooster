import { Field } from '@base-ui-components/react/field';

interface TextFieldProps {
  label: string;
  name: string;
  type?: string;
  placeholder?: string;
  required?: boolean;
  value?: string;
  onChange?: (e: React.ChangeEvent<HTMLInputElement>) => void;
}

const TextField = ({
  label,
  name,
  type = "text",
  placeholder,
  required = false,
  value,
  onChange,
}: TextFieldProps) => {
  return (
    <Field.Root>
      <Field.Label htmlFor={name}>{label}</Field.Label>
      <Field.Control
        id={name}
        name={name}
        type={type}
        placeholder={placeholder}
        required={required}
        value={value}
        onChange={onChange}
      />
    </Field.Root>
  );
};

export default TextField;