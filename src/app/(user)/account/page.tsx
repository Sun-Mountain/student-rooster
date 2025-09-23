import Button from "@/components/_UI/Button";

const AccountPage = () => {
  return (
    <div className="content-container">
      <h1>My Account</h1>

      <Button className="danger">
        Delete my account
      </Button>
    </div>
  );
};

export default AccountPage;