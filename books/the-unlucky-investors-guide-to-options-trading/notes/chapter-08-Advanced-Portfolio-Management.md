# Chapter 8 — Advanced Portfolio Management
## The Unlucky Investor's Guide to Options Trading

---

## 1. Concept Summary

Chapter 8 introduces two **supplemental** optimization techniques that build on the *necessary* framework from Chapter 7. The chapter explicitly frames itself as optional enhancement for more active traders — not foundational requirements.

**The two techniques:**
1. **Advanced diversification** — Diversifying not just by underlying (Chapter 7) but also across contract duration (time) and strategy type (defined vs. undefined risk)
2. **POP-weighted capital allocation** — Sizing positions proportionally using a formula derived from the Kelly Criterion, so higher-POP trades receive more buying power

The chapter then demonstrates both techniques by constructing a six-ETF strangle portfolio and backtesting it against equal-weight strangles and a passive SPY equity portfolio (2018–2019). The POP-weighted portfolio achieves nearly **half the P/L variability** and **half the worst-case loss** of the SPY equity portfolio with comparable average returns.

**Key framing:** The Kelly-derived POP weighting is a good **initializer** for portfolio construction — it tells you how to open positions. For ongoing dynamic management (rebalancing as positions age, Greeks drift, or markets move), the portfolio Greeks and rebalancing protocol from Chapter 7 remain the primary tool.

---

## 2. Key Equations

### Equation 8.1 — Kelly-Derived Capital Allocation Fraction

$$f = r \cdot \frac{DTE}{365} \cdot \frac{POP}{1 - POP}$$

Where:
- **f** = fraction of portfolio buying power to allocate to this position
- **r** = annualized risk-free rate (approximated at 3% throughout the chapter; use long-term bond rate as a conservative estimate)
- **DTE** = days to expiration of the contract
- **POP** = probability of profit of the strategy (use historical POP or the platform's theoretical POP)

**What it means:** The fraction of capital you should bet on a trade scales with:
1. The risk-free rate (your opportunity cost)
2. How long your capital is tied up (DTE/365)
3. The odds in your favor (POP / (1 − POP), the Kelly core ratio)

**Worked examples (Table 8.2, 45-DTE strangles, 2011–2018 data, r = 3%):**

| Underlying | POP | POP/(1−POP) | f = 0.03 × (45/365) × ratio |
|---|---|---|---|
| SPY Strangle | 79% | 79/21 = 3.762 | 0.03 × 0.1233 × 3.762 ≈ **1.4%** |
| QQQ Strangle | 73% | 73/27 = 2.704 | 0.03 × 0.1233 × 2.704 ≈ **1.0%** |
| GLD Strangle | 84% | 84/16 = 5.25 | 0.03 × 0.1233 × 5.25 ≈ **1.9%** |

**Why the outputs are small:** The risk-free rate r ≈ 3% is low. These percentages are conservative by design — treat them as **proportional weights** (ratios), not literal position sizes. Scale them up to the Chapter 7 per-trade caps (7% max for undefined risk).

---

### Normalization and Scaling (Heuristic)

**Step 1 — Normalize to ratios:**
Divide all Kelly fractions by the largest value. If GLD = 1.9% is the largest, set GLD ratio = 1.0, then:
- SPY ratio = 1.4 / 1.9 = 0.74
- QQQ ratio = 1.0 / 1.9 = 0.53
- GLD ratio = 1.9 / 1.9 = 1.0

**Step 2 — Scale to the 7% cap:**
Multiply each ratio by 7% (the undefined risk per-trade cap):
- SPY/QQQ combined: 0.74 × 7% = **5.2%**
- GLD: 1.0 × 7% = **7.0%**

**Step 3 — Adjust for correlation (SPY and QQQ are correlated at 0.88):**
SPY and QQQ share the 5.2% combined allocation. Split it by their individual Kelly weight proportions:
- SPY share: 1.4 / (1.4 + 1.0) = 58% → 58% × 5.2% = **3.0%**
- QQQ share: 1.0 / (1.4 + 1.0) = 42% → 42% × 5.2% = **2.2%**

---

## 3. Three Axes of Diversification

### Axis 1 — Underlying (from Chapter 7 — most essential)
Diversify across assets with low or inverse price correlation. Covered fully in Chapter 7; referenced here as the foundation.

### Axis 2 — Time Diversification
**What it is:** Holding positions at different stages of their contract lives simultaneously — some freshly opened (45 DTE), others mid-life (30 DTE), others near expiry (10 DTE).

**Why it works:** P/L volatility (daily P/L standard deviation) changes throughout a contract's life, increasing as expiration approaches. Positions at different DTE respond differently to the same market event, reducing portfolio-level P/L correlation.

**Figure 8.1 shows this:** Daily P/L standard deviation vs. days held for 15/30/45/60 DTE strangles all show increasing volatility as expiration approaches, but the shape and peak timing differ across durations.

**Implementation:** Trade consistent DTE (always 45 DTE) but stagger opening dates so contracts expire on different calendar dates. This preserves occurrence count without sacrificing time diversification.

**Caveat:** Operationally difficult to maintain consistently — the author notes this and does not cover it in depth.

### Axis 3 — Strategy Diversification
**What it is:** Mixing defined-risk (iron condors) and undefined-risk (strangles) strategies on the same or highly correlated underlyings.

**Why it works:** Iron condors cap maximum loss at (spread width − net credit) × 100; strangles have higher profit potential but unlimited tail risk. Combining both captures directional premium decay while protecting a fraction of capital from outlier events.

**Key caveat:** Defined and undefined risk strategies reach P/L targets at different rates — a simple 50/50 split is not necessarily optimal, and each leg may require different management timing (Chapter 6 rules applied separately).

---

## 4. Figures Explained

### Figure 8.1 — P/L Swing Comparison Throughout Duration (2005–2021)

Four panels showing daily P/L standard deviation ($) vs. days held for 16Δ SPY strangles at different durations.

| Panel | Duration | Pattern |
|---|---|---|
| (a) | 15 DTE | Starts ~$50, peaks ~$155–160 around day 10–12, drops to ~$100 at expiration |
| (b) | 30 DTE | Starts ~$50, climbs steeply to ~$190–195 near day 25–28, drops sharply at expiration |
| (c) | 45 DTE | Starts ~$50, flat ($100–130) through days 5–30, rises to ~$190 around day 40, drops to ~$50 at expiration |
| (d) | 60 DTE | Starts ~$50, modest fluctuation ($50–$80) through day 20, rises to ~$175 around day 50, drops to ~$60 at expiration |

**Author's conclusion:** All durations show increasing P/L volatility as expiration approaches, but the timing and shape of that increase differs. Contracts at different DTE are therefore not perfectly correlated in their P/L behavior, making time diversification statistically meaningful.

---

### Figure 8.2 — Strategy Cumulative P/L Comparison (2005–2021)

Three portfolios on SPY, all 16Δ, ~45 DTE, same open/close dates, held to expiration, one trade per cycle:
- **Strangle portfolio:** 10 SPY strangles (undefined risk)
- **Combined portfolio:** 5 SPY strangles + 5 SPY iron condors (10Δ long strikes)
- **Iron condor portfolio:** 10 SPY iron condors

| Portfolio | By 2020 peak | 2020 sell-off trough | Worst-case drawdown |
|---|---|---|---|
| Strangle | ~$40,000–$48,000 | ~–$30,000 | **–$77,520** |
| Combined | ~$28,000–$30,000 | ~–$15,000 | **–$45,080** |
| Iron condor | ~$8,000–$10,000 | ~–$4,500 | **–$12,640** |

**Author's critical nuance:** The cumulative drawdown as a *percentage of portfolio capital* was approximately **the same (~150%) across all three** — the strangle portfolio had simply accumulated much more capital by 2020, so its absolute dollar loss was larger. Strategy diversification reduces raw dollar drawdowns, not necessarily percentage drawdowns.

---

### Figure 8.3 — Portfolio Performance Comparison (2018–2019)

Three portfolios, all starting at $200,000 initial capital, all allocating 30% to positions, backtested 2018–2019:
- **30% SPY Equity** — buying SPY shares, opened first of month, closed end of month
- **30% Equal-Weight Strangle** — six ETFs (SPY, QQQ, GLD, TLT, FXE, XLU), equal allocation per underlying
- **30% POP-Weighted Strangle** — same six ETFs, allocation by Equation 8.1 ratios scaled to 7% cap

| Portfolio | POP | Avg P/L | Std Dev | Worst Loss |
|---|---|---|---|---|
| SPY Equity | 60% | $285 | $2,879 | –$6,319 |
| Equal-Weight | 67% | $26 | $2,440 | –$6,117 |
| POP-Weighted | 67% | $268 | **$1,610** | **–$3,561** |

**Key findings:**
- POP-weighted portfolio achieves **comparable avg P/L** to equity ($268 vs. $285) while cutting std dev by **44%** ($1,610 vs. $2,879)
- POP-weighted worst loss is **44% smaller** than equity (–$3,561 vs. –$6,319)
- Equal-weight strangles underperform in avg P/L ($26) — equal allocation ignores that not all underlyings offer the same statistical edge
- **Visual:** POP-weighted portfolio shows the smoothest, most consistent equity curve with the fewest dramatic dips

**Three simplifications in this backtest (explicitly stated):**
1. Constant 30% allocation regardless of VIX (no IV scaling) — isolates diversification effects
2. ETF strangles only — no stock underlyings (no earnings/dividend events)
3. Opened first of month, closed end of month — no dynamic profit-target management

---

## 5. All Tables (Complete Data)

### Table 8.1 — Strategy Diversification Backtest (2005–2020)

| Portfolio | POP | Avg P/L | Std Dev | CVaR (5%) | Worst Drawdown (2020 Sell-Off) |
|---|---|---|---|---|---|
| Strangle (10 SPY) | 76% | $379 | $1,803 | –$5,174 | **–$77,520** |
| Combined (5+5 SPY) | 75% | $221 | $1,275 | –$3,648 | **–$45,080** |
| Iron Condor (10 SPY) | 67% | $64 | $799 | –$2,324 | **–$12,640** |

**Reading this table:**
- Moving from strangles → combined → iron condors reduces CVaR and std dev monotonically, but also reduces POP and avg P/L
- Combined portfolio splits the difference on every metric
- The ~150% percentage drawdown equivalence across all three reveals that iron condors primarily reduce *absolute* dollar losses, not proportional capital risk

---

### Table 8.2 — Kelly Allocation for Three ETF Strangles (2011–2018 data)

| Underlying | POP (2011–2018) | Kelly Allocation (f) |
|---|---|---|
| SPY Strangle | 79% | 1.4% |
| QQQ Strangle | 73% | 1.0% |
| GLD Strangle | 84% | 1.9% |

*(r = 3%, DTE = 45 for all)*

---

### Table 8.3 — Correlation Matrix: Six ETFs (2011–2018)

| | SPY | QQQ | GLD | TLT | FXE | XLU |
|---|---|---|---|---|---|---|
| SPY | 1.00 | **0.88** | –0.02 | **–0.44** | 0.16 | 0.49 |
| QQQ | 0.88 | 1.00 | –0.03 | –0.36 | 0.12 | 0.35 |
| GLD | –0.02 | –0.03 | 1.00 | 0.19 | 0.34 | 0.08 |
| TLT | –0.44 | –0.36 | 0.19 | 1.00 | –0.03 | –0.04 |
| FXE | 0.16 | 0.12 | 0.34 | –0.03 | 1.00 | 0.18 |
| XLU | 0.49 | 0.35 | 0.08 | –0.04 | 0.18 | 1.00 |

**Category labels:**
- **Market ETFs:** SPY, QQQ (correlation 0.88 — treated as one correlated group)
- **Diversifying ETFs:** GLD, TLT, FXE, XLU

**Key observations:**
- TLT is the strongest inverse-equity hedge (–0.44 with SPY)
- GLD is near-zero correlated with market ETFs (–0.02, –0.03)
- FXE (Euro currency) has low correlation to equities (0.16) and slight positive correlation to GLD (0.34)
- XLU (utilities) has moderate positive correlation to SPY (0.49) — not fully independent, but lower than QQQ's 0.88
- GLD and FXE share some correlation (0.34) — a consideration for splitting allocations between them

---

### Table 8.4 — Six-ETF Portfolio Construction (Full Allocation Math)

**Step 1 — Kelly allocations (2011–2018 data, r = 3%, DTE = 45):**

| Underlying | POP | Kelly f |
|---|---|---|
| SPY | 79% | 1.4% |
| QQQ | 73% | 1.0% |
| GLD | 84% | **1.9%** (highest) |
| TLT | 78% | 1.3% |
| FXE | 83% | 1.8% |
| XLU | 81% | 1.6% |

**Step 2 — Normalize ratios (divide by GLD's 1.9%):**

| Group | Allocation Ratio |
|---|---|
| SPY/QQQ (combined, correlated) | 0.74 |
| GLD | 1.00 |
| TLT | 0.68 |
| FXE | 0.95 |
| XLU | 0.84 |

**Step 3 — Scale to 7% cap:**

| Group | Portfolio Weight |
|---|---|
| SPY/QQQ combined | 0.74 × 7% = **5.2%** |
| GLD | 1.00 × 7% = **7.0%** |
| TLT | 0.68 × 7% = **4.8%** |
| FXE | 0.95 × 7% = **6.7%** |
| XLU | 0.84 × 7% = **5.9%** |

**Step 4 — Split SPY/QQQ by Kelly proportions:**

| Underlying | Adjusted Portfolio Weight |
|---|---|
| SPY | 1.4/(1.4+1.0) × 5.2% = 58% × 5.2% = **3.0%** |
| QQQ | 1.0/(1.4+1.0) × 5.2% = 42% × 5.2% = **2.2%** |
| GLD | **7.0%** |
| TLT | **4.8%** |
| FXE | **6.7%** |
| XLU | **5.9%** |
| **Total** | **3.0 + 2.2 + 7.0 + 4.8 + 6.7 + 5.9 = 29.6% ≈ 30%** |

---

### Table 8.5 — Sample Portfolio Backtest Results (2018–2019)

| Portfolio | POP | Avg P/L | Std Dev | Worst Loss |
|---|---|---|---|---|
| SPY Equity (30%) | 60% | $285 | $2,879 | –$6,319 |
| Equal-Weight Strangles (30%) | 67% | $26 | $2,440 | –$6,117 |
| POP-Weighted Strangles (30%) | 67% | $268 | **$1,610** | **–$3,561** |

---

## 6. The Correlation Adjustment Rule (Complete Logic)

The Kelly formula (Equation 8.1) assumes trades are **independent**. When underlyings are correlated, the assumption breaks down — giving both a full independent allocation would double-count a single correlated risk.

| Correlation Level | Rule |
|---|---|
| High (e.g., SPY–QQQ at 0.88) | Share one combined allocation = max of their individual Kelly fractions; split by Kelly proportion ratios |
| Near-zero (e.g., SPY–GLD at –0.02) | Each receives its own independent allocation |
| Partial (e.g., SPY–XLU at 0.49) | Treat conservatively: use the larger individual fraction as a lower bound; split proportionally |

**Why correlated positions must share:** If SPY and QQQ each got their own 5.2% allocation, you'd have 10.4% deployed in what is essentially one correlated risk factor. The combined allocation caps this at 5.2%, then splits it between the two underlyings by their relative POP quality.

---

## 7. Strategy Diversification Decision Guide

| If your goal is… | Use this strategy mix |
|---|---|
| Maximum profit potential, comfortable with large drawdowns | 100% strangles (undefined risk) |
| Balanced profit and drawdown protection | ~50/50 strangles + iron condors |
| Minimum absolute dollar drawdown, accept lower profit | 100% iron condors (defined risk) |

**Important:** The percentage drawdown is approximately the same across all three during tail events. Strategy diversification shrinks the dollar magnitude of losses, not the proportional capital impact.

---

## 8. Connections to Prior Chapters

### Chapter 7 — Capital Allocation and Portfolio Greeks
Chapter 7's per-trade caps (7% undefined, 5% defined) serve as the hard constraints that limit how far Kelly scaling can go. Chapter 7's portfolio Greek framework (bD neutrality, theta ratio 0.05–0.1%) remains the primary tool for *dynamic* management — Chapter 8's POP weighting only initializes the portfolio.

### Chapter 6 — Managing Trades
Strategy diversification (mixing strangles and iron condors) creates a management complexity: each strategy type reaches P/L targets at different rates and requires different management rules. Chapter 6's per-strategy management framework (21 DTE or 50% profit target) must be applied separately to each leg.

### Chapter 5 — Constructing a Trade
The 16Δ, 45-DTE parameters throughout all Chapter 8 backtests are drawn directly from Chapter 5's empirically validated sweet spots. Chapter 8 accepts those parameters as fixed and focuses purely on portfolio-level sizing.

### Chapter 4 — Buying Power Reduction
The total portfolio buying power allocation (30% in the sample portfolio) and per-trade caps (7%) are expressed in BPR terms. The POP-weighting in Table 8.4 yields a total of ~29.6%, consistent with the Chapter 3/7 guideline of 25–50%.

### Chapter 2 — Implied Volatility
The backtest deliberately holds IV scaling constant (fixed 30% allocation regardless of VIX). The author notes that adding IV-based allocation scaling on top of POP weighting would further improve real-world performance beyond what Figure 8.3 shows — pointing back to Chapter 3's dynamic allocation rules.

### Chapter 1 — Kelly Criterion (Appendix)
The Kelly Criterion formula is presented here but derived in the appendix. The core insight — allocate more capital to higher-probability events proportionally — is the same principle as expected value maximization introduced in Chapter 1.

---

## 9. Key Takeaways

1. **Chapter 8 is supplemental** — The necessary guidelines are in Chapter 7; these techniques are enhancements for active traders
2. **Underlying diversification (Chapter 7) remains primary** — Time and strategy diversification reduce P/L correlation further but are secondary
3. **Strategy diversification (strangles + iron condors)** reduces absolute dollar drawdowns but *not* proportional capital drawdowns — the percentage at risk is approximately the same (~150%) across all strategy mixes during tail events
4. **Kelly Equation 8.1 gives conservative absolute fractions** — Use the output as proportional weights, then scale up to the 7% per-trade cap; the POP/(1−POP) ratio is the key heuristic
5. **Correlated underlyings share one allocation** — SPY and QQQ (0.88 correlation) cannot each receive an independent Kelly budget; combine, then split by proportional Kelly weights
6. **POP-weighted six-ETF portfolio outperforms both equal-weight strangles and SPY equity** on risk-adjusted metrics: comparable avg P/L ($268 vs. $285), 44% lower std dev ($1,610 vs. $2,879), 44% smaller worst loss (–$3,561 vs. –$6,319)
7. **POP weighting is an initializer, not a dynamic rebalancer** — For ongoing management as positions age, Greeks drift, or market conditions change, use Chapter 7's portfolio Greek framework

---

## 10. New Glossary Terms (Chapter 8)

| Term | Definition |
|------|------------|
| Time diversification | Holding options contracts at different stages of their life simultaneously, reducing P/L correlation caused by differing gamma/theta sensitivities |
| Strategy diversification | Mixing defined-risk (iron condors) and undefined-risk (strangles) strategies on the same or correlated underlyings |
| Kelly Criterion | Mathematical framework for optimal bet sizing: allocate proportionally to the probability of winning relative to losing; adapted to options via Equation 8.1 |
| POP-weighted allocation | Position sizing method where each underlying's buying power share is proportional to its Kelly fraction derived from historical POP |
| Allocation ratio | Kelly fractions normalized so the largest equals 1.0, used to derive proportional portfolio weights before scaling to per-trade caps |
| Adjusted portfolio weight | Final per-underlying BPR allocation after normalizing, scaling, and splitting correlated pairs by Kelly proportion |
| FXE | Euro currency ETF; near-zero correlation to U.S. equity ETFs (0.16 with SPY); used as a diversifying ETF in sample portfolio |
| XLU | Utilities sector ETF; moderate positive correlation to SPY (0.49) but meaningfully lower than QQQ (0.88); used as a diversifying ETF in sample portfolio |
