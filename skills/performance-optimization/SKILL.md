---
name: Performance Optimization
description: Diagnose and fix slow systems — profiling, Core Web Vitals, backend latency, memory, and database hotspots. Use when something is slow, or before scaling.
---

# Performance Optimization

## Rule zero

**Measure before changing.** No optimization without a baseline: a number, a tool, and a reproduction. Then change one variable at a time and re-measure with the same method.

## Workflow

1. **Define the target** in user terms: "p95 checkout < 800ms", "LCP < 2.5s on 4G mid-tier Android".
2. **Find the bottleneck layer** with the right tool:

   | Symptom | First tool |
   | --- | --- |
   | Page slow to render | Lighthouse / WebPageTest trace, Chrome Performance panel |
   | API slow | Server traces (OTel), p50 vs p99 split, slow query log |
   | Spiky latency, low CPU | Queueing, GC pauses, lock contention, noisy neighbor |
   | High CPU at steady load | CPU profile / flame graph |
   | Memory grows | Heap snapshot diff, allocation profiling |
   | DB-bound | `EXPLAIN (ANALYZE, BUFFERS)`, `pg_stat_statements` |

3. **Quantify the ceiling**: Little's Law — concurrency = throughput × latency. Know your pool size, worker count, and connection limits.
4. **Attack the biggest contributor first** (usually one item is >50% of the time).
5. **Verify with a load test** at target RPS and above, watching p95/p99, error rate, and saturation.

## Highest-yield fixes, in order

1. Remove work: cache, precompute, batch, avoid redundant calls/N+1.
2. Move work off the critical path: async, queue, background job, edge/CDN.
3. Reduce payload: compression (brotli), field selection, pagination, image formats.
4. Add concurrency/parallelism where independent.
5. Add hardware/capacity (last, and only after 1–4).

## Backend specifics

- Connection pool sized to DB capacity, not to request count; watch wait time, not just usage.
- Timeouts on every outbound call; a missing timeout is a latency bug and an outage waiting to happen.
- Cache with explicit TTL, stampede protection (single-flight), and invalidation strategy; measure hit rate.
- Pagination and streaming for large results; never serialize 100MB "just in case".
- Keep p99 honest: a fast p50 with a 5s p99 is a broken product for real users.

## Frontend specifics

- LCP: preload hero image/font, server-render above-the-fold, reduce TTFB, avoid client-only data for first paint.
- INP: split long tasks (<50ms), yield to the main thread, defer analytics, virtualize long lists.
- CLS: explicit dimensions, reserve space for async content, `font-display` strategy.
- Bundle: route splitting, tree-shaking checks, duplicate dependency audit, modern targets.

## Reporting

Baseline → hypothesis → change → result, with the same benchmark. State variance and sample size. Flag regressions in other metrics (e.g., faster API but more memory).

## Anti-patterns

Micro-optimizing before profiling, benchmarking on an empty database, "it's fast locally", caching to hide a bad query, and tuning JVM/GC flags before fixing allocation behavior.
