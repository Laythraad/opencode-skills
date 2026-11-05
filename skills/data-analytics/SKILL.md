---
name: Data and Analytics
description: Instrument products and analyze data — event schemas, funnels, cohorts, SQL analysis, dashboards, and A/B tests. Use for metrics, tracking plans, or growth analysis.
---

# Data and Analytics

## Start from the decision

Every metric must change a decision. Define: question → metric → event → dashboard → owner. If no one would act differently, do not instrument it.

## Tracking plan

| Field | Example |
| --- | --- |
| Event name | `checkout_completed` (object_action, past tense) |
| Trigger | Server emits after payment capture succeeds |
| Properties | `order_id`, `amount_minor`, `currency`, `payment_method`, `item_count` |
| Identity | `user_id` + `anonymous_id`, resolved on login |
| Owner | Payments team |
| Question | Does the new checkout reduce drop-off at payment? |

Rules: snake_case, no PII, no free-text in properties, version the schema, and validate events in CI against a schema registry.

## Metric definitions (write them down)

- **Active user**: performed a core action in the window — define the action, not "opened the app".
- **Retention**: cohort by first action week, measured on the same action (not "any visit").
- **Conversion**: numerator and denominator explicitly (sessions? users? eligible only?).
- **Churn**: state the grace period and the resurrection rule.

Ambiguous definitions cause more bad decisions than bad data.

## SQL analysis patterns

```sql
-- Funnel with per-step conversion
WITH steps AS (
  SELECT user_id,
    MIN(CASE WHEN event = 'viewed_product' THEN ts END) AS s1,
    MIN(CASE WHEN event = 'added_to_cart'  THEN ts END) AS s2,
    MIN(CASE WHEN event = 'checkout_started' THEN ts END) AS s3,
    MIN(CASE WHEN event = 'purchase' THEN ts END) AS s4
  FROM events
  WHERE ts >= CURRENT_DATE - INTERVAL '30 days'
  GROUP BY user_id
)
SELECT COUNT(*) AS users,
       COUNT(s2) FILTER (WHERE s2 > s1) AS step2,
       COUNT(s3) FILTER (WHERE s3 > s2) AS step3,
       COUNT(s4) FILTER (WHERE s4 > s3) AS step4
FROM steps;
```

Guardrails: dedupe by event id, exclude internal/test accounts, handle timezones explicitly, and state the date range in every chart.

## Experimentation

- Hypothesis + primary metric + guardrails **before** launch.
- Power analysis: sample size from baseline rate and minimum detectable effect.
- Randomize at the unit that matches the decision (user, not session, for retention).
- Pre-register the analysis; no peeking-and-stopping.
- Segment analysis is exploratory unless pre-registered — label it as such.
- Report effect size with confidence intervals, not just p-values.

## Dashboards

One screen per audience: exec (north star + trend), team (funnel + segments), ops (health). Every chart: title as a sentence ("Checkout conversion fell 4pp after release 3.2"), date range, definition tooltip, and data freshness.

## Anti-patterns

Vanity metrics, event sprawl with no owner, dashboards nobody opens, A/B tests stopped at the first good day, and averages that hide a bimodal distribution.
