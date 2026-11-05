# Runbook: <Service / Alert name>

- **Owner:** <team> · **Slack:** #<channel> · **Dashboard:** <link>
- **Last verified:** YYYY-MM-DD · **Severity guide:** SEV1 user-facing outage / SEV2 degraded / SEV3 internal

## Symptom

What the alert or user report looks like. Include the exact alert name and threshold.

## Impact

Who is affected, how many, and which functionality. How to confirm scope.

## Diagnose (in order, stop when found)

```sh
# 1. Service health
curl -sS https://<host>/healthz | jq

# 2. Recent deploys / config changes
<command to list recent deploy markers>

# 3. Error rate and latency, last 60 min
<dashboard/metric query>

# 4. Dependency status
<db/queue/third-party check>
```

| Observation | Likely cause | Go to |
| --- | --- | --- |
| 5xx spike after deploy | Bad release | Rollback |
| Latency up, CPU flat | Dependency or lock | Dependency check |
| Queue depth rising | Consumer down / poison message | Scale or drain |
| DB connections maxed | Pool leak or slow query | Query triage |

## Mitigate

1. <fastest safe action, e.g. rollback / scale / disable flag>
2. <second option>
3. Communicate in #incidents: impact, action, next update time.

## Rollback

```sh
<exact command>
```
Verify: <what "recovered" looks like — metric back under X for 10 min>.

## Escalate

| When | Who | How |
| --- | --- | --- |
| 15 min no progress | Secondary on-call | Page |
| Data loss or security | Incident commander + security | Page + #incidents |
| Third-party outage | Vendor support + comms lead | Ticket + status page |

## After

Open a postmortem within 48h, link it here, and create action items with owners and dates.
