# 📊 Bank Loan Default Risk Analysis (SQL Phase Documentation)

**Dataset Size:** 255,347 Records

## Objective

Identify the primary financial and behavioral drivers behind loan defaults to engineer a data-driven risk mitigation strategy.

---

# 🟩 Layer 1: Portfolio Baseline Metrics

## Q1: Overall Portfolio Size & Health

| Metric                 | Value             |
| ---------------------- | ----------------- |
| Total Portfolio Volume | 255,347 Loans     |
| Total Defaulted Loans  | 29,653 Defaulters |
| Baseline Default Rate  | 11.61%            |

### Takeaway

This **11.61%** serves as the portfolio's baseline risk benchmark. Any category performing significantly above this threshold represents elevated risk, while categories below it indicate relative safety.

---

## Q2: Core Portfolio Averages

| Metric                         | Value           |
| ------------------------------ | --------------- |
| Average Borrower Income        | \$82,499 / year |
| Average Loan Amount Requested  | \$127,578       |
| Average Portfolio Credit Score | 574             |

### Takeaway

The average borrower requests a loan approximately **1.5× their annual income**, while the average credit score falls within the **Fair Credit** range, indicating substantial exposure to middle-market lending risk.

---

# 🟨 Layer 2: Financial Risk Drivers (The "Heavy Hitters")

## Q3: Credit Score Impact

### Findings

Default rates remain relatively consistent across all credit score brackets, hovering around **11%**, with less than a **1% variation** between low and high credit tiers.

### Strategic Verdict

**Weak Standalone Indicator**

Within this portfolio, traditional credit scores alone do not effectively distinguish between borrowers likely to default and those likely to repay.

---

## Q4: Debt-to-Income (DTI) Ratio Impact

### Findings

Default percentages remain relatively stable across DTI categories. However, **64% of all defaults** originate from borrowers in the **High DTI** segment.

### Strategic Verdict

**Massive Volumetric Indicator**

Although High DTI does not dramatically increase the probability of default for an individual loan, it contributes the majority of overall portfolio losses due to the sheer volume of borrowers in this category.

---

## Q5: Interest Rate Impact

### Findings

| Interest Rate Tier | Customers | Defaults | Default Rate |
| ------------------ | --------- | -------- | ------------ |
| Low (<10%)         | 88,825    | 6,274    | 7.06%        |
| Very High (20%+)   | 55,601    | 9,907    | 17.82%       |

### Strategic Verdict

**Extremely Strong Predictive Indicator**

Default risk more than doubles as interest rates increase. Interest rates intended to compensate for borrower risk may be amplifying repayment burden and contributing significantly to higher default rates.

---

## Q6: Loan-to-Income Leverage Ratio (Loan Amount ÷ Income)

### Findings

| Leverage Tier           | Default Rate |
| ----------------------- | ------------ |
| Low (<1× Income)        | 8.18%        |
| Medium (1×–2.5× Income) | 9.98%        |
| High (>2.5× Income)     | 18.03%       |

**High Leverage Segment:**

- Customers: 69,917
- Defaults: 12,605

### Strategic Verdict

**The Ultimate Predictive Indicator**

Borrowers requesting loans exceeding **2.5× their annual income** exhibit the highest observed default rate (**18.03%**). This factor generates more than double the raw defaults of the low-leverage segment despite representing a smaller borrower population.

---

# 🟦 Layer 3: Customer & Behavioral Factors (Supporting Signals)

> **Note:** Customer distribution is nearly uniform across all demographic categories below, with each segment representing approximately 20–25% of the portfolio.

---

## Q7: Employment Type

| Employment Type | Default Rate | Defaults |
| --------------- | ------------ | -------- |
| Full-Time       | 9.46%        | 6,024    |
| Self-Employed   | 11.46%       | 7,302    |
| Part-Time       | 11.97%       | 7,677    |
| Unemployed      | 13.55%       | 8,650    |

### Strategic Verdict

**Income Predictability Matters**

Full-time employment is associated with the lowest default rate, while unemployment contributes an additional **2,626 defaults** relative to the safest employment category.

---

## Q8: Education Level

| Education Level | Default Rate |
| --------------- | ------------ |
| PhD             | 10.59%       |
| Master's        | 10.87%       |
| Bachelor's      | 12.10%       |
| High School     | 12.88%       |

### Strategic Verdict

**Consistent Downward Risk Trend**

Default risk decreases steadily as educational attainment increases, likely reflecting stronger earning potential and greater financial stability. However, the relatively small spread (**2.3%**) suggests education acts as a secondary risk modifier.

---

## Q9: Loan Purpose

| Loan Purpose | Default Rate |
| ------------ | ------------ |
| Home         | 10.23%       |
| Other        | ~11.8%       |
| Education    | ~11.8%       |
| Auto         | ~11.8%       |
| Business     | 12.33%       |

### Strategic Verdict

**Purpose Influences Risk**

Home loans demonstrate the strongest repayment performance, potentially due to collateral backing. Business loans carry the highest default risk, reflecting the uncertainty associated with entrepreneurial ventures.

---

## Q10: Accountability Safeguards (Co-Signers, Marital Status & Dependents)

### Co-Signer Protection

| Category          | Default Rate |
| ----------------- | ------------ |
| With Co-Signer    | 10.36%       |
| Without Co-Signer | 12.87%       |

### Marital Stability

| Category | Default Rate |
| -------- | ------------ |
| Married  | 10.40%       |
| Single   | 11.91%       |
| Divorced | 12.53%       |

### Dependents Impact

| Category           | Default Rate |
| ------------------ | ------------ |
| With Dependents    | 10.50%       |
| Without Dependents | 12.72%       |

### Strategic Verdict

**Social and Legal Accountability Reduces Risk**

Co-signers, marital stability, and dependent responsibilities consistently lower default rates by approximately **2–2.5 percentage points**, suggesting that external accountability and household stability positively influence repayment behavior.

---

# 🎯 Executive Summary

## Top Risk Drivers Ranked by Predictive Strength

| Rank | Risk Factor            | Key Finding                                  |
| ---- | ---------------------- | -------------------------------------------- |
| 🥇 1 | Loan-to-Income Ratio   | 18.03% default rate for loans >2.5× income   |
| 🥈 2 | Interest Rate          | Defaults rise from 7.06% to 17.82%           |
| 🥉 3 | Employment Status      | Unemployment drives highest demographic risk |
| 4    | Debt-to-Income Ratio   | Accounts for 64% of all defaults             |
| 5    | Accountability Factors | Co-signers, marriage, dependents reduce risk |
| 6    | Education Level        | Moderate inverse relationship with risk      |
| 7    | Credit Score           | Weak predictor in this portfolio             |

## Recommended Risk Mitigation Strategy

1. **Implement stricter controls on Loan-to-Income ratios**, particularly above the 2.5× threshold.
2. **Review high-interest lending policies**, as elevated rates appear to increase repayment stress.
3. **Introduce enhanced monitoring for unemployed borrowers and high-DTI segments.**
4. **Encourage co-signers for borderline applicants.**
5. **Incorporate social stability indicators** as supplementary underwriting features.
6. **Reduce reliance on credit score alone** and adopt a more holistic risk assessment framework.

---

**Portfolio Baseline Default Rate:** **11.61%**

**Primary Risk Driver Identified:** **Loan-to-Income Leverage Ratio**

**Highest Risk Segment:** Borrowers with loans exceeding **2.5× annual income** (18.03% default rate).
