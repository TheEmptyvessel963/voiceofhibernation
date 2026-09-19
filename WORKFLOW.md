# Jekyll Blog Local & Deployment Workflow

This guide details the local development setup, Ruby 4.0 configuration, and end-to-end deployment workflow for the blog.

---

## 📍 1. Ruby Environment Configuration

Ruby is installed locally at:
- **Root Directory**: `C:\Ruby40-x64`
- **Binaries Directory**: `C:\Ruby40-x64\bin`

### Key Executables

| Component | Path | Version |
| :--- | :--- | :--- |
| **Ruby Interpreter** | `C:\Ruby40-x64\bin\ruby.exe` | 4.0.4 (`x64-mingw-ucrt`) |
| **RubyGems** | `C:\Ruby40-x64\bin\gem.bat` | 4.0.20 |
| **Bundler** | `C:\Ruby40-x64\bin\bundle.bat` | 4.0.20 |
| **Jekyll** | `C:\Ruby40-x64\bin\jekyll.bat` | 4.4.1 |
| **Ruby Runtime DLL** | `C:\Ruby40-x64\bin\x64-ucrt-ruby400.dll` | - |
| **Ruby DevKit Tooling** | `C:\Ruby40-x64\bin\ridk.cmd` / `ridk.ps1` | - |
| **MSYS2 Build Tools** | `C:\Ruby40-x64\msys64` | For native gems |

> **Note**: `C:\Ruby40-x64\bin` is registered in your system `PATH`. You can run `ruby`, `bundle`, and `jekyll` directly from any PowerShell or Command Prompt terminal.

---

## 💻 2. Local Development Workflow

### A. Verify Setup
Run this in PowerShell inside the blog directory:
```powershell
ruby -v
bundle -v
jekyll -v
```

### B. Install or Update Gem Dependencies
If `Gemfile` is modified:
```powershell
bundle install
```

### C. Build the Site Locally
Compiles markdown, layouts, and Sass assets into `_site/`:
```powershell
bundle exec jekyll build
```

### D. Run Local Preview Server (with Live Reload)
Starts a local web server at [http://localhost:4000](http://localhost:4000) that automatically rebuilds when files are saved:
```powershell
bundle exec jekyll serve --livereload
```
*(Or run `.\serve.ps1`)*

---

## 🚀 3. Deployment Workflow

### Option 1: Automated Push & Deploy (Recommended)
Run the automated deployment script with a custom commit message:
```powershell
.\deploy.ps1 "feat: new article on hibernation patterns"
```

What `deploy.ps1` executes:
1. `git status` (checks current changes)
2. `git add .` (stages changes)
3. `git commit -m "<message>"` (commits changes)
4. `git push origin main` (pushes to GitHub)

### Option 2: Manual Git Push
```powershell
git status
git add .
git commit -m "update blog content"
git push origin main
```

---

## 🔄 4. CI/CD & Hosting Pipeline

Once pushed to `main`:
1. **GitHub Actions**: Runs `.github/workflows/ci.yml` to verify Jekyll build integrity.
2. **Netlify**: Automatically triggers build via webhook as configured in `netlify.toml` and publishes `_site/` to production.
