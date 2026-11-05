---
name: Mobile Engineering
description: Build and ship iOS/Android apps — architecture, offline-first data, performance, release process, and store constraints. Use for React Native, Flutter, Swift, or Kotlin work.
---

# Mobile Engineering

## Choose the stack by constraints

| Constraint | Lean |
| --- | --- |
| One team, CRUD + forms, fast iteration | React Native / Flutter |
| Heavy platform APIs, camera/AR, widgets | Native (SwiftUI / Compose) |
| Existing web team, content app | PWA / RN |
| Long-lived, performance-critical | Native |

Whatever the choice: architecture, offline behavior, and release discipline matter more than the framework.

## Architecture

- **Layered**: UI → state/domain → data (repositories) → platform (API, DB, storage). UI never calls HTTP directly.
- **State**: unidirectional; persist navigation state so cold start restores context.
- **Local DB** (SQLite/Realm/WatermelonDB) is the source of truth; network is a sync mechanism.
- **Sync engine**: outbox queue for writes, idempotency keys, conflict policy (server-wins with merge UI, or field-level), retry with backoff, and a visible "pending sync" state.

## Offline-first rules

1. Every read renders from cache instantly, then refreshes.
2. Every write is queued optimistically and reconciled.
3. Never block the UI on connectivity.
4. Handle: token expiry mid-queue, schema migration on app update, clock skew, duplicate submits.

## Performance budgets

| Metric | Target |
| --- | --- |
| Cold start (TTI) | < 2s mid-tier Android |
| Screen transition | < 300ms, no dropped frames |
| Scroll | 60fps; virtualize lists (`FlatList`/`LazyColumn`) |
| App size | Watch it every release; strip assets, split ABIs |
| Battery/network | Batch requests, respect metered connections |

Profile on a real low-end device, not a flagship simulator.

## Release discipline

- **Versioning**: semver + build number; migrations must survive users skipping versions.
- **Staged rollout** (5% → 25% → 100%) with crash-rate gates (e.g. halt at >0.5% sessions).
- **Force-update** path for breaking API changes; keep old versions working for ≥2 release cycles.
- **Store rules**: privacy manifest/data-safety declarations, permission rationales, review-time buffer (iOS), background-location justification.
- **OTA** (Expo/CodePush) only for JS/asset updates within store policy.

## Security and privacy

Keychain/Keystore for tokens (never AsyncStorage plain), certificate pinning where threat model warrants, no PII in logs/analytics, screenshot protection for sensitive screens, and deep-link validation (untrusted input).

## Review checklist

- [ ] All states handled offline: loading from cache, empty, error, pending sync.
- [ ] Permissions requested contextually with a fallback path.
- [ ] Accessibility: screen reader labels, dynamic type, 44pt targets.
- [ ] No hardcoded strings; RTL layouts verified.
- [ ] Crash/ANR monitoring with symbolication in place.
- [ ] Deep links and push notifications tested cold-start.

## Anti-patterns

Network-only screens, retry loops without backoff, blocking splash on API calls, shipping without staged rollout, and storing tokens in plain storage.
