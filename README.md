# MyStudio – Master Template & Local Setup Documentation

**Last Updated:** 2025-12-12 03:56 CET  
**Project Owner:** tomiwhite  
**Status:** ✅ PHASE 7 COMPLETE

---

## 📋 TABLE OF CONTENTS

1. [System Configuration](#system-configuration)
2. [Disk Layout & Paths](#disk-layout--paths)
3. [Git Configuration](#git-configuration)
4. [MyStudio Template Structure](#mystudio-template-structure)
5. [Completed Phases (6-7)](#completed-phases-6-7)
6. [Workflow & Conventions](#workflow--conventions)
7. [Quick Start for New Projects](#quick-start-for-new-projects)

---

## 🖥️ SYSTEM CONFIGURATION

### User Identity
- **Username:** `tomiwhite`
- **Machine:** HP ZBook (Windows)
- **Shell:** PowerShell 7.x
- **Primary IDE:** VS Code
- **Git Default Name:** tomiwhite (global)
- **Git Default Email:** None (configured per-directory)

### Node.js & npm
- **npm Registry:** Default (npmjs.com)
- **Cache Location:** `D:\_CACHE\npm\`
- **Global Packages Location:** `C:\Users\tomiwhite\AppData\Roaming\npm`

---

## 💾 DISK LAYOUT & PATHS

### Physical Volumes

| Drive | Label | Total Size | Free Space | Purpose |
|-------|-------|-----------|-----------|---------|
| **C:** | (System) | 511 GB | 346 GB | Windows OS + System |
| **D:** | Dysk dane | 1024 GB | 523 GB | Data storage |
| **E:** | Segate1 | 1000 GB | 211 GB | Backup/Archive |
| **F:** | VEEAMRE | 34 GB | 33 GB | Backup recovery |
| **P:** | myDevDrive | 240 GB | 236 GB | **DEVELOPMENT** ⭐ |

### Development Structure (P:\)

```
P:\
├── Projekty\                    # Main projects directory
│   ├── MyStudio\                # ⭐ Master template (GitHub: mystudio-template)
│   ├── work\                    # Work-related projects (Git: office@myzabka.pl)
│   ├── personal\                # Personal projects (Git: tomiwhite@outlook.com)
│   ├── Test01\                  # Testing/POC
│   └── TestUV\                  # Testing/POC
│
└── [Future structure as needed]
```

### Key Paths

| Path | Purpose | Git Email |
|------|---------|-----------|
| `P:\Projekty\MyStudio` | Master template (Next.js + npm setup) | tomiwhite@outlook.com |
| `P:\Projekty\work` | Work projects | office@myzabka.pl |
| `P:\Projekty\personal` | Personal projects | tomiwhite@outlook.com |
| `C:\Users\tomiwhite\.gitconfig` | Global Git config | Config file |
| `C:\Users\tomiwhite\.gitconfig-work` | Conditional work config | office@myzabka.pl |
| `C:\Users\tomiwhite\.gitconfig-personal` | Conditional personal config | tomiwhite@outlook.com |

---

## 🔧 GIT CONFIGURATION

### Global Configuration (C:\Users\tomiwhite\.gitconfig)

```ini
[user]
	name = tomiwhite
	email = tomiwhite@outlook.com
[core]
	autocrlf = false

[includeIf "gitdir:P:/Projekty/work/"]
	path = C:/Users/tomiw/.gitconfig-work

[includeIf "gitdir:P:/Projekty/personal/"]
	path = C:/Users/tomiw/.gitconfig-personal
```

### Conditional Config – Work (C:\Users\tomiwhite\.gitconfig-work)

```ini
[user]
	name = tomiwhite
	email = office@myzabka.pl
```

**Applies to:** `P:\Projekty\work\*`

### Conditional Config – Personal (C:\Users\tomiwhite\.gitconfig-personal)

```ini
[user]
	name = tomiwhite
	email = tomiwhite@outlook.com
```

**Applies to:** `P:\Projekty\personal\*`

### How It Works

When you `cd` into a repository:
- **In `P:\Projekty\work`** → Git uses `office@myzabka.pl` automatically
- **In `P:\Projekty\personal`** → Git uses `tomiwhite@outlook.com` automatically
- **Elsewhere** → Git uses global `tomiwhite@outlook.com`

### Verify Configuration

```powershell
# Test work directory
cd P:\Projekty\work
git config user.email
# Output: office@myzabka.pl

# Test personal directory
cd P:\Projekty\personal
git config user.email
# Output: tomiwhite@outlook.com
```

---

## 📦 MYSTUDIO TEMPLATE STRUCTURE

### Repository Info

- **GitHub:** https://github.com/tomiwhite/mystudio-template
- **Branch:** main
- **Local Path:** `P:\Projekty\MyStudio`
- **Status:** Ready for duplication

### Directory Structure

```
MyStudio/
├── .github/
│   └── copilot-instructions.md    # Coding standards + AI guidelines
├── .husky/                        # Pre-commit hooks (future)
├── src/
│   ├── app/                       # Next.js routes & layouts (future)
│   ├── components/                # React components (PascalCase)
│   ├── lib/                       # Utilities, helpers, API calls
│   ├── types/                     # TypeScript definitions
│   └── styles/                    # Global styles, Tailwind config
├── public/                        # Static assets
├── docs/                          # Project documentation
├── .env.example                   # Template for environment variables
├── .env.local                     # Local config (IN .gitignore)
├── .eslintrc.json                 # ESLint configuration
├── .gitignore                     # Git ignore rules
├── package.json                   # Dependencies + npm scripts
├── package-lock.json              # Locked dependency versions
├── postcss.config.js              # PostCSS + Tailwind config
├── tailwind.config.js             # Tailwind CSS configuration
├── tsconfig.json                  # TypeScript configuration
└── README.md                      # Project documentation
```

### Key Files

#### .github/copilot-instructions.md
Coding standards and AI assistant guidelines:
- **PascalCase** for React components, interfaces, classes
- **camelCase** for variables, functions, properties
- **No `any`** – use `unknown` or generics
- **Server Actions** over API routes (Next.js 13+)
- **TypeScript strict mode** required
- Forbidden: `localStorage`, `sessionStorage`, browser storage APIs

#### .env.example
```ini
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=
NEXT_PUBLIC_API_URL=http://localhost:3000
NODE_ENV=development
```

**Rules:**
- `.env.local` is in `.gitignore` – NEVER commit secrets
- `.env.example` is committed – no real values
- Copy `.env.example` → `.env.local` and fill with real values

#### .gitignore
Protected patterns:
- `node_modules/`, `.pnp`, `.pnp.js`
- `.env.local`, `.env.*.local` ⭐ **Secrets protected**
- `.next/`, `dist/`, `build/`
- `.vscode/`, `.idea/`, `*.swp`, `*.swo`
- `.DS_Store`, `Thumbs.db`
- `*.log`, `npm-debug.log*`, `yarn-debug.log*`

#### package.json – npm Scripts

| Script | Command | Purpose |
|--------|---------|---------|
| `npm run dev` | next dev | Start dev server (localhost:3000) |
| `npm run build` | next build | Production build |
| `npm run start` | next start | Start production server |
| `npm run lint` | eslint . --ext .ts,.tsx | Check code style |
| `npm run type-check` | tsc --noEmit | TypeScript validation (no emit) |

#### tsconfig.json – TypeScript Setup
- **Target:** ES2020
- **Strict Mode:** ON (no `any`, no implicit any)
- **JSX:** react-jsx
- **Module Resolution:** bundler
- **Path Alias:** `@/*` → `./src/*`

#### .eslintrc.json – Linting
- Extends: `next/core-web-vitals`
- Rules: React JSX scope off (Next.js 13+)

#### tailwind.config.js + postcss.config.js
- **Content Paths:** `./src/**/*.{js,ts,jsx,tsx}`
- **PostCSS Plugins:** tailwindcss, autoprefixer
- **Autoprefixer:** For cross-browser CSS support

---

## ✅ COMPLETED PHASES (6-7)

### PHASE 6: Git & Project Constitution

#### Task 1: Conditional Git Configuration ✅
- **What:** Configure Git to use different emails for work vs. personal projects
- **Implementation:** `.gitconfig` with `[includeIf "gitdir:..."]` directives
- **Status:** Tested and working
  ```powershell
  cd P:\Projekty\work → email: office@myzabka.pl ✅
  cd P:\Projekty\personal → email: tomiwhite@outlook.com ✅
  ```

#### Task 2: Project Constitution (.github/copilot-instructions.md) ✅
- **What:** Central coding standards document for AI and human developers
- **Contents:**
  - Naming conventions (PascalCase/camelCase)
  - Stack specifications (Next.js 14+, React 18+, TypeScript 5+, Tailwind)
  - Project structure guidelines
  - Commit message rules (feat:, fix:, refactor:, docs:, test:)
  - Environment variable rules
  - Forbidden patterns (e.g., `any`, browser storage)
- **Status:** Created and committed

#### Task 3: API Key Security (.env.local in .gitignore) ✅
- **What:** Ensure `.env.local` with secrets is never committed
- **Implementation:** Added to `.gitignore`
- **Verification:** `cat .gitignore | Select-String ".env.local"` → Found ✅
- **Status:** Protected

---

### PHASE 7: npm Setup + Dependencies

#### Task 1: Initialize npm Project ✅
```powershell
npm init -y
```
**Created:** `package.json` (v1.0.0)

#### Task 2: Install Production Dependencies ✅
```powershell
npm install next react react-dom typescript
```

**Installed:**
- `next@^16.0.10` – Full-stack React framework
- `react@^19.2.3` – UI library
- `react-dom@^19.2.3` – DOM rendering
- `typescript@^5.9.3` – Type checking

#### Task 3: Install Development Dependencies ✅
```powershell
npm install --save-dev @types/node @types/react tailwindcss postcss autoprefixer eslint eslint-config-next
```

**Installed:**
- `@types/node@^25.0.1` – Node.js type definitions
- `@types/react@^19.2.7` – React type definitions
- `tailwindcss@^4.1.18` – Utility-first CSS framework
- `postcss@^8.5.6` – CSS transformation tool
- `autoprefixer@^10.4.22` – Vendor prefix automation
- `eslint@^9.39.1` – Code linting
- `eslint-config-next@^16.0.10` – Next.js ESLint config

**Total:** 345 packages audited, 0 vulnerabilities

#### Task 4: Create npm Scripts ✅
```json
{
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "eslint . --ext .ts,.tsx",
    "type-check": "tsc --noEmit"
  }
}
```

#### Task 5: Create Configuration Files ✅

**tsconfig.json:**
- ES2020 target, strict mode ON
- JSX: react-jsx, Path aliases: @/*
- No implicit any, no unused variables

**tailwind.config.js:**
- Content paths: `./src/**/*.{js,ts,jsx,tsx}`
- Theme extensions enabled

**postcss.config.js:**
- Plugins: tailwindcss, autoprefixer

**.eslintrc.json:**
- Extends next/core-web-vitals
- React JSX scope disabled (Next.js 13+)

#### Task 6: Create .env Files ✅

**.env.example:**
- Template with required environment variables
- Committed to Git (no secrets)

**.env.local:**
- Created (developer fills with real values)
- Protected in .gitignore

#### Task 7: Git Commits ✅

**Commit 1:**
```
1df652b init: MyStudio master template
```
- Created folder structure
- Added .github/copilot-instructions.md
- Added .gitignore
- Added .env.example

**Commit 2:**
```
0b7a119 feat: npm setup + Next.js + TypeScript + Tailwind config
```
- Added package.json + dependencies
- Added tsconfig.json
- Added .eslintrc.json
- Added tailwind.config.js
- Added postcss.config.js

#### Task 8: GitHub Push ✅
```
Repository: https://github.com/tomiwhite/mystudio-template
Branch: main
Objects Pushed: 14
Status: ✅ Live on GitHub
```

---

## 📝 WORKFLOW & CONVENTIONS

### Commit Message Format

```
<type>: <subject>

<body>

<footer>
```

**Types:**
- `feat:` – New feature
- `fix:` – Bug fix
- `refactor:` – Code refactoring (no feature change)
- `docs:` – Documentation only
- `test:` – Tests only
- `chore:` – Build, deps, tooling

**Examples:**
```
feat: add user authentication with OAuth
fix: resolve hydration mismatch in Banner component
refactor: extract Button styles to separate module
docs: update setup instructions in README
```

### Code Naming Conventions

| Type | Convention | Example |
|------|-----------|---------|
| React Components | PascalCase | `UserCard.tsx`, `ButtonGroup.tsx` |
| Functions/Variables | camelCase | `getUserData()`, `isActive` |
| Constants | SCREAMING_SNAKE_CASE | `MAX_RETRIES`, `API_TIMEOUT` |
| Files (Components) | PascalCase | `UserProfile.tsx` |
| Files (Utils) | camelCase | `api-client.ts`, `format-date.ts` |
| Interfaces/Types | PascalCase + suffix | `UserProps`, `ApiResponse` |
| CSS Classes | kebab-case | `user-card`, `button-primary` |

### Development Workflow

1. **Create feature branch:**
   ```powershell
   git checkout -b feat/my-feature
   ```

2. **Make changes:**
   - Follow naming conventions
   - Use TypeScript (`any` forbidden)
   - Run linter before committing
   - Update `.env.example` if adding new env vars

3. **Lint & type-check:**
   ```powershell
   npm run lint
   npm run type-check
   ```

4. **Commit with proper messages:**
   ```powershell
   git add .
   git commit -m "feat: add new feature"
   ```

5. **Push:**
   ```powershell
   git push origin feat/my-feature
   ```

6. **Create Pull Request on GitHub**

### Secrets Management

**NEVER commit:**
- API keys, tokens, passwords
- Private SSH keys
- Database credentials
- JWT secrets

**ALWAYS use:**
- `.env.local` (in .gitignore)
- Copy from `.env.example` template
- Use environment variable references in code: `process.env.NEXT_PUBLIC_API_KEY`

---

## 🚀 QUICK START FOR NEW PROJECTS

### Method 1: Clone Template (Recommended)

```powershell
# Navigate to projects directory
cd P:\Projekty

# Clone template as new project
git clone https://github.com/tomiwhite/mystudio-template.git my-new-project

# Navigate to new project
cd my-new-project

# Change remote URL
git remote set-url origin https://github.com/tomiwhite/my-new-project.git

# Update package.json (if needed)
$json = Get-Content package.json -Raw | ConvertFrom-Json
$json.name = "my-new-project"
$json | ConvertTo-Json -Depth 10 | Set-Content package.json

# Install dependencies
npm install

# Create GitHub repo and push
git add .
git commit -m "init: my-new-project from mystudio-template"
git branch -M main
git push -u origin main
```

### Method 2: Manual Duplication

1. Copy `P:\Projekty\MyStudio` folder
2. Rename to your project name
3. Update `package.json` name field
4. Remove `node_modules/` and `package-lock.json`
5. Run `npm install`
6. Initialize new Git repo and push

### Verify Setup

```powershell
# Navigate to project
cd P:\Projekty\my-new-project

# Check Git config (should match directory)
git config user.email

# Start dev server
npm run dev

# In browser: http://localhost:3000
```

---

## 📚 USEFUL COMMANDS

### Git

```powershell
# Check current configuration
git config user.email
git config user.name

# View all configuration
git config --list

# Check which config file applies (for debugging)
git config --local user.email
git config --global user.email

# Create and switch branch
git checkout -b feat/feature-name

# Commit with message
git commit -m "feat: add new feature"

# Push to remote
git push origin feat/feature-name

# View commit history
git log --oneline
git log --graph --all --decorate
```

### npm

```powershell
# Install all dependencies
npm install

# Install specific package
npm install package-name

# Install dev dependency
npm install --save-dev package-name

# Update all packages
npm update

# Check for outdated packages
npm outdated

# Audit for vulnerabilities
npm audit

# Clear cache
npm cache clean --force
```

### Next.js / Development

```powershell
# Start dev server (localhost:3000)
npm run dev

# Build for production
npm run build

# Start production server
npm run start

# Lint code
npm run lint

# Type check
npm run type-check

# Generate TypeScript definitions
npx tsc --init
```

### TypeScript

```powershell
# Type check without generating files
npm run type-check

# Generate type definitions
npx tsc --declaration --emitDeclarationOnly

# Watch for changes
npx tsc --watch
```

---

## 🔗 IMPORTANT LINKS

| Resource | URL |
|----------|-----|
| **MyStudio Template (GitHub)** | https://github.com/tomiwhite/mystudio-template |
| **Next.js Documentation** | https://nextjs.org/docs |
| **React Documentation** | https://react.dev |
| **TypeScript Documentation** | https://www.typescriptlang.org/docs |
| **Tailwind CSS Documentation** | https://tailwindcss.com/docs |
| **ESLint Documentation** | https://eslint.org/docs |

---

## 📊 PROJECT STATUS SUMMARY

| Component | Status | Last Updated |
|-----------|--------|--------------|
| **Git Configuration (Conditional)** | ✅ Complete | 2025-12-12 03:27 |
| **Project Constitution (.github/copilot-instructions.md)** | ✅ Complete | 2025-12-12 03:35 |
| **API Key Security (.env.local)** | ✅ Complete | 2025-12-12 03:35 |
| **npm Dependencies** | ✅ Complete | 2025-12-12 03:41 |
| **TypeScript Configuration** | ✅ Complete | 2025-12-12 03:46 |
| **ESLint Configuration** | ✅ Complete | 2025-12-12 03:46 |
| **Tailwind CSS Setup** | ✅ Complete | 2025-12-12 03:43 |
| **GitHub Repository** | ✅ Live | 2025-12-12 03:52 |
| **Next Phase: Husky Pre-commit Hooks** | ⏳ Pending | – |
| **Next Phase: CI/CD (GitHub Actions)** | ⏳ Pending | – |

---

## 📝 NOTES FOR FUTURE REFERENCE

### When Starting New Conversation

Paste this README to quickly sync context:
- Full local disk and path configuration
- Git setup (work vs. personal emails)
- MyStudio template structure and rules
- Completed phases and status
- Workflow conventions
- Quick start procedures

### Key Files to Know

- **Configuration Source:** `C:\Users\tomiwhite\.gitconfig`
- **Template Location:** `P:\Projekty\MyStudio`
- **Template GitHub:** https://github.com/tomiwhite/mystudio-template
- **Coding Standards:** `.github/copilot-instructions.md`
- **Secrets Template:** `.env.example`

### Next Actions (TODO)

- [ ] Set up Husky pre-commit hooks for automatic linting
- [ ] Add GitHub Actions for CI/CD (test, build, deploy)
- [ ] Create reusable component library in MyStudio
- [ ] Add integration tests (Jest)
- [ ] Deploy template demo to Vercel

---

**Generated:** 2025-12-12 03:56 CET  
**By:** AI Assistant (Perplexity)  
**For:** tomiwhite (MyStudio Project)
