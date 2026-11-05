---
name: DevOps and CI/CD
description: Design pipelines, containerize apps, provision infrastructure, and set up observability. Use for build/release automation, Docker, IaC, or on-call readiness.
---

# DevOps and CI/CD

## Workflow

1. **Define the release unit and the rollback story first.** If rollback takes >5 minutes or is manual, fix that before adding automation.
2. **Pipeline stages**: lint/typecheck → unit → build (reproducible) → integration/contract → security scan → deploy to staging → smoke → progressive deploy → verify. Parallelize what is independent; fail fast.
3. **Target durations**: PR feedback < 10 min, full pipeline < 25 min. Cache dependencies and build layers aggressively.
4. **Environment parity**: same image, same config mechanism, differences only through env vars and secrets.

## Pipeline rules

- **Deterministic builds**: lockfiles committed, pinned base image digests, no `latest` tags, build metadata (commit SHA) baked in and exposed via a `/version` endpoint.
- **Artifacts, not rebuilds**: build once, promote the same artifact through environments.
- **Secrets**: from a secret manager at deploy time, never in the image or repo; rotate; scan history.
- **Progressive delivery**: canary or blue/green with automated gates on error rate, latency p95, and saturation. Auto-rollback on gate breach.
- **Migrations decoupled from deploys** and backward compatible (expand/contract).
- **Branch protection**: required checks, linear history or squash merge, signed commits where compliance demands.

## Containers

- Multi-stage builds; final image non-root, distroless/alpine, read-only FS where possible.
- One process per container; handle `SIGTERM` with graceful shutdown (stop accepting, drain, exit).
- Set `resources.requests` from measured usage and `limits` above p99 to avoid CPU throttling.
- Health: `liveness` (process alive) ≠ `readiness` (can serve). Never put dependency checks in liveness.

## Infrastructure as Code

- Everything reproducible from code; no console changes (detect drift in CI).
- Remote state with locking; separate states per environment/blast radius.
- `plan` reviewed in the PR; `apply` only from the pipeline.
- Tag every resource with owner, cost center, and environment.

## Observability contract

| Signal | Minimum |
| --- | --- |
| Logs | Structured JSON, correlation/request ID, no PII, retention policy |
| Metrics | RED (rate, errors, duration) for services; USE (utilization, saturation, errors) for resources |
| Traces | Sampling strategy; propagate context across async boundaries |
| Alerts | Symptom-based, tied to SLO burn rate; every alert has an owner and a runbook link |
| Dashboards | One per service: golden signals + dependencies + deploy markers |

SLOs before alerts. Alert on burn rate (e.g. 2% budget in 1h → page), not on raw CPU.

## Review checklist

- [ ] Pipeline fails on security findings above threshold.
- [ ] Rollback tested in the last 30 days.
- [ ] Backups restored in a drill, not just taken.
- [ ] Runbooks exist for the top 5 alerts.
- [ ] No long-lived credentials in CI; OIDC/short-lived tokens.
- [ ] Deploy is idempotent and safe to re-run.

## Anti-patterns

Snowflake servers, manual prod deploys, `latest` images, secrets in `.env` committed, alerts nobody owns, and "we'll monitor it after launch".
