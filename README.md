# Student Rooster

Short description of what the project does and why it exists.

## 🚀 Features
- User Login/Logout
- Manage Students, Classes, & Sessions in Organization *coming soon*

## 🛠️ Getting Started

### Prerequisites
- NodeJS
- NextJS
- SCSS
- TypeScript
- PostgreSQL
### Installation
1. Clone the repository
```bash
git clone https://github.com/Sun-Mountain/student-rooster.git
cd student-rooster
```

2. Database SetUp & Migration
This application is set up to use [PostgreSQL](https://www.postgresql.org). A popular tool for installing Postgres and managing databases is [Postgres.app](https://postgresapp.com).

To initiate the database, in the main directory:
```bash
npx prisma generate
```

To migrate the database:
```bash
npx prisma migrate dev
```

3. Install dependencies
```bash
pnpm install (or equivalent)
```
### Usage
```bash
pnpm dev (or equivalent)
```
Then visit [http://localhost:3000](http://localhost:3000) (or relevant URL).
## 📁 Project Structure
```bash
student-rooster/
├── .github/            # GitHub resources
├── .vscode/            # VSCode Workspace settings
├── bruno/              # Bruno collections
├── primsa/             # Database
├── public/             # Static Assets
├── src/                # Main source code
└── README.md           # Project documentation
``
## 🧪 Scripts
- `pnpm dev` – Start development server
- `pnpm build` – Build for production
- `pnpm test` – Run tests *coming soon*
## 🤝 Contributing
*coming soon*
## 📄 License
*coming soon*