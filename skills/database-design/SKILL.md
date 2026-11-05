---
name: Database Design
description: Model schemas, indexes, migrations, and query performance for relational or document databases. Use for data modeling, slow queries, or safe schema changes.
---

# Database Design

## Workflow

1. **List the invariants** the data must never violate, and who owns each write path.
2. **Write the access patterns first**: top 10 queries with expected frequency, selectivity, and sort order. Schema follows queries; indexes follow schema.
3. **Normalize to 3NF, then denormalize deliberately** where a measured read path demands it — and record how the copy stays consistent.
4. **Choose keys**: surrogate PK (bigint/uuidv7/ULID), natural unique constraints, and a partition key if volume or retention requires it. Prefer time-ordered IDs to avoid index bloat.
5. **Plan migration and rollback before writing DDL.**

## Modeling rules

- **One fact, one place.** Duplicated state needs an owner and a reconciliation job.
- **Explicit state machines**: status columns with a documented allowed-transition table, enforced in code and (where possible) by constraint.
- **Timestamps**: `created_at`/`updated_at` in UTC, `timestamptz` in Postgres. Store the event time and the ingestion time separately when they can differ.
- **Soft delete**: only with a retention policy and partial indexes (`WHERE deleted_at IS NULL`). Otherwise hard delete.
- **Money**: integer minor units + ISO currency code. Never float.
- **Enums**: lookup table or check constraint; never free text.
- **JSON columns**: for genuinely schemaless payloads, with a version field and validated shape. Never as a substitute for columns you filter on.
- **Multi-tenancy**: tenant_id on every row, in every index prefix, and in the RLS policy (Postgres) or query guard.

## Indexing

| Symptom | Action |
| --- | --- |
| Sequential scan on a filtered column | B-tree index on the predicate |
| `ORDER BY ... LIMIT` slow | Composite index matching filter + sort order |
| `LIKE 'prefix%'` slow | `text_pattern_ops` B-tree, or trigram for infix |
| JSON containment queries | GIN index |
| Range on time + equality on tenant | `(tenant_id, created_at DESC)` |
| Low-cardinality boolean | Partial index, not a plain index |

Costs: every index slows writes and consumes cache. Drop unused indexes (check `pg_stat_user_indexes.idx_scan`). Verify with `EXPLAIN (ANALYZE, BUFFERS)` on production-like data volume — never on an empty dev DB.

## Safe migrations (zero downtime)

1. Add nullable column / new table (backward compatible).
2. Dual-write or backfill in batches (1–10k rows, throttled, resumable, idempotent).
3. Add constraints as `NOT VALID`, then `VALIDATE CONSTRAINT` separately.
4. Switch reads; keep writes dual for one full deploy cycle.
5. Remove old path after telemetry shows zero use.

Never in one step on a large table: add column with a volatile default, change a column type with a rewrite, add a FK that locks both tables, or build an index without `CONCURRENTLY`.

## Performance triage

1. Get the actual plan and the top wait events.
2. Check: missing index, stale statistics, N+1 from the ORM, lock contention, connection pool exhaustion, oversized result sets, OFFSET pagination.
3. Fix the query before adding hardware. Then consider read replicas, caching, partitioning, archiving.

## Deliverables

ERD, table of access patterns → indexes, migration plan with rollback, backup/restore verification, and retention/archival policy.
