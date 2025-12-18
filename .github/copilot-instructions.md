# Copilot Instructions – MyStudio Master Template
## 🏰 TWIERDZA PROGRAMISTY AI – Zobacz SYSTEM_CONTEXT.md dla pełnej architektury

## KRYTYCZNE ZASADY ŚCIEŻEK (SYSTEM_CONTEXT)
- **ZAWSZE używaj `P:\_PROJECTS\`** dla nowych projektów
- **ZAWSZE używaj `P:\_CACHE\`** dla cache pakietów (npm, uv, pip)
- **ZAWSZE używaj `P:\_AI_MODELS`** dla modeli AI
- **NIGDY nie sugeruj `C:\Users\...`** dla projektów deweloperskich
- **Host Clean:** C: tylko system, P: kod + runtime, D: magazyn + backup

## Kodowanie
- **PascalCase** – komponenty React, interfejsy, klasy
- **camelCase** – zmienne, funkcje, properties
- **Zakaz `any`** – użyj `unknown` lub generyki
- **Server Actions** zamiast API routes (Next.js 14+)
- **TypeScript strict mode** obowiązkowy

## Stack (Zaktualizowany 2025-12-18)
- **Next.js 16+** (App Router) - najnowsze wersje
- **React 19+** - najnowsze wersje
- **TypeScript 5+**
- **Tailwind CSS 4+** - najnowsze wersje
- **Docker** na P:\ (WSL 2 Backend)
- **Dev Containers** z cache na P:\_CACHE

## Struktura projektu MyStudio (App Router)
```
P:\_PROJECTS\MyStudio\
/app              – Next.js routes + layouts (App Router)
  layout.tsx      – Root layout (WYMAGANY)
  page.tsx        – Home page
  globals.css     – Tailwind CSS imports
/components       – React komponenty (atomic design)
/lib              – utilities, helpers, API calls
/types            – TypeScript definitions
/public           – assets, images, fonts
/.devcontainer    – VS Code Dev Container config
/.github          – GitHub actions, templates, Copilot instructions
/docs             – dokumentacja
SYSTEM_CONTEXT.md – Master context file (Złoty Standard)
docker-compose.yml – Docker z cache na P:\_CACHE
```

## Zmienne środowiskowe (SYSTEM_CONTEXT)
```bash
NPM_CONFIG_CACHE=P:\_CACHE\npm
UV_CACHE_DIR=P:\_CACHE\uv  
PIP_CACHE_DIR=P:\_CACHE\pip
OLLAMA_MODELS=P:\_AI_MODELS
```

## Docker & Dev Containers
- **Port MyStudio:** 3001 (unika konfliktu z Open WebUI na 3000)
- **Cache Volumes:** P:\_CACHE\npm, P:\_CACHE\uv, P:\_CACHE\pip
- **AI Models:** P:\_AI_MODELS (Ollama, HuggingFace)
- **Dev Container:** TypeScript-Node z cache na P:\

## Reguły komitów (Conventional Commits)
- `feat: ...` – nowa feature
- `fix: ...` – bugfix  
- `refactor: ...` – refactoring
- `docs: ...` – dokumentacja
- `test: ...` – testy
- `chore: ...` – zadania maintenance

## Narzędzia deweloperskie
- **Node:** `fnm` (Fast Node Manager)
- **Python:** `uv` (zamiast Conda/Pip) 
- **Git:** Config z `includeIf` (Work/Personal)
- **VS Code:** Extensions w devcontainer.json

## Użycie szablonu MyStudio
1. **Klonowanie:** `git clone P:\_PROJECTS\MyStudio NewProject`
2. **Dev Container:** Uruchom w VS Code z `.devcontainer`
3. **Docker:** `docker-compose up -d` (port 3001)
4. **Cache:** Automatyczne mapowanie na P:\_CACHE
5. **AI Models:** Dostępne przez P:\_AI_MODELS