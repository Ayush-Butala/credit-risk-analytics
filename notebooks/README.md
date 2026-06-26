## 🤖 Phase 2: Python Risk Modeling & Policy Simulation

### 📌 Why This Phase Matters

The SQL phase provided a macro-level view of portfolio risk, revealing that high Debt-to-Income (DTI) ratios and elevated interest rates were strongly associated with loan defaults.

However, SQL alone cannot evaluate complex interactions between multiple risk factors or simulate the financial consequences of policy changes. To address these limitations, Python was used to:

- Analyze multi-factor risk interactions.
- Stress-test existing lending policies.
- Quantify the financial impact of alternative underwriting strategies.

---

### 🛠️ Feature Engineering: Creating Leverage Tiers

Continuous debt-related variables were transformed into categorical risk groups using Pandas to improve interpretability and enable segmented analysis.

#### Leverage Categories

- Low Leverage
- Medium Leverage
- High Leverage (> 2.5× Income)

This feature served as a key risk indicator throughout the analysis.

---

### 🔍 Discovering the "Toxic Collision"

Single-variable analysis can mask significant risk patterns. By examining combinations of borrower characteristics, a high-risk segment emerged:

**Unemployed + High Leverage Borrowers**

This group exhibited an alarming:

**Default Rate: 23.26%**

This rate is approximately double the overall portfolio default rate, identifying a major structural weakness in the lending portfolio.

---

### 🛡️ Stress-Testing the Co-Signer Policy

The institution's existing underwriting strategy assumes that requiring a co-signer reduces default risk for high-risk borrowers.

To evaluate this assumption, the Toxic Collision segment was isolated and analyzed separately.

| Scenario          | Default Rate |
| ----------------- | ------------ |
| Without Co-Signer | 23.26%       |
| With Co-Signer    | 18.91%       |

#### Key Finding

Although co-signers reduced default rates by approximately **4.35 percentage points**, the resulting risk level remained significantly above acceptable thresholds.

**Conclusion:** The co-signer policy provides limited protection because it does not address the underlying problem of insufficient income relative to debt obligations.

---

### 🧮 Policy Simulation & Financial Impact Analysis

Rather than simply identifying risk, a custom Python simulation engine was developed to evaluate a targeted underwriting policy.

#### Proposed Rule

Automatically reject loan applications belonging to the:

**Unemployed + High Leverage** segment.

The simulation measures both:

- **Capital Saved** by avoiding future defaults.
- **Interest Revenue Lost** from borrowers who would have repaid successfully.

---

### 📊 Simulation Results

```text
==================================================
     PORTFOLIO OPTIMIZATION SIMULATION REPORT
==================================================

Total Applications Blocked: 17,650
Actual Defaults Avoided:    3,717

Gross Capital Saved:        $683,048,393.00
Interest Revenue Lost:      $248,828,509.40

--------------------------------------------------

NET FINANCIAL IMPACT TO BANK:
+$434,219,883.60

==================================================
```

---

### 💡 Business Insight

Implementing the proposed policy would reject 17,650 applicants, including many borrowers who would have successfully repaid their loans.

However, the financial damage caused by defaulted loans significantly outweighs the interest revenue generated from performing loans.

#### Financial Outcome

| Metric                | Value               |
| --------------------- | ------------------- |
| Capital Protected     | $683.05 Million     |
| Interest Revenue Lost | $248.83 Million     |
| Net Financial Gain    | **$434.22 Million** |

The simulation demonstrates that targeted risk-based underwriting can substantially improve portfolio profitability while reducing credit exposure.

---

### 🚀 Technical Stack

**Data Engineering**

- Pandas
- NumPy

**Visualization & Statistical Analysis**

- Matplotlib
- Seaborn
- Correlation Heatmaps
- Multi-Panel Facet Grids

**Data Export & BI Integration**

- `DataFrame.to_csv(index=False)`
- Power BI-ready data pipeline

---

### 🎯 Key Takeaway

This phase moved beyond descriptive analytics and into decision-focused risk modeling. By combining feature engineering, multi-factor risk analysis, and financial simulation, the project identified a hidden high-risk borrower segment and demonstrated that a targeted underwriting rule could generate an estimated:

## +$434.22 Million Net Financial Benefit

while simultaneously reducing overall portfolio risk.
