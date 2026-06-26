# 📊 Credit Risk Analytics & Underwriting Policy Optimization

An end-to-end data analytics project that evaluates borrower credit risk, identifies high-risk lending segments, and simulates underwriting policy changes using **MySQL, Python, and Power BI**.

The project follows a complete analytics workflow—from raw loan records to executive dashboards—emphasizing business decision-making rather than only data visualization.

---

# Project Overview

Financial institutions must balance two competing objectives:

* Increase loan approvals to generate revenue.
* Minimize defaults that erode portfolio profitability.

This project analyzes historical lending data to answer a fundamental business question:

> **Can a targeted underwriting policy, derived from historical portfolio analysis, reduce expected credit losses while preserving profitability?**

To answer this, the project was divided into three analytical phases:

1. **SQL** – Portfolio exploration and risk driver identification.
2. **Python** – Multi-factor risk modeling and underwriting policy simulation.
3. **Power BI** – Executive dashboard for business decision support.

---

# Analytics Pipeline

```text
                Raw Loan Dataset
                       │
                       ▼
              MySQL Database
                       │
        Portfolio Exploration & SQL Analysis
                       │
                       ▼
          Python Risk Analytics Engine
       (EDA + Feature Engineering +
      Policy Simulation + Data Export)
                       │
                       ▼
        Processed Analytics Dataset
                       │
                       ▼
         Power BI Executive Dashboard
```

---

# Business Objectives

The project was designed to:

* Analyze historical borrower behavior.
* Measure portfolio-wide default risk.
* Identify financial and demographic risk drivers.
* Discover hidden high-risk borrower segments.
* Simulate alternative underwriting policies.
* Quantify the financial impact of policy changes.
* Present findings through interactive executive dashboards.

---

# Dataset

| Metric                  |          Value |
| ----------------------- | -------------: |
| Loan Records            |        255,347 |
| Portfolio Exposure      | ~$29.6 Billion |
| Historical Default Rate |         11.61% |
| Target Variable         |  DefaultStatus |

The dataset contains borrower demographics, financial information, loan characteristics, employment details, credit history, and repayment outcomes.

---

# Technology Stack

| Layer                 | Technology                         |
| --------------------- | ---------------------------------- |
| Database              | MySQL                              |
| Data Analysis         | Python                             |
| Libraries             | Pandas, NumPy, Matplotlib, Seaborn |
| Business Intelligence | Power BI                           |
| Documentation         | GitHub, Markdown                   |

---

# Phase 1 — SQL Portfolio Risk Analysis

## Objective

The SQL phase establishes a baseline understanding of the loan portfolio by identifying which borrower characteristics are associated with elevated default rates.

---

## Database Engineering

A relational table was created in MySQL and populated using bulk import operations.

Key SQL operations included:

* Database creation
* Bulk CSV ingestion
* Portfolio aggregation
* Risk segmentation
* Financial metric calculations

---

## Portfolio Baseline

| Metric               |    Value |
| -------------------- | -------: |
| Total Loans          |  255,347 |
| Defaulted Loans      |   29,653 |
| Default Rate         |   11.61% |
| Average Income       |  $82,499 |
| Average Loan Amount  | $127,578 |
| Average Credit Score |      574 |

These metrics establish the benchmark used throughout the project.

---

## Financial Risk Analysis

Several borrower characteristics were segmented to measure their relationship with loan defaults.

### Credit Score

Borrowers were categorized into:

* Low
* Medium
* High

Interestingly, default rates remained relatively stable across all credit score groups, suggesting that credit score alone is a weak predictor within this portfolio.

---

### Debt-to-Income Ratio

Borrowers with higher DTI ratios accounted for nearly **64% of all defaults**, indicating significant portfolio exposure despite similar default probabilities across groups.

---

### Interest Rate

Interest rates showed one of the strongest relationships with default risk.

| Interest Rate | Default Rate |
| ------------- | -----------: |
| <10%          |        7.06% |
| >20%          |       17.82% |

Higher borrowing costs substantially increased repayment risk.

---

### Loan-to-Income Leverage

A custom financial ratio was created:

```
Loan Amount ÷ Annual Income
```

Borrowers requesting loans greater than **2.5× their annual income** experienced:

* **18.03% default rate**

making leverage the strongest standalone risk indicator identified during SQL analysis.

---

### Employment Analysis

Default rates increased as employment stability declined.

| Employment    | Default Rate |
| ------------- | -----------: |
| Full-Time     |        9.46% |
| Self-Employed |       11.46% |
| Part-Time     |       11.97% |
| Unemployed    |       13.55% |

---

### Education

Higher educational attainment corresponded with lower default rates.

| Education   | Default Rate |
| ----------- | -----------: |
| High School |       12.88% |
| Bachelor's  |       12.10% |
| Master's    |       10.87% |
| PhD         |       10.59% |

---

### Loan Purpose

Business loans carried the highest risk, while home loans demonstrated the strongest repayment performance.

---

### Accountability Factors

Three additional variables consistently reduced default risk:

* Co-signers
* Marital status
* Dependents

These variables act as supplementary indicators of repayment stability.

---

# SQL Findings

The strongest risk factors identified were:

1. Loan-to-Income Ratio
2. Interest Rate
3. Employment Status
4. Debt-to-Income Ratio
5. Co-Signer Availability
6. Education
7. Credit Score

---

# Phase 2 — Python Risk Modeling & Policy Simulation

## Objective

SQL identifies relationships.

Python evaluates **interactions** between variables and estimates the financial consequences of changing lending policies.

---

## Feature Engineering

A new feature was created:

```
Leverage Ratio = Loan Amount / Annual Income
```

Borrowers were grouped into:

* Low Leverage
* Medium Leverage
* High Leverage (>2.5× Income)

This engineered feature became one of the primary risk indicators throughout the project.

---

## Multi-Factor Risk Analysis

Rather than analyzing variables independently, multiple borrower characteristics were examined simultaneously.

The highest-risk borrower segment identified was:

> **Unemployed + High Leverage**

This combination produced a:

**23.26% default rate**

approximately **double the overall portfolio default rate**.

---

## Evaluating the Co-Signer Policy

The institution assumes that requiring a co-signer reduces lending risk.

This assumption was tested specifically within the highest-risk segment.

| Segment           | Default Rate |
| ----------------- | -----------: |
| Without Co-Signer |       23.26% |
| With Co-Signer    |       18.91% |

Although co-signers reduced defaults by **4.35 percentage points**, risk remained unacceptably high.

The analysis indicates that repayment capacity is a stronger determinant than co-signer availability.

---

## Underwriting Policy Simulation

Instead of stopping at descriptive analytics, a policy simulation was developed.

### Proposed Rule

Reject applications where:

* Employment Status = Unemployed
* Loan-to-Income Ratio > 2.5×

The simulation estimates:

* Defaults avoided
* Capital protected
* Interest revenue sacrificed
* Net financial impact

---

## Simulation Results

```text
Applications Rejected : 17,650

Defaults Prevented    : 3,717

Capital Saved         : $683,048,393

Interest Revenue Lost : $248,828,509

------------------------------------

Net Financial Benefit

+$434,219,884
```

---

## Business Insight

Although some creditworthy borrowers would also be rejected, the reduction in default losses significantly outweighs the lost interest revenue.

This demonstrates that targeted underwriting policies can materially improve portfolio profitability.

---

## Data Pipeline

The processed dataset generated during Python analysis was exported and used directly within Power BI for dashboard development.

---

# Phase 3 — Power BI Executive Dashboard

## Objective

Transform analytical findings into an interactive business intelligence solution for executives and lending managers.

---

## Dashboard Components

### Executive KPI Dashboard

Displays:

* Portfolio Size
* Default Rate
* Total Loan Exposure
* Total Defaults

---

### Financial Risk Dashboard

Interactive visualizations include:

* Interest Rate vs Default Rate
* Loan-to-Income Analysis
* Credit Score Distribution
* Debt-to-Income Segmentation

---

### Customer Risk Dashboard

Analyzes:

* Employment Type
* Education
* Loan Purpose
* Co-Signer Impact
* Marital Status
* Dependents

---

### Policy Simulation Dashboard

Presents:

* Applications Rejected
* Defaults Prevented
* Capital Saved
* Revenue Lost
* Net Financial Benefit

allowing business users to understand the financial implications of proposed underwriting strategies.

---

# Key Business Insights

* Loan-to-Income Ratio is the strongest predictor of default.
* Interest rate increases are associated with substantially higher default rates.
* Credit score alone provides limited predictive value within this portfolio.
* Unemployed borrowers requesting highly leveraged loans represent the highest-risk segment.
* Co-signers reduce risk but cannot fully offset weak repayment capacity.
* A targeted underwriting rule could improve expected portfolio value by approximately **$434 million**.

---

# Project Structure

```text
loan-default/
│
├── data/
│   └── Loan_default.csv
│
├── sql/
│   ├── exploratory_risk_analysis.sql
│   └── README.md
│
├── notebook/
│   ├── cleaned_credit_risk_data.csv
│   ├── risk_interaction_simulation.ipynb
│   └── README.md
│
├── powerbi/
│   └── Loan Default.pbix
│
├── outcomes/
│   ├── cosigner_policy_facet_grid.png
│   └── employment_leverage_risk_heatmap.png
│
├── report/
│   └── Credit Risk Analysis and Underwriting Policy Optimization.docx
│
└── README.md
```

---

# Skills Demonstrated

### SQL

* Database Design
* Data Import
* Aggregations
* CASE Statements
* Grouping
* Financial Metrics
* Portfolio Analysis

### Python

* Data Cleaning
* Feature Engineering
* Exploratory Data Analysis
* Statistical Visualization
* Risk Modeling
* Policy Simulation
* Business Analytics

### Power BI

* Data Modeling
* Interactive Dashboards
* KPI Design
* Drill-through Reports
* Business Storytelling

---

# Future Improvements

Potential enhancements include:

* Machine Learning credit default prediction models
* Probability of Default (PD) estimation
* Loan Loss Forecasting
* Interactive underwriting policy sliders
* Customer risk scoring engine
* Explainable AI (SHAP/LIME) for model interpretability
* Automated ETL pipeline

---

# Author

**Ayush Butala**

Computer Engineering Student | Data Analytics | SQL | Python | Power BI

Passionate about building end-to-end analytics solutions that transform raw data into actionable business decisions through data engineering, statistical analysis, and business intelligence.
