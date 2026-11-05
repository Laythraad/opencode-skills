---
name: Security Review
description: Threat-model features and audit code/infra for auth, injection, secrets, data exposure, and dependency risk. Use before shipping sensitive features or during security reviews.
---

# Security Review

## Workflow

1. **Map assets and trust boundaries**: what data, who can reach it, where it crosses a boundary (browser→API, service→DB, webhook→handler, admin→tenant).
2. **STRIDE per boundary**: Spoofing, Tampering, Repudiation, Information disclosure, DoS, Elevation. One line per credible threat.
3. **Rate each threat** by impact × likelihood; fix high items before ship, log accepted risks with an owner and expiry.
4. **Verify with evidence**: a test, a request/response, or a config line — not an opinion.

## Checklist by area

**AuthN/AuthZ**
- [ ] Session tokens httpOnly + Secure + SameSite; rotation on privilege change; short TTL with refresh.
- [ ] Authorization checked on the object, in the data layer (policy/RLS), not only in the router.
- [ ] No IDOR: enumerate `/api/orders/{id}` with another tenant's ID.
- [ ] Role escalation paths tested (self-upgrade, mass assignment of `role`).
- [ ] MFA available for admin; brute-force throttling on login and reset.

**Input/Output**
- [ ] Parameterized queries everywhere; no string-built SQL.
- [ ] Output encoded per context (HTML, attribute, JS, URL); CSP with nonces, no `unsafe-inline`.
- [ ] SSRF: outbound URLs allowlisted, metadata IPs blocked, redirects not followed blindly.
- [ ] File uploads: type sniffed server-side, size capped, stored outside webroot, served with `Content-Disposition`.
- [ ] Deserialization of untrusted data avoided (no pickle/Java native/YAML unsafe load).

**Data**
- [ ] Secrets in a manager, not env files or repo history; scanned with gitleaks/trufflehog.
- [ ] PII minimized, encrypted at rest, masked in logs and analytics.
- [ ] Backups encrypted; access logged; retention defined.
- [ ] Error responses and stack traces do not leak internals.

**Platform**
- [ ] Dependencies scanned (SCA) and patched on a schedule; SBOM generated.
- [ ] Containers non-root, minimal base, no secrets in layers.
- [ ] Least-privilege IAM; no wildcard `*` actions; OIDC over static keys.
- [ ] Rate limits on auth, expensive, and write endpoints.
- [ ] Audit log for privileged actions, tamper-evident, retained.

## High-signal manual probes

- Change an ID, a tenant header, and a role claim — three requests that catch most broken access control.
- Replay a webhook out of order and with an old timestamp.
- Send `Content-Type: text/plain` and duplicate JSON keys.
- Request a password reset for an address you do not own and inspect the response timing/message.
- Check for secrets in the built frontend bundle and source maps.

## Reporting

Findings ranked Critical/High/Medium/Low, each with: location, exploit scenario, evidence, remediation, and verification step. Critical = remote unauthenticated data access or code execution. Fix order: exploitable now > data exposure > hardening.

## Ground rules

Never run destructive tests against production. Use a scoped test account and document every probe. Do not paste real secrets into reports — reference their location.
