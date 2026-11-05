---
name: space-data-engineering
description: Build robust pipelines for public Earth, astronomy, and space-mission datasets.
---
# Space Data Engineering

## Purpose
Build robust pipelines for public Earth, astronomy, and space-mission datasets.

## When to use
Use this skill when a project needs space data engineering as a defined workstream. Combine it with `project-orchestration` for multi-discipline tasks.

## Workflow
1. Identify science question, spatial/temporal bounds, coordinate reference system, units, and resolution.
2. Select source by authority and fit: NASA, ESA, NOAA, USGS, JPL or mission-specific repositories.
3. Check API terms, authentication, rate limits, data licenses, and provenance.
4. Validate timestamps, coordinates, units, missing tiles, quality flags, and product version.
5. Preserve metadata; document transformations and calibration/processing level.
6. Create reproducible acquisition and analysis steps; distinguish sample data from live feeds.

## Deliverables
Produce fit-for-purpose artifacts such as: data-source-catalog.md, geospatial-checklist.md, pipeline-spec.md. Do not create paperwork that does not help a decision or implementation.

## Quality gates
- Deliverables are specific to the project, internally consistent, and actionable.
- Assumptions and unknowns are explicitly labeled.
- High-impact risks have mitigations or an owner and acceptance decision.
- Claims are supported by implementation evidence or clearly marked as proposals.
- Review for accessibility, privacy, security, maintainability, and user impact as applicable.

## Safety and integrity
An API endpoint or mission name does not itself establish scientific validity.
- Ask for clarification only when a missing detail blocks safe or correct work; otherwise state a reasonable assumption.
- Do not expose credentials, personal data, or confidential material in artifacts.
- Do not fabricate external research, test runs, approvals, deployment, or tool outcomes.
- Human approval is required for consequential external actions, production changes, and irreversible operations.

## Handoff
Summarize: objective, decisions, changed/produced artifacts, validation performed, unresolved issues, and next recommended step. Link to artifacts by repository-relative path.

## Reference material
Load these files only when needed:
- `references/data-source-catalog.md` — focused practical guide.
- `references/geospatial-checklist.md` — focused practical guide.
- `references/pipeline-spec.md` — focused practical guide.
