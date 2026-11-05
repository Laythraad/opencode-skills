---
name: Refactoring and Legacy Code
description: Improve code structure safely — seams, characterization tests, strangler pattern, and incremental modernization. Use when code is hard to change or a rewrite is being considered.
---

# Refactoring and Legacy Code

## Stance

Legacy code is code without tests that works and pays the bills. The goal is **safe change**, not beauty. Never mix refactoring and behavior change in one commit.

## Workflow

1. **Pin the behavior.** Write characterization tests around the area you are about to touch (input → observed output, even if the output looks wrong). If untestable, find a seam.
2. **Find seams**: where can you substitute a dependency without editing callers? Introduce one (extract interface, inject clock/HTTP client, wrap a static call).
3. **Refactor in tiny steps**, running tests after each: rename, extract function, move, inline, replace conditional with polymorphism.
4. **Measure the target improvement**: cyclomatic complexity, change frequency × complexity (hotspots), duplication, build time, test coverage of the touched path.
5. **Only then change behavior**, with the new tests proving both old and new expectations.

## Strangler pattern (replace a subsystem)

1. Put a façade in front of the old component.
2. Route one capability at a time to the new implementation (by tenant, route, or flag).
3. Run both in parallel and diff outputs where possible.
4. Migrate data with a resumable, idempotent backfill and dual-write window.
5. Delete the old path only when telemetry shows zero traffic for a full cycle.

## When a rewrite is justified

- The current system blocks a business requirement that cannot be met incrementally, **and**
- you have a measurable cost of the status quo (incidents, delivery time, infra), **and**
- there is a migration plan that ships value before the old system is retired.

Otherwise, refactor. Rewrites lose the accumulated bug fixes and domain knowledge that nobody documented.

## Highest-yield refactorings

| Smell | Move |
| --- | --- |
| Long function with mixed levels | Extract until each function is one level of abstraction |
| Deep nesting | Guard clauses, early return |
| Duplicated branches | Table-driven or polymorphism |
| God class | Split by reason to change |
| Primitive obsession | Value objects (`Money`, `Email`, `DateRange`) |
| Feature envy | Move behavior to the data it uses |
| Shotgun surgery | Consolidate the concept behind one module |

## Safety nets

- Golden-master tests for outputs you cannot specify (serialize real inputs, compare snapshots).
- Mutation testing on critical modules to prove tests bite.
- Feature flags with a removal date; measure flag debt.
- Small PRs (<400 lines) so review and revert stay cheap.

## Anti-patterns

Refactor on a branch for weeks, "clean up while I'm here" mixed with a bug fix, adding abstractions before the second use case, and rewriting without a parallel-run strategy.
