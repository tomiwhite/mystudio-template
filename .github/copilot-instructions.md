# Copilot Instructions – MyStudio

## Kodowanie
- **PascalCase** – komponenty React, interfejsy, klasy
- **camelCase** – zmienne, funkcje, properties
- **Zakaz ny** – użyj unknown lub generyki
- **Server Actions** zamiast API routes (Next.js 13+)
- **TypeScript strict mode** obowiązkowy

## Stack
- Next.js 14+ (App Router)
- React 18+
- TypeScript 5+
- Tailwind CSS
- Supabase / Firebase (backend)

## Struktura projektu
\\\
/src
  /app          – Next.js routes + layouts
  /components   – React komponenty (atomic design)
  /lib          – utilities, helpers, API calls
  /types        – TypeScript definitions
  /styles       – globalne style, Tailwind config
/public         – assets, images, fonts
/.github        – GitHub actions, templates
/docs           – dokumentacja
\\\

## Reguły komitów
- \eat: ...\ – nowa feature
- \ix: ...\ – bugfix
- \efactor: ...\ – refactoring
- \docs: ...\ – dokumentacja
- \	est: ...\ – testy

## Zmienne środowiskowe
- \.env.local\ – lokalne zmienne (w .gitignore!)
- \.env.example\ – template zmiennych
- Nigdy nie commituj keys API
