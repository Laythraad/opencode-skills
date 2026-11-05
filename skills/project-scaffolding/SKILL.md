---
name: Project Scaffolding
description: Bootstrap a production-grade app skeleton — stack defaults, folder structure, strict configs, env validation, CI, and seed data. Use when starting a new project or hardening a repo's foundations.
---

# Project Scaffolding

## Default stack (change only with a reason)

| Layer | Default | Why |
| --- | --- | --- |
| Framework | Next.js (App Router) + TypeScript strict | SSR/ISR, one deploy target, huge ecosystem |
| Styling | Tailwind + CSS variables as design tokens | No raw values in components |
| Data | PostgreSQL + Drizzle (or Prisma) | Relational invariants, typed queries |
| Validation | Zod at every boundary | Shared client/server schema |
| Auth | Provider (Auth.js/Clerk) with DB sessions | Never hand-roll |
| Tests | Vitest + Testing Library + Playwright | Fast unit, real E2E |
| Quality | ESLint + Prettier/Biome + `tsc --noEmit` | Enforced in CI |
| CI/CD | GitHub Actions + preview deploy per PR | Deploy from pipeline only |
| Observability | Structured logs + Sentry + basic metrics | Failures must be visible |

Alternatives are fine when justified: SvelteKit/Vue for team familiarity, SQLite for local-first, tRPC for a single-client monorepo.

## Target structure

```text
src/
├── app/                    # routes, layouts, loading/error boundaries
│   ├── (marketing)/
│   ├── (app)/
│   └── api/                # thin handlers -> services
├── features/<domain>/      # vertical slices: components, hooks, service, schema
├── components/ui/          # design-system primitives
├── lib/                    # db, auth, env, http, logger, result
├── styles/tokens.css
└── tests/                  # fixtures, factories
drizzle/                    # migrations
.github/workflows/ci.yml
```

Rules: routes are thin; domain logic lives in `features/*/service.ts`; nothing imports from another feature's internals; `lib/` never imports `features/`.

## Config checklist (do this before the first feature)

- [ ] `tsconfig`: `strict`, `noUncheckedIndexedAccess`, `noImplicitOverride`, `exactOptionalPropertyTypes`, path aliases.
- [ ] `env.ts`: parse `process.env` with Zod at boot; fail fast with a readable error; separate client/server vars.
- [ ] `.gitignore`, `.editorconfig`, `.nvmrc`/`packageManager` pinned.
- [ ] Scripts: `dev`, `build`, `typecheck`, `lint`, `format`, `test`, `test:e2e`, `db:generate`, `db:migrate`, `db:seed`.
- [ ] Error boundary + `not-found` + `loading` + global error handler.
- [ ] Logger with request id; no `console.log` in app code (lint rule).
- [ ] Health endpoint `/api/health` returning version + dependency status.
- [ ] Seed script with deterministic demo data.
- [ ] `.env.example` complete and copy-pasteable.
- [ ] README with a quick start verified in a clean clone.

## CI skeleton

```yaml
name: ci
on: [pull_request]
jobs:
  verify:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:16
        env: { POSTGRES_PASSWORD: postgres }
        ports: ["5432:5432"]
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: 22, cache: npm }
      - run: npm ci
      - run: npm run typecheck
      - run: npm run lint
      - run: npm test -- --coverage
      - run: npm run db:migrate
      - run: npx playwright test
```

Add: dependency audit, secret scan, and a preview deploy on PR.

## Bootstrap order (first 90 minutes)

1. `create-next-app` + strict TS + Tailwind.
2. Tokens file (color/space/type/radius) and 3 primitives (Button, Input, Card).
3. `env.ts` + `.env.example` + DB connection + one migration.
4. One vertical slice end to end (list + create) with tests.
5. CI green, preview URL live, seed data visible.
6. Only now add the second feature.

## Anti-patterns

Scaffolding with 30 empty folders, adding a state manager before the first server query, custom auth, skipping env validation, "tests later", and a README that has never been run.
