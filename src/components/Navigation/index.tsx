import Link from "next/link";

const Navigation = () => {
  return (
    <nav>
      <div className="nav-logo">
        <h1>Student Rooster</h1>
      </div>
      <ul className="nav-menu">
        <li>
          <Link href="/">Home</Link>
        </li>
        <li>
          <Link href="/login">Login</Link>
        </li>
      </ul>
    </nav>
  );
}

export default Navigation;