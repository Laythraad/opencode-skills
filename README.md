# OpenCode Skills Library

A curated Agent Skills library for OpenCode — engineering, product, design, AI, and delivery skills with decision tables, anti-patterns, deliverables, and quality gates.

## Install

```powershell
# Project scope (source of truth in your project)
copy -Recurse skills\* <project>\.opencode\skills\

# Global scope (available in every project)
copy -Recurse skills\* "$env:USERPROFILE\.config\opencode\skills\"
```

Each skill loads from `skills/<id>/SKILL.md`; read that file first and load `references/` only when relevant.

## Skills (41)

| Skill | Description |
| --- | --- |
| `accessibility` | Audit and fix interfaces for WCAG 2.2 AA — keyboard, screen readers, contrast, forms, and motion. Use for a11y reviews, audits, or compliance questions. |
| `ai-agent-engineering` | Integrate models and tools into bounded, observable, evaluated workflows. |
| `ai-feature-integration` | Add LLM features responsibly — task framing, RAG, structured output, evals, guardrails, cost and latency control. Use for chatbots, agents, summarization, or any AI-powered feature. |
| `backend-api-design` | Design or audit HTTP/REST, GraphQL, or RPC APIs — resources, errors, pagination, versioning, idempotency, auth. Use when adding endpoints or defining a public contract. |
| `backend-engineering` | Build maintainable APIs and domain services with predictable contracts and resilient behavior. |
| `code-review` | Review pull requests or diffs for correctness, design, security, and maintainability, and write actionable review comments. Use when asked to review code. |
| `competition-pitch` | Build the pitch, slides, live demo, and Q&A for a competition or investor judging. Use when presenting a project to judges. |
| `data-analytics` | Instrument products and analyze data — event schemas, funnels, cohorts, SQL analysis, dashboards, and A/B tests. Use for metrics, tracking plans, or growth analysis. |
| `database-design` | Model schemas, indexes, migrations, and query performance for relational or document databases. Use for data modeling, slow queries, or safe schema changes. |
| `database-engineering` | Design data models, migrations, and queries that preserve integrity and protect sensitive data. |
| `data-science-analytics` | Create trustworthy analysis from quality-checked data and clearly defined metrics. |
| `design-system` | Build and govern a component library — tokens, component APIs, documentation, versioning, and adoption. Use when creating or scaling a shared UI system. |
| `devops-cicd` | Design pipelines, containerize apps, provision infrastructure, and set up observability. Use for build/release automation, Docker, IaC, or on-call readiness. |
| `devops-deployment` | Ship reproducible software with secure CI/CD, observability, and operational readiness. |
| `engineering-leadership` | Run a team — 1:1s, feedback, hiring, delegation, performance, incident communication, and technical decision-making. Use for people/process problems or team design. |
| `frontend-engineering` | Build or review client-side apps — component architecture, state, data fetching, rendering strategy, and performance. Use for React/Vue/Svelte/Next work or frontend refactors. Produces component contracts and frontend checklists. |
| `hackathon-execution` | Plan and execute a competition build under a hard deadline — scope cuts, demo-first development, team roles, and judging alignment. Use for 24/48/72-hour hackathons and competitive builds. |
| `interaction-design` | Design flows, states, feedback, and micro-interactions — including errors, empty states, loading, and destructive actions. Use when designing how a feature behaves. |
| `large-scale-delivery` | Coordinate big codebases and multiple teams — monorepo boundaries, contract-first integration, feature flags, release trains, and delivery governance. Use for multi-team or long-lived projects. |
| `mobile-engineering` | Build and ship iOS/Android apps — architecture, offline-first data, performance, release process, and store constraints. Use for React Native, Flutter, Swift, or Kotlin work. |
| `performance-optimization` | Diagnose and fix slow systems — profiling, Core Web Vitals, backend latency, memory, and database hotspots. Use when something is slow, or before scaling. |
| `product-architect` | Turn fuzzy goals into validated scope, requirements, architecture, and reversible decisions. |
| `product-requirements` | Turn an idea into a PRD — problem, users, scope, user stories, acceptance criteria, metrics, and prioritization. Use before building a feature or when scope is unclear. |
| `product-strategy-okrs` | Set direction — vision, strategy, OKRs, roadmaps, and portfolio prioritization. Use for quarterly planning, strategy docs, or aligning teams on outcomes. |
| `project-management` | Plan and run projects — scope, estimates, risks, dependencies, status reporting, and delivery under uncertainty. Use for planning, slipping deadlines, or stakeholder updates. |
| `project-orchestration` | Coordinate specialist skills into an ordered, traceable delivery workflow. |
| `project-scaffolding` | Bootstrap a production-grade app skeleton — stack defaults, folder structure, strict configs, env validation, CI, and seed data. Use when starting a new project or hardening a repo's foundations. |
| `prompt-engineering` | Write testable prompts that reliably produce bounded, useful outputs. |
| `qa-testing` | Provide evidence-based release confidence through risk-driven test coverage. |
| `refactoring` | Improve code structure safely — seams, characterization tests, strangler pattern, and incremental modernization. Use when code is hard to change or a rewrite is being considered. |
| `scientific-research` | Answer science questions with evidence, provenance, uncertainty, and reproducibility. |
| `security-privacy` | Reduce risk through threat modeling, secure defaults, privacy minimization, and verifiable controls. |
| `security-review` | Threat-model features and audit code/infra for auth, injection, secrets, data exposure, and dependency risk. Use before shipping sensitive features or during security reviews. |
| `software-architecture` | Design or review system architecture — boundaries, trade-offs, ADRs, scaling and failure modes. Use for new systems, major refactors, or "should we use X" decisions. |
| `space-data-engineering` | Build robust pipelines for public Earth, astronomy, and space-mission datasets. |
| `technical-documentation` | Create accurate, navigable documentation that stays aligned with implementation. |
| `technical-writing` | Write docs engineers actually use — READMEs, RFCs, ADRs, runbooks, API docs, and postmortems. Use when documenting a system, process, or decision. |
| `testing-strategy` | Decide what to test and how — unit, integration, contract, E2E, property-based, and load. Use when setting up tests, fixing flaky suites, or reviewing coverage. |
| `ui-visual-design` | Define layout, type, color, spacing, and hierarchy for interfaces — visual system, tokens, dark mode, and polish. Use when a screen looks off or a visual system is needed. |
| `ux-research` | Plan and run user research — interviews, usability tests, surveys, synthesis, personas, and journey maps. Use to validate a problem, test a design, or decide what to build. |
| `ux-ui-design` | Create calm, accessible, polished product experiences with clear hierarchy and consistent interaction. |

## Use in a session

````
@<skill-id> <your task>
````

## Update

Edit skills in your project's `.opencode/skills/`, then run `scripts/publish-skills.ps1` to republish this repository.

## Principles

- Evidence over claims; uncertainty is explicit.
- Human review for consequential or irreversible actions.
- Security and privacy by design; least privilege.
- Do not claim tests, deployment, access, or verification that did not happen.