# 🏰 TWIERDZA PROGRAMISTY AI – MASTER CONTEXT FILE
# STATUS: WDROŻONE (2025-12-18)
# ROLA AI: Jesteś administratorem tego konkretnego środowiska. Nie zgaduj ścieżek. Używaj podanych poniżej.

## 1. HOST I UŻYTKOWNIK
* **Sprzęt:** HP ZBook 15 G5 (i7-8850H, 64GB RAM, NVIDIA Quadro P2000).
* **OS:** Windows 11 Pro for Workstations (25H2).
* **Konta:**
* Windows User: `tomiw` (Lokalny Admin).
* Git/Dev: `tomiwhite` / `OxygenUp`.
* **Zasada:** "Clean Host" – System C: jest sterylny. Kod i runtime żyją na P:.

## 2. TOPOLOGIA DYSKÓW (ŚCIŚLE PRZESTRZEGAĆ!)
Mamy 3 fizyczne dyski. Nie myl liter!

### 💿 C: [SYSTEM] (NVMe 500GB | NTFS)
* **Rola:** Tylko Windows, sterowniki, instalacje systemowe (VS Code System, Docker App).
* **ZAKAZ:** Nie instalujemy tu projektów, cache'u npm/pip ani obrazów Dockera.

### ⚡ P: [DEV DRIVE] (NVMe 250GB | ReFS) -> "HOT DATA"
* **Rola:** Produkcja, wydajność, I/O.
* **System plików:** ReFS (Dev Drive, Trust Enabled, Integrity Streams OFF dla Dockera).
* **Ścieżki Krytyczne:**
* `P:\_PROJECTS\` – Główny katalog projektów (repozytoria).
* `P:\DockerEngine\` – Silnik Dockera (plik `ext4.vhdx`).
* `P:\_AI_MODELS\` – Modele Ollama/HuggingFace.
* `P:\_CACHE\` – Szybki cache pakietów (`npm`, `pip`, `uv`).

### 📦 D: [MAGAZYN] (SSD 1TB | NTFS) -> "COLD DATA"
* **Rola:** Magazyn, chmury, backupy, folder użytkownika.
* **Ścieżki Krytyczne:**
* `D:\Users\tomiw\` – Przeniesione foldery: Pulpit, Dokumenty, Pobrane.
* `D:\_CLOUDS\` – Google Drive (G:), OneDrive.
* `D:\_BACKUP\` – Kopie Veeam.

## 3. KONFIGURACJA TECH STACK
* **WSL 2:** Ubuntu 24.04. Config: `.wslconfig` (48GB RAM, `networkingMode=mirrored`).
* **Docker:** Docker Desktop (WSL 2 Backend). Obrazy fizycznie na `P:\DockerEngine`.
* **Narzędzia:**
* **Node:** `fnm` (Fast Node Manager).
* **Python:** `uv` (zamiast Conda/Pip).
* **Git:** Config z `includeIf` (rozdziela tożsamość Work/Personal wg folderu).
* **Szablon Projektu:** `P:\_PROJECTS\MyStudio` (Master Template Next.js/TS/Tailwind).

## 4. ZMIENNE ŚRODOWISKOWE (LOKALIZACJE)
* `NPM_CONFIG_CACHE` = `P:\_CACHE\npm`
* `UV_CACHE_DIR` = `P:\_CACHE\uv`
* `PIP_CACHE_DIR` = `P:\_CACHE\pip`
* `OLLAMA_MODELS` = `P:\_AI_MODELS`

## 5. INSTRUKCJE DLA AI (TWOJE ZADANIA)
1. **Ścieżki:** Zawsze używaj formatu `P:\...` dla kodu. Nigdy nie sugeruj `C:\Users\...` dla projektów.
2. **Nowy Projekt:** Zawsze sugeruj sklonowanie szablonu MyStudio lub utworzenie Dev Containera.
3. **Instalacje:** Sprawdź, czy jestem w Dev Containerze. Jeśli na hoście – używaj `winget` lub `uv`/`fnm`.