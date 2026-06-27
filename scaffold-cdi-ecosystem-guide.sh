#!/usr/bin/env bash
set -euo pipefail

# Scaffold the Complex Data Insights Ecosystem guide repo.
# Run from the root of the cdi-system-guides repository.

PROJECT_TITLE="Complex Data Insights Ecosystem"
PROJECT_SUBTITLE="From Complex Data Questions to Reproducible Analytical Systems"
PROJECT_AUTHOR="Teresia Mrema Buza | Complex Data Insights"
SITE_URL="https://ecosystem.complexdatainsights.com"
DOMAIN="ecosystem.complexdatainsights.com"
COVER_PATH="assets/images/cover/cdi-system-guides-cover.png"

mkdir -p \
  guides \
  launch \
  assets/css \
  assets/images/cover \
  .github/workflows

cat > CNAME <<CNAME_EOF
${DOMAIN}
CNAME_EOF

cat > .gitignore <<'GITIGNORE_EOF'
# Quarto build/cache outputs
.quarto/
_freeze/
_site/
docs/

# Python/R local environments
.venv/
.env
.Rproj.user/
.Rhistory
.RData

# macOS
.DS_Store

# Logs and temporary files
*.log
*.tmp
GITIGNORE_EOF

cat > _quarto.yml <<YAML_EOF
project:
  type: book
  output-dir: _site

book:
  title: "${PROJECT_TITLE}"
  subtitle: "${PROJECT_SUBTITLE}"
  author: "${PROJECT_AUTHOR}"
  date: today
  site-url: "${SITE_URL}"
  repo-url: "https://github.com/tmbuza/cdi-system-guides"
  repo-actions: [source, issue]
  search: true

  chapters:
    - index.qmd

    - part: "CDI Ecosystem Foundation"
      chapters:
        - 00-preface.qmd
        - 01-system-guides-overview.qmd
        - 02-cdi-framework.qmd
        - 03-recommended-learning-pathway.qmd
        - 04-guide-ecosystem-map.qmd
        - 05-how-to-use-the-guides.qmd

    - part: "CDI System Guide Profiles"
      chapters:
        - guides/06-data-science-foundations-premium.qmd
        - guides/07-systematic-dataset-discovery.qmd
        - guides/08-cdi-data-acquisition-system.qmd
        - guides/09-microbiome-analysis-system.qmd
        - guides/10-proteomics-analysis-system.qmd
        - guides/11-clinical-medical-data-systems.qmd

    - part: "Public Communication and Launch Materials"
      chapters:
        - launch/12-public-introduction-framework.qmd
        - launch/13-linkedin-launch-posts.qmd
        - launch/14-short-social-posts.qmd
        - launch/15-website-snippets.qmd

    - part: "Appendices"
      chapters:
        - 999-appendix.qmd
        - 999-references.qmd

bibliography: references.bib

format:
  html:
    theme:
      light: cosmo
      dark: darkly
    css: assets/css/styles.css
    toc: true
    toc-depth: 3
    number-sections: false
    code-copy: true
    smooth-scroll: true
    link-external-newwindow: true
    include-in-header:
      text: |
        <meta name="description" content="Complex Data Insights Ecosystem: from complex data questions to reproducible analytical systems.">

execute:
  freeze: auto
YAML_EOF

cat > index.qmd <<EOF_INDEX
---
title: ""
engine: knitr
format:
  html:
    body-classes: front-page
---

::: {.cdi-front-page}

![](${COVER_PATH}){fig-align="center" width="75%"}

# ${PROJECT_TITLE}

## ${PROJECT_SUBTITLE}

**Complex Data Insights System Guides** provide a structured pathway from complex data questions to reproducible analytical systems.

This ecosystem hub connects CDI guides across data science foundations, systematic dataset discovery, data acquisition, omics analysis, clinical data systems, and public communication workflows.

::: {.cdi-front-actions}
[Start with the overview](01-system-guides-overview.qmd){.btn .btn-primary}
[View the guide ecosystem map](04-guide-ecosystem-map.qmd){.btn .btn-secondary}
:::

*Last updated: {{< meta date >}}*

:::
EOF_INDEX

cat > 00-preface.qmd <<'EOF_00'
# Preface

:::cdi-message
- **ID:** CDI-ECO-000
- **Type:** Ecosystem Preface
- **Audience:** Learners, researchers, analysts, technical teams, and collaborators
- **Theme:** Why CDI System Guides exist
:::

Complex Data Insights exists to help transform complex data questions into reproducible analytical systems.

The CDI System Guides are designed as practical public resources. Each guide focuses on a specific layer of the data-to-decision pathway, while the ecosystem as a whole shows how those layers connect.

This guide is the public entry point for the CDI ecosystem.

It does not replace the individual system guides. Instead, it explains how they fit together, when to use each guide, and how the CDI pathway grows from foundational analytical thinking into domain-specific systems.

## Core message

```text
From complex data questions to reproducible analytical systems.
```

## What this ecosystem guide does

This guide helps readers:

- understand the CDI System Guides ecosystem;
- choose the right guide for their current need;
- follow a logical pathway from question to reproducible output;
- reuse public launch language for LinkedIn, README files, websites, and short posts;
- connect technical work to communication, training, consulting, and decision support.
EOF_00

cat > 01-system-guides-overview.qmd <<'EOF_01'
# CDI System Guides Overview

:::cdi-message
- **ID:** CDI-ECO-001
- **Type:** Ecosystem Overview
- **Audience:** New readers, collaborators, learners, and technical teams
- **Theme:** The CDI guide-of-guides
:::

The CDI System Guides are a connected collection of practical guides for building reproducible analytical workflows.

Each guide can stand alone.

Together, they form an ecosystem.

The ecosystem connects:

```text
Question
→ Discovery
→ Acquisition
→ Analysis
→ Interpretation
→ Reporting
→ Decision Support
```

## Current CDI System Guides

| Guide | Role in the ecosystem |
|---|---|
| Data Science Foundations Premium | Parent analytical foundation |
| Systematic Dataset Discovery | Finding and screening suitable public datasets |
| CDI Data Acquisition System | Reproducible data retrieval and validation |
| Microbiome Analysis System | Domain-specific microbiome analysis workflow |
| Proteomics Analysis System | Results-first proteomics interpretation workflow |
| Clinical & Medical Data Systems | Clinical and medical data workflow structure |

## Ecosystem principle

A CDI guide should not only explain a method.

It should show how the method becomes part of a reusable, auditable, and communicable analytical system.
EOF_01

cat > 02-cdi-framework.qmd <<'EOF_02'
# CDI Framework

:::cdi-message
- **ID:** CDI-ECO-002
- **Type:** Framework Chapter
- **Audience:** Analysts, researchers, project leads, and trainees
- **Theme:** From questions to systems
:::

The CDI framework organizes analytical work as a pathway.

```text
Complex data question
→ structured discovery
→ reproducible acquisition
→ validated analysis
→ defensible interpretation
→ clear reporting
→ decision support
```

## Why a framework is needed

Complex data work often fails not because individual methods are weak, but because the workflow is fragmented.

A strong analytical system needs:

- a clear question;
- traceable data sources;
- reproducible acquisition;
- documented assumptions;
- validated outputs;
- transparent interpretation;
- communication that supports decisions.

## CDI system logic

Each CDI System Guide should answer five questions:

1. What problem does this system solve?
2. What inputs does it require?
3. What workflow does it follow?
4. What outputs does it produce?
5. How can the outputs support interpretation, reporting, or decisions?
EOF_02

cat > 03-recommended-learning-pathway.qmd <<'EOF_03'
# Recommended Learning Pathway

:::cdi-message
- **ID:** CDI-ECO-003
- **Type:** Learning Pathway
- **Audience:** Learners, analysts, researchers, and training groups
- **Theme:** A logical sequence through the CDI guides
:::

The recommended sequence begins with analytical foundations, then moves toward dataset discovery, acquisition, domain-specific analysis, and clinical systems.

## Recommended order

```text
1. Data Science Foundations Premium
2. Systematic Dataset Discovery
3. CDI Data Acquisition System
4. Microbiome Analysis System
5. Proteomics Analysis System
6. Clinical & Medical Data Systems
```

## Why this order works

Data Science Foundations Premium provides the parent layer.

Systematic Dataset Discovery helps identify suitable public datasets before analysis begins.

CDI Data Acquisition System converts selected datasets into reproducible data inputs.

Microbiome and Proteomics Analysis Systems show how domain-specific biological workflows can be built on top of reproducible inputs.

Clinical & Medical Data Systems extends the same systems logic into clinical and medical contexts.

## Alternative entry points

Readers do not always need to start at the beginning.

A learner may begin with Data Science Foundations Premium.

A bioinformatics researcher may begin with Microbiome or Proteomics Analysis System.

A clinical data team may begin with Clinical & Medical Data Systems.

The ecosystem exists so readers can enter at the most relevant point while still understanding the wider pathway.
EOF_03

cat > 04-guide-ecosystem-map.qmd <<'EOF_04'
# Guide Ecosystem Map

:::cdi-message
- **ID:** CDI-ECO-004
- **Type:** Ecosystem Map
- **Audience:** Public readers, collaborators, funders, learners, and technical teams
- **Theme:** How the CDI guides connect
:::

The CDI ecosystem can be understood as a layered map.

```text
Complex Data Insights Ecosystem
├── Foundations
│   └── Data Science Foundations Premium
├── Data Discovery and Acquisition
│   ├── Systematic Dataset Discovery
│   └── CDI Data Acquisition System
├── Omics Analysis Systems
│   ├── Microbiome Analysis System
│   └── Proteomics Analysis System
└── Clinical and Medical Data Systems
    └── Clinical & Medical Data Systems
```

## Pathway view

```text
Data Science Foundations Premium
→ Systematic Dataset Discovery
→ CDI Data Acquisition System
→ Microbiome / Proteomics Analysis Systems
→ Clinical & Medical Data Systems
```

## Public positioning

The ecosystem site is the front door.

The individual guide repositories are the detailed rooms.

This guide helps readers see the full CDI structure before entering a specific system.
EOF_04

cat > 05-how-to-use-the-guides.qmd <<'EOF_05'
# How to Use the Guides

:::cdi-message
- **ID:** CDI-ECO-005
- **Type:** User Orientation
- **Audience:** Learners, analysts, research teams, and collaborators
- **Theme:** Practical use of the CDI ecosystem
:::

The CDI System Guides can be used in several ways.

## For learning

Use the guides as structured learning pathways. Begin with the foundation guide, then move toward domain-specific workflows.

## For research

Use the guides to organize reproducible project workflows, especially when working with public datasets, omics outputs, or clinical data tables.

## For consulting and training

Use the guides as public proof of system thinking, reproducible workflow development, and practical analytical communication.

## For public communication

Use the launch materials to introduce each guide consistently across LinkedIn, GitHub README files, websites, and short social posts.

## Suggested workflow

```text
Read the ecosystem overview
→ choose a guide profile
→ open the full guide repository
→ adapt the workflow to a real project
→ communicate the result clearly
```
EOF_05

cat > guides/06-data-science-foundations-premium.qmd <<'EOF_06'
# Data Science Foundations Premium

:::cdi-message
- **ID:** CDI-ECO-006
- **Type:** Ecosystem Guide Profile
- **Audience:** Learners, analysts, researchers, and technical teams
- **Theme:** Foundational analytical thinking for reproducible systems
:::

Data Science Foundations Premium is the parent analytical foundation of the CDI ecosystem.

It introduces the thinking, workflows, and communication habits needed to move from analysis toward real-world analytical systems.

## Role in the CDI ecosystem

This guide provides the foundation for later CDI pathways.

Once a project has a tidy results table, many downstream systems can refer back to the data science foundation for model evaluation, visualization, interpretation, reporting, and decision-making principles.

## Public short introduction

Data Science Foundations Premium is the foundation layer of the CDI ecosystem, helping learners move from isolated analysis to reproducible analytical thinking.

## Public long introduction

Data Science Foundations Premium introduces the core analytical ideas behind the CDI System Guides. It focuses on building a practical foundation for reproducible analysis, model evaluation, interpretation, communication, and decision support. This guide supports learners and analysts who want to move beyond single results toward structured analytical workflows that can support real projects.

## Suggested call to action

Start here if you want the analytical foundation behind the CDI System Guides.
EOF_06

cat > guides/07-systematic-dataset-discovery.qmd <<'EOF_07'
# Systematic Dataset Discovery

:::cdi-message
- **ID:** CDI-ECO-007
- **Type:** Ecosystem Guide Profile
- **Audience:** Researchers, analysts, bioinformatics teams, and learners
- **Theme:** Finding suitable public datasets systematically
:::

Systematic Dataset Discovery helps turn a research question into a transparent dataset selection process.

## Role in the CDI ecosystem

This guide sits between the research question and data acquisition.

It helps identify, screen, prioritize, and document public datasets before downstream analysis begins.

## Public short introduction

Systematic Dataset Discovery helps researchers move from broad research questions to eligible public datasets using a transparent and reproducible screening workflow.

## Public long introduction

Systematic Dataset Discovery is a CDI guide for finding and evaluating public datasets before analysis begins. It supports reproducible research by making dataset search, screening, inclusion, exclusion, and prioritization more transparent. The guide is especially useful when public omics datasets need to be selected carefully before acquisition and analysis.

## Suggested call to action

Use this guide when the first challenge is finding the right dataset.
EOF_07

cat > guides/08-cdi-data-acquisition-system.qmd <<'EOF_08'
# CDI Data Acquisition System

:::cdi-message
- **ID:** CDI-ECO-008
- **Type:** Ecosystem Guide Profile
- **Audience:** Bioinformatics teams, analysts, researchers, and data managers
- **Theme:** Reproducible public data acquisition
:::

The CDI Data Acquisition System supports reproducible retrieval, validation, and organization of public omics data.

## Role in the CDI ecosystem

This guide converts selected datasets into structured project inputs.

It connects dataset discovery with downstream analytical systems such as microbiome and proteomics workflows.

## Public short introduction

The CDI Data Acquisition System helps turn selected public datasets into reproducible, validated, analysis-ready project inputs.

## Public long introduction

The CDI Data Acquisition System is a practical guide for retrieving, validating, and organizing public omics data. It focuses on reproducibility, traceability, manifests, validation reports, and project-ready data organization. This system helps ensure that downstream analysis begins from documented and defensible data inputs.

## Suggested call to action

Use this guide when you need to move from selected accessions to organized, validated data files.
EOF_08

cat > guides/09-microbiome-analysis-system.qmd <<'EOF_09'
# Microbiome Analysis System

:::cdi-message
- **ID:** CDI-ECO-009
- **Type:** Ecosystem Guide Profile
- **Audience:** Microbiome researchers, bioinformatics learners, analysts, and project teams
- **Theme:** From microbial communities to defensible biological insights
:::

The Microbiome Analysis System is a domain-specific CDI guide for organizing microbiome analysis into a reproducible workflow.

## Role in the CDI ecosystem

This guide builds on data acquisition and moves into microbiome-specific quality control, feature generation, taxonomic profiling, diversity analysis, functional profiling, differential analysis, interpretation, and reporting.

## Public short introduction

The Microbiome Analysis System helps turn microbiome data into reproducible profiles, interpretable results, and defensible biological insights.

## Public long introduction

The Microbiome Analysis System is a CDI omics guide for structuring microbiome analysis from data inputs to biological interpretation. It connects acquisition, quality control, feature generation, taxonomic profiling, functional profiling, differential analysis, and reproducible reporting into a coherent analytical system.

## Suggested call to action

Use this guide when microbiome data need to become a reproducible analytical workflow rather than a collection of disconnected outputs.
EOF_09

cat > guides/10-proteomics-analysis-system.qmd <<'EOF_10'
# Proteomics Analysis System

:::cdi-message
- **ID:** CDI-ECO-010
- **Type:** Ecosystem Guide Profile
- **Audience:** Proteomics researchers, analysts, bioinformatics learners, and interpretation teams
- **Theme:** Results-first proteomics interpretation
:::

The Proteomics Analysis System is a results-first CDI guide for working with processed proteomics result tables.

## Role in the CDI ecosystem

This guide focuses on the common real-world starting point where users already have differential protein abundance results and need to clean, rank, annotate, enrich, visualize, interpret, and report them.

## Public short introduction

The Proteomics Analysis System helps turn processed proteomics result tables into ranked proteins, functional interpretation, and reproducible reports.

## Public long introduction

The Proteomics Analysis System is a CDI omics guide for results-first proteomics workflows. It begins with processed differential protein tables and guides users through table inspection, metadata validation, differential abundance interpretation, protein ranking, identifier cleaning, GO and pathway enrichment, network analysis, visualization, biological interpretation, and reproducible reporting.

## Suggested call to action

Use this guide when you already have proteomics results and need to turn them into defensible biological interpretation.
EOF_10

cat > guides/11-clinical-medical-data-systems.qmd <<'EOF_11'
# Clinical & Medical Data Systems

:::cdi-message
- **ID:** CDI-ECO-011
- **Type:** Ecosystem Guide Profile
- **Audience:** Clinical researchers, health data teams, analysts, and medical data learners
- **Theme:** Structuring clinical and medical data workflows
:::

Clinical & Medical Data Systems applies CDI systems thinking to clinical and medical data workflows.

## Role in the CDI ecosystem

This guide extends CDI reproducibility principles into clinical and medical contexts, where data structure, validation, interpretation, privacy-aware thinking, reporting, and decision support are especially important.

## Public short introduction

Clinical & Medical Data Systems helps organize clinical and medical data workflows into structured, reproducible, and interpretable analytical systems.

## Public long introduction

Clinical & Medical Data Systems is a CDI guide for organizing clinical and medical data workflows. It focuses on practical systems for data structure, validation, analysis readiness, interpretation, reporting, and decision-oriented communication. The guide connects analytical reproducibility with the realities of clinical and medical data work.

## Suggested call to action

Use this guide when clinical or medical data need to be organized into a reliable analytical workflow.
EOF_11

cat > launch/12-public-introduction-framework.qmd <<'EOF_12'
# Public Introduction Framework

:::cdi-message
- **ID:** CDI-ECO-012
- **Type:** Public Communication Framework
- **Audience:** Public readers, LinkedIn audiences, collaborators, learners, and website visitors
- **Theme:** Consistent public introduction of CDI guides
:::

This chapter provides the reusable public introduction framework for CDI System Guides.

## Core CDI message

```text
From complex data questions to reproducible analytical systems.
```

## Umbrella introduction

Complex Data Insights System Guides are practical, systems-oriented resources for building reproducible analytical workflows across data science, public dataset discovery, data acquisition, omics analysis, clinical data systems, and public communication.

Each guide is designed as a modular system that can stand alone, but together they form a connected pathway from question formulation to defensible analysis, interpretation, reporting, and decision support.

## Reusable launch structure

```text
1. Name the guide
2. State the problem it solves
3. Explain where it fits in the CDI ecosystem
4. Describe the practical workflow
5. Identify who it is for
6. End with a clear call to action
```

## Consistent hashtags

```text
#ComplexDataInsights #CDISystemGuides #DataScience #ReproducibleResearch #AnalyticalSystems #OpenScience
```
EOF_12

cat > launch/13-linkedin-launch-posts.qmd <<'EOF_13'
# LinkedIn Launch Posts

:::cdi-message
- **ID:** CDI-ECO-013
- **Type:** LinkedIn Launch Copy
- **Audience:** LinkedIn network, collaborators, learners, researchers, and technical professionals
- **Theme:** Professional launch messaging
:::

This chapter stores reusable LinkedIn launch language for CDI System Guides.

## General CDI ecosystem launch post

Complex Data Insights System Guides are built around one central message:

**From complex data questions to reproducible analytical systems.**

The CDI ecosystem connects practical guides across data science foundations, dataset discovery, data acquisition, omics analysis, clinical data systems, and reproducible reporting.

Each guide can stand alone, but together they form a pathway from question formulation to defensible analysis, interpretation, and decision support.

#ComplexDataInsights #CDISystemGuides #DataScience #ReproducibleResearch #AnalyticalSystems #OpenScience

## Guide-specific template

```text
I am introducing [GUIDE NAME], part of the Complex Data Insights System Guides ecosystem.

This guide focuses on [PROBLEM / WORKFLOW AREA].

It fits into the CDI pathway by helping users move from [STARTING POINT] to [OUTPUT / DECISION VALUE].

The goal is practical: not just to explain methods, but to organize analytical work into reproducible systems.

From complex data questions to reproducible analytical systems.

#ComplexDataInsights #CDISystemGuides #ReproducibleResearch #AnalyticalSystems
```
EOF_13

cat > launch/14-short-social-posts.qmd <<'EOF_14'
# Short Social Posts

:::cdi-message
- **ID:** CDI-ECO-014
- **Type:** Short Social Copy
- **Audience:** Short-form social platforms and quick public updates
- **Theme:** Concise CDI ecosystem messaging
:::

This chapter stores short public posts for CDI System Guides.

## CDI ecosystem short post

Complex Data Insights System Guides are practical resources for moving from complex data questions to reproducible analytical systems.

The ecosystem connects data science, dataset discovery, data acquisition, omics analysis, clinical data systems, and reporting.

#ComplexDataInsights #CDISystemGuides #ReproducibleResearch

## Very short version

From complex data questions to reproducible analytical systems.

That is the core idea behind the Complex Data Insights System Guides.

#ComplexDataInsights #CDISystemGuides
EOF_14

cat > launch/15-website-snippets.qmd <<'EOF_15'
# Website Snippets

:::cdi-message
- **ID:** CDI-ECO-015
- **Type:** Website Copy
- **Audience:** Website visitors, collaborators, learners, and public readers
- **Theme:** Landing page and README-ready language
:::

This chapter stores reusable website and README snippets for the CDI ecosystem.

## Landing page snippet

Complex Data Insights System Guides are practical, systems-oriented resources for building reproducible analytical workflows across data science, public dataset discovery, data acquisition, omics analysis, clinical data systems, and reproducible reporting.

Each guide is designed as a modular system that can stand alone, but together they form a connected pathway from question formulation to defensible analysis, interpretation, reporting, and decision support.

## README snippet

This repository is the public landing hub for the Complex Data Insights System Guides ecosystem.

It connects CDI guides across data science foundations, systematic dataset discovery, reproducible data acquisition, microbiome analysis, proteomics analysis, clinical and medical data systems, and public communication workflows.

Core message:

```text
From complex data questions to reproducible analytical systems.
```
EOF_15

cat > 999-appendix.qmd <<'EOF_APP'
# Appendix

:::cdi-message
- **ID:** CDI-ECO-999A
- **Type:** Appendix
- **Audience:** Readers who want supporting notes and reusable materials
- **Theme:** Supplementary CDI ecosystem material
:::

This appendix can store supporting notes, checklists, terminology, future guide ideas, and implementation references for the CDI ecosystem.

## Future guide candidates

Potential future CDI guides may include:

- AI, Thinking & Decision Systems;
- Applied Decision Support Systems;
- Public Health Data Systems;
- Research Communication Systems;
- Reproducible Reporting Systems.
EOF_APP

cat > 999-references.qmd <<'EOF_REF'
# References

:::cdi-message
- **ID:** CDI-ECO-999R
- **Type:** References
- **Audience:** Readers who want citations and supporting sources
- **Theme:** Reference support for the CDI ecosystem
:::

This page will store references for the CDI ecosystem guide.

::: {#refs}
:::
EOF_REF

cat > references.bib <<'EOF_BIB'
@misc{cdi_ecosystem_2026,
  title = {Complex Data Insights Ecosystem},
  author = {Buza, Teresia Mrema},
  year = {2026},
  note = {Complex Data Insights System Guides public ecosystem hub}
}
EOF_BIB

cat > README.md <<'EOF_README'
# Complex Data Insights Ecosystem

**From complex data questions to reproducible analytical systems.**

This repository is the public landing hub for the Complex Data Insights System Guides ecosystem.

It connects CDI guides across data science foundations, systematic dataset discovery, reproducible data acquisition, microbiome analysis, proteomics analysis, clinical and medical data systems, and public communication workflows.

## Site

https://ecosystem.complexdatainsights.com

## Local preview

```bash
quarto preview
```

## Publishing

This repository is configured for GitHub Actions publishing to the `gh-pages` branch.

Push changes to `main`; GitHub Actions renders and publishes the site.
EOF_README

cat > assets/css/styles.css <<'EOF_CSS'
/* Complex Data Insights Ecosystem styles */

.cdi-front-page {
  text-align: center;
  max-width: 980px;
  margin: 0 auto;
  padding-top: 1.5rem;
}

.cdi-front-page h1 {
  font-weight: 800;
  letter-spacing: -0.03em;
  margin-top: 1.5rem;
}

.cdi-front-page h2 {
  font-weight: 500;
  color: var(--bs-secondary-color);
  margin-bottom: 1.5rem;
}

.cdi-front-actions {
  margin-top: 2rem;
  margin-bottom: 2rem;
}

.cdi-front-actions .btn {
  margin: 0.25rem;
}

.cdi-message {
  border-left: 4px solid #2aa6b8;
  background: rgba(42, 166, 184, 0.08);
  padding: 0.9rem 1rem;
  margin: 1rem 0 1.5rem 0;
  border-radius: 0.35rem;
}
EOF_CSS

cat > .github/workflows/publish.yml <<'EOF_WORKFLOW'
name: Publish Quarto site

on:
  push:
    branches: [main]
  workflow_dispatch:

permissions:
  contents: write

jobs:
  build-deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Check out repository
        uses: actions/checkout@v4

      - name: Set up Quarto
        uses: quarto-dev/quarto-actions/setup@v2

      - name: Render site
        uses: quarto-dev/quarto-actions/render@v2

      - name: Copy CNAME into published site
        run: |
          cp CNAME _site/CNAME

      - name: Publish to gh-pages
        uses: peaceiris/actions-gh-pages@v4
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./_site
          publish_branch: gh-pages
          force_orphan: true
EOF_WORKFLOW

echo "CDI ecosystem guide scaffold created."
echo "Next steps:"
echo "  1. Add the cover image at ${COVER_PATH}"
echo "  2. Preview locally with: quarto preview"
echo "  3. Commit source files and push to main"
echo "  4. Set GitHub Pages source to gh-pages / root"
