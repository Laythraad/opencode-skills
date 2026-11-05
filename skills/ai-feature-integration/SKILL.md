---
name: AI Feature Integration
description: Add LLM features responsibly — task framing, RAG, structured output, evals, guardrails, cost and latency control. Use for chatbots, agents, summarization, or any AI-powered feature.
---

# AI Feature Integration

## First question: does it need an LLM?

Use deterministic code when the task has a fixed rule set (pricing, routing, validation, search over structured fields). LLMs are for fuzzy language tasks, generation, extraction from messy text, and summarization. If a regex or SQL query solves it, use that.

## Architecture

```text
request -> validate input -> (retrieve context) -> prompt builder -> model
        -> validate output -> guardrails -> response + trace
                    ↘ fallback (cache / template / deterministic path)
```

- **Structured output**: JSON Schema / tool calling, then validate with Zod. Retry once with the validation error; never parse prose with regex.
- **Streaming** for anything >1s perceived; show progress and allow cancel.
- **Caching**: exact-match cache for repeated prompts; prompt-prefix caching where the provider supports it.
- **Timeouts and budgets**: hard timeout, max tokens, max tool calls, max cost per request. Fail closed for money/auth actions.
- **Model choice by eval**, not vibes: run the golden set against 2–3 candidates on quality, latency, and cost.

## RAG (when the answer lives in your documents)

1. **Parse and chunk semantically** (headings, sections) with overlap; store metadata (source, date, tenant, permissions).
2. **Hybrid retrieval**: BM25 + vector, then rerank top 20 → top 5. Pure vector search misses exact identifiers.
3. **Filter by permissions before retrieval**, never after generation.
4. **Cite sources** in the output; if no passage passes the relevance threshold, say "not found" instead of guessing.
5. **Freshness**: index updates on write or on a schedule; track document age.

## Evaluation (non-negotiable)

- Build a **golden set** of 30–100 real cases with expected behavior, including adversarial and "should refuse" cases.
- Score with deterministic checks where possible; use LLM-as-judge only for style/subjective dimensions, and calibrate it against human labels.
- Run evals in CI on every prompt/model change; block regressions. Track: accuracy, refusal correctness, latency p95, cost/request, and citation validity.
- Log redacted traces (prompt version, model, tokens, latency, outcome) for debugging.

## Safety

- **Prompt injection**: treat retrieved and user content as untrusted; never let it change tool permissions or system rules. Allowlist tools; require confirmation for destructive actions.
- **PII**: redact before sending to third parties; document retention and provider training policy.
- **Output validation**: escape/encode before rendering; block URLs and HTML from model output unless sanitized.
- **Human in the loop** for irreversible actions (payments, deletes, emails to many recipients).
- **Failures are features**: design the "model is down / low confidence" UX, not a spinner forever.

## Cost and latency budget

| Lever | Effect |
| --- | --- |
| Smaller model for classification/routing | 5–20× cheaper |
| Prompt caching | 50–90% cheaper on long system prompts |
| Batch/async for non-interactive work | Cheaper, but adds latency |
| Retrieval top-k reduction + rerank | Fewer tokens, better precision |
| Response caching | Near-zero for repeats |

State cost per active user per month before launch. If you cannot, you cannot price the product.

## Anti-patterns

A prompt-only wrapper with no eval, trusting model output for authorization or arithmetic, unbounded agent loops, no fallback when the provider is down, and logging full prompts containing user PII.
