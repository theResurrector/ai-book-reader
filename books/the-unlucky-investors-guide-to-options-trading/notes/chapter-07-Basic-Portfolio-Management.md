# Chapter 7 — Basic Portfolio Management
## The Unlucky Investor's Guide to Options Trading

---

## 1. Concept Summary

Chapter 7 establishes the **necessary** guidelines for managing a short premium options portfolio. The chapter is organized around three pillars:

1. **Capital allocation and position sizing** — How much to allocate to short premium, how to divide it between core and supplemental positions, and per-trade caps
2. **Diversification** — Why uncorrelated underlyings are the most powerful tool for reducing compounding tail losses, backed by correlation matrices and conditional probability data
3. **Maintaining portfolio Greeks** — How to use beta-weighted delta (bD) and the theta ratio to keep the portfolio directionally neutral and earning at the right rate

The chapter explicitly distinguishes itself from Chapter 8 (Advanced Portfolio Management), which covers supplementary optimization techniques. Everything here is *necessary*, not optional.

A key framing distinction: **core positions** (high-POP, ETF underlyings, reliable returns) form the majority of the portfolio, while **supplemental positions** (stock underlyings, higher risk/reward, earnings trades) are limited to at most 25% of short premium capital.

---

## 2. Key Equations

### Beta-Weighted Delta (bD)

Beta-weighted delta adjusts raw option delta so that it represents the expected change in an option's price given a **$1 change in a reference index (e.g., SPY)** rather than a $1 change in the specific underlying. This makes delta additive across an entire multi-underlying portfolio.

**Why raw delta can't be added across underlyings:** A $1 move in SPY is not the same event as a $1 move in AAPL. Adding their deltas would be like adding inches and ounces — the units don't match.

**Formula:**

$$\text{bD} = \Delta_{\text{option}} \times \beta_{\text{underlying}}$$

*(applied per position, then summed across all portfolio positions)*

**What it measures:** The portfolio's net directional exposure to the overall market. A bD-neutral portfolio profits from IV changes and time decay rather than market direction.

---

### Theta Ratio

$$\text{Theta Ratio} = \frac{\theta_{\text{portfolio}}}{\text{Net Portfolio Liquidity}}$$

**What it measures:** Expected daily profit per dollar of capital deployed. Theta is additive across all positions (unlike delta, which requires beta-weighting, theta's units — $/day — are identical across all options).

**Target range:** 0.05% to 0.1% of net portfolio liquidity per day

**Hard ceiling:** Do not exceed 0.2% — an excessively high theta ratio signals hidden gamma risk

**Benchmark from Table 7.8:** A passively invested 25%-allocated SPY portfolio earns ~0.013% per day. Short premium theta must significantly exceed this to justify tail risk.

**Worked example:** On a $100,000 portfolio with 25% allocation ($25,000 in short premium):
- Passive SPY benchmark: $100,000 × 0.013% = **$13/day**
- Target short premium theta: $100,000 × 0.05% = **$50/day** (minimum)
- Target short premium theta: $100,000 × 0.1% = **$100/day** (upper target)
- Hard ceiling: $100,000 × 0.2% = **$200/day** (above this, reduce positions)

---

### Conditional Probability of Compounding Outlier Losses

$$P(\text{QQQ loss} \mid \text{SPY loss}) = \frac{P(\text{SPY loss AND QQQ loss})}{P(\text{SPY loss})} = \frac{3.9\%}{5.8\%} \approx 67\%$$

**What this means:** When a SPY strangle suffers an outlier loss (>200% of initial credit), there is a 67% chance a QQQ strangle suffers one simultaneously — because SPY and QQQ have a 0.89 correlation.

**Independent event benchmark:** If SPY and QQQ strangles were completely uncorrelated:
$$5.8\% \times 8.7\% \approx 0.50\%$$
The actual observed simultaneous loss rate (3.9%) is roughly **8× higher** than independence would predict, entirely driven by correlation.

**GLD comparison:** P(GLD loss | SPY loss) = 2.1% / 5.8% ≈ **36%** — substantially lower because SPY and GLD have near-zero correlation (–0.03 to –0.13).

---

## 3. Figures Explained

### Figure 7.1 — Portfolio A (Diversified) vs. Portfolio B (Non-Diversified): 2020–2021

**Setup:** Both portfolios start at $100,000 in January 2020.
- **Portfolio A (solid line):** 40% market ETFs, 50% low-volatility assets (GLD, TLT), 10% high-volatility stocks
- **Portfolio B (dashed line):** 50% market ETFs, 0% low-volatility assets, 50% high-volatility stocks

**X-axis:** Monthly dates, January 2020 – January 2021
**Y-axis:** Portfolio Value ($), ~$80,000 to ~$150,000+

**Key events and readings:**

| Event | Portfolio A | Portfolio B |
|---|---|---|
| Start (Jan 2020) | $100,000 | $100,000 |
| COVID trough (Mar 2020) | ~$86,000 (–14%) | ~$80,000 (–25%) |
| End of period (Jan 2021) | ~$130,000 (+30%) | ~$150,000+ (+50%) |

**Author's conclusions:**
1. **Diversification reduced drawdown depth** — Portfolio A fell only ~14% in the COVID crash vs. ~25% for Portfolio B
2. **Diversification capped upside** — Portfolio B recovered faster and ended ~20% higher than Portfolio A
3. Portfolio B was nearly **twice as volatile** as Portfolio A throughout 2020
4. The correlations in Table 7.3 (measured 2015–2020) **underestimate** what correlations would be during 2020 crashes — correlations strengthen during market stress, meaning diversification benefits are overstated in calm-market data

**Key insight:** Diversification is not about maximizing returns — it is about making drawdowns survivable so you don't abandon your strategy during the worst moments.

---

## 4. All Tables (Complete Data)

### Table 7.1 — Core vs. Supplemental Position Statistics
**45-DTE 16Δ Strangles, 2011–2020, held to expiration**
*(Note: Does not account for IV or stock-specific factors like earnings or dividends)*

| Category | Underlying | POP | Avg Profit | Avg Loss | CVaR (5%) |
|---|---|---|---|---|---|
| **Core** | SLV | 84% | $32 | –$88 | –$201 |
| **Core** | QQQ | 74% | $109 | –$183 | –$454 |
| **Core** | SPY | 80% | $162 | –$320 | –$800 |
| **Core** | GLD | 81% | $119 | –$456 | –$1,100 |
| **Supplemental** | AAPL | 74% | $425 | –$1,443 | –$4,771 |
| **Supplemental** | GOOGL | 80% | $1,174 | –$2,955 | –$6,593 |
| **Supplemental** | AMZN | 77% | $1,235 | –$2,513 | –$6,810 |

**Reading this table:**
- Core ETF positions have modest average profits ($32–$162) but small average losses ($88–$456) and manageable CVaR ($201–$1,100)
- Supplemental stock positions have large average profits ($425–$1,235) but catastrophic average losses ($1,443–$2,955) and extreme CVaR ($4,771–$6,810)
- GOOGL and AMZN average profits are 7–8× higher than SPY — but average losses are also 9× higher
- **GLD note:** GLD's CVaR (–$1,100) exceeds SPY's (–$800) despite being a core position; GLD's value lies in its low correlation to equities (Table 7.7), not its individual risk profile

---

### Table 7.2 — Two Sample Portfolios
**Portfolio allocation by asset category**
*(Weights determined intuitively, not by quantitative methodology)*

| Asset Category | Portfolio A | Portfolio B |
|---|---|---|
| Market ETFs (SPY, QQQ) | 40% | 50% |
| Low Volatility Assets (GLD, TLT) | 50% | 0% |
| High Volatility Assets (AMZN, AAPL) | 10% | 50% |

**What this shows:** Portfolio A is defensive and diversified; Portfolio B concentrates in market and high-volatility exposure. Both are compared in Figure 7.1.

---

### Table 7.3 — 5-Year Price Correlation Matrix (2015–2020)

| | SPY | QQQ | GLD | TLT | AMZN | AAPL |
|---|---|---|---|---|---|---|
| SPY | 1.00 | **0.89** | –0.13 | –0.33 | 0.62 | 0.64 |
| QQQ | 0.89 | 1.00 | –0.12 | –0.26 | **0.75** | **0.74** |
| GLD | –0.13 | –0.12 | 1.00 | 0.39 | –0.12 | –0.11 |
| TLT | –0.33 | –0.26 | 0.39 | 1.00 | –0.18 | –0.22 |
| AMZN | 0.62 | 0.75 | –0.12 | –0.18 | 1.00 | 0.50 |
| AAPL | 0.64 | 0.74 | –0.11 | –0.22 | 0.50 | 1.00 |

**Reading this table:**
- SPY–QQQ (0.89): extremely high correlation — nearly the same underlying in terms of short premium risk
- SPY/QQQ–GLD (–0.13 to –0.12): near-zero, slight inverse — GLD moves independently of equities
- SPY/QQQ–TLT (–0.33 to –0.26): moderate inverse — bonds tend to rise when equities fall (flight to safety)
- AMZN/AAPL–SPY/QQQ (0.62–0.75): significant positive correlation — tech stocks move with broad market, limiting diversification benefit relative to ETFs
- **Warning:** These 2015–2020 correlations understate crisis-period correlations. During 2020, all equity-correlated assets dropped simultaneously.

---

### Table 7.4 — Equity Price and IV Index Correlation (2011–2020)

| | SPY | QQQ | VIX | VXN |
|---|---|---|---|---|
| SPY | 1.00 | 0.89 | **–0.80** | — |
| QQQ | 0.89 | 1.00 | — | **–0.76** |
| VIX | –0.80 | — | 1.00 | **0.89** |
| VXN | — | –0.76 | 0.89 | 1.00 |

**Reading this table:**
- VIX is strongly inversely correlated with SPY (–0.80): market falls → fear spikes → IV expands (Chapter 2 established this)
- VXN (QQQ's IV index) mirrors VIX almost perfectly (0.89 correlation): SPY and QQQ IV environments are nearly identical
- This explains why SPY and QQQ strangles compound so reliably — they share not just price direction but also IV environment

---

### Table 7.5 — Simultaneous Outlier Loss Probability: SPY vs. QQQ (2011–2020)
**Threshold: loss worse than 200% of initial credit**

| | SPY Strangle | QQQ Strangle |
|---|---|---|
| SPY Strangle | **5.8%** | 3.9% |
| QQQ Strangle | 3.9% | **8.7%** |

- Diagonal: individual outlier loss probability
- Off-diagonal: probability of both incurring outlier losses simultaneously
- P(both) = 3.9%; P(QQQ loss | SPY loss) = 3.9% / 5.8% = **67%**

---

### Table 7.6 — Price Correlation: SPY, QQQ, GLD, TLT (2011–2020)

| | SPY | QQQ | GLD | TLT |
|---|---|---|---|---|
| SPY | 1.00 | 0.89 | **–0.03** | **–0.41** |
| QQQ | 0.89 | 1.00 | –0.04 | –0.34 |
| GLD | –0.03 | –0.04 | 1.00 | 0.23 |
| TLT | –0.41 | –0.34 | 0.23 | 1.00 |

**Comparison to Table 7.3:** GLD's correlation to SPY is even lower in the 2011–2020 window (–0.03) than in the 2015–2020 window (–0.13). TLT's inverse correlation to SPY is stronger (–0.41) than in the 2015–2020 window (–0.33) — TLT is the stronger equity hedge.

---

### Table 7.7 — Simultaneous Outlier Loss Probability: SPY, QQQ, GLD, TLT (2011–2020)
**Threshold: loss worse than 200% of initial credit**

| | SPY | QQQ | GLD | TLT |
|---|---|---|---|---|
| SPY | **5.8%** | 3.9% | 2.1% | 1.9% |
| QQQ | 3.9% | **8.7%** | 1.9% | 1.7% |
| GLD | 2.1% | 1.9% | **12%** | 4.8% |
| TLT | 1.9% | 1.7% | 4.8% | **12%** |

**Reading this table:**
- GLD individual outlier rate: 12% — **the highest of any asset shown** (more volatile in isolation)
- But SPY + GLD compound probability: only 2.1% (vs. 3.9% for SPY + QQQ) — GLD's diversification value is its low correlation with equities, not its individual stability
- TLT compound probability with SPY: 1.9% — the lowest pairing shown, because TLT is inversely correlated with equities (–0.41)
- **Key insight:** An asset's individual outlier rate and its diversification value are different things. GLD has high individual risk but low systemic compounding risk relative to equities.

---

### Table 7.8 — Passive SPY Daily P/L Benchmark (2011–2021)
**$100,000 initial capital**

| SPY Allocation | Daily Portfolio P/L |
|---|---|
| 25% | 0.013% |
| 30% | 0.015% |
| 35% | 0.017% |
| 40% | 0.020% |
| 50% | 0.025% |

**In dollar terms (at $100,000 portfolio):**

| SPY Allocation | Daily $ Earnings |
|---|---|
| 25% | $13/day |
| 50% | $25/day |

The short premium portfolio's theta must **significantly exceed** these benchmarks to justify the tail risk of short options vs. passive investing.

---

## 5. Capital Allocation Framework

### Total Portfolio Allocation

| VIX Level | Short Premium Allocation |
|---|---|
| Low VIX (<15) | 25% of total buying power |
| Moderate VIX | ~35–40% |
| High VIX (>30+) | Up to 50% of total buying power |
| Remainder | Cash or passive investment (e.g., SPY) |

*(VIX-dependent scaling first introduced in Chapter 3)*

### Within Short Premium Capital

| Strategy Type | Allocation | Max Per-Trade |
|---|---|---|
| Undefined risk (strangles) | At least 75% of short premium capital | 7% per position |
| Defined risk (iron condors, spreads) | At most 25% of short premium capital | 5% per position |
| Supplemental (stock underlyings) | At most 25% of short premium capital | — |

### Core vs. Supplemental

| | Core Positions | Supplemental Positions |
|---|---|---|
| Underlying type | ETFs (SPY, QQQ, GLD, TLT) | Stocks (AAPL, GOOGL, AMZN) |
| POP | High (74–84%) | Moderate (74–80%) |
| Avg profit | Modest ($32–$162) | Large ($425–$1,235) |
| Avg loss | Moderate ($88–$456) | Severe ($1,443–$2,955) |
| CVaR | Manageable ($201–$1,100) | Extreme ($4,771–$6,810) |
| Purpose | Consistent, reliable portfolio growth | Higher profit potential, market engagement |
| Examples | 45-DTE 16Δ SPY strangle; 45-DTE 16Δ QQQ iron condor (6Δ wings) | 45-DTE 16Δ AAPL strangle; earnings trades (Chapter 9) |

---

## 6. Diversification Framework

### Two Types of Risk

| Risk Type | Definition | Reducible? |
|---|---|---|
| Idiosyncratic | Specific to individual asset or sector | Yes — through diversification |
| Systemic | Inherent to overall market | No — cannot be diversified away |

### Why Options Diversification Differs from Equity Diversification
Options have three P/L drivers (directional movement, IV changes, time decay) vs. equities' primary driver of direction. This means options are inherently more diversified relative to each other than the equivalent equity positions — but the underlying correlation still dominates during tail events.

### Diversification Priority Order (options portfolios)
1. **Underlying diversification** — Primary; most essential for outlier risk control
2. **Strategy diversification** — Secondary; mixing undefined and defined risk structures
3. **Duration diversification** — Tertiary; mixing DTE windows

### Conditional Probability Summary: Why Low Correlation Matters

| Pair | Underlying Correlation | Conditional P(loss given SPY loss) |
|---|---|---|
| SPY + QQQ | 0.89 | **67%** |
| SPY + GLD | –0.03 | **36%** |
| SPY + TLT | –0.41 | **33%** (2.1% ÷ 5.8% ≈ 36%; TLT is ~1.9%/5.8% ≈ 33%) |

Even with TLT (the strongest inverse correlation at –0.41), compounding still happens 33% of the time — which is why small position sizes (5–7%) remain essential regardless of diversification.

---

## 7. Portfolio Greek Management

### Beta-Weighted Delta (bD)

**Goal:** Maintain bD ≈ 0 (delta neutral relative to the market index)

**Why neutrality matters:**
- A bD-neutral portfolio earns through IV and theta, not market direction
- Directional bets add unpredictable risk and undermine the statistical edge of premium selling

**How individual position deltas drift:**
- As the underlying price moves, option deltas change (gamma effect)
- Over time, positions that started delta-neutral become directionally skewed
- The portfolio's net bD must be monitored and periodically rebalanced

**Rebalancing tools:**
- Re-center existing positions (close and reopen at new delta)
- Close the skewed position entirely
- Add a new position that offsets the directional bias

---

### Theta and the Theta Ratio

**Theta is additive** — unlike delta (which requires beta-weighting), theta's units ($/day) are identical across all options. Simply sum theta across all portfolio positions.

**Theta ratio = theta / net portfolio liquidity**

| Theta Ratio | Interpretation | Action |
|---|---|---|
| < 0.05% | Below target — insufficient daily earnings vs. tail risk | Add positions / convert defined → undefined risk |
| 0.05%–0.1% | Target range — healthy | Maintain |
| 0.1%–0.2% | Elevated but acceptable | Monitor gamma exposure |
| > 0.2% | Dangerous — hidden gamma risk accumulating | Reduce positions / widen strikes |

---

### Gamma and the Theta Ratio Connection

**Gamma** measures how much an option's delta changes per $1 move in the underlying.

- **High gamma = unstable delta** — Small moves in the underlying cause large delta changes, making positions behave unpredictably
- **Gamma cannot be beta-weighted** (unlike delta) — making direct gamma management across a multi-underlying portfolio impractical
- **Gamma and theta are positively correlated** — positions with large positive theta also carry large positive gamma. This is the structural linkage used in the theta ratio ceiling: if theta ratio > 0.2%, gamma risk is implicitly too high

**Highest gamma positions (most dangerous):**
- ATM options (gamma peaks at-the-money)
- Options near expiration (gamma spikes in final days — established in Chapter 5)

---

### Portfolio Adjustment Decision Framework

**Scenario 1: bD neutral, theta ratio too low (< 0.05%)**
- Replace defined risk trades with undefined risk trades
- Roll undefined risk positions to higher deltas
- Add new delta-neutral short premium positions (strangles, iron condors)
- Consider underlyings with higher IV (IV and theta are highly correlated)

**Scenario 2: Theta ratio in target range (0.05%–0.1%) but bD skewed**
- If bD too positive (bullish bias): add negative bD positions
  - Short calls on positive-beta underlyings (SPY, QQQ, AAPL)
  - Short puts on negative-beta underlyings (TLT, GLD)
- If bD too negative (bearish bias): add positive bD positions
  - Short puts on positive-beta underlyings
  - Short calls on negative-beta underlyings

**Scenario 3: Theta ratio too high (> 0.2%)**
- Re-center/widen existing positions (move strikes further OTM → reduces theta and gamma)
- Remove short premium positions outright
- If bD positive: remove positive bD positions first (short puts on positive-beta underlyings)
- If bD negative: remove negative bD positions first (short calls on positive-beta underlyings)

---

## 8. Connections to Prior Chapters

### Chapter 1 — Beta
Beta-weighted delta is the Chapter 7 application of beta introduced in Chapter 1. Beta measures a stock's directional sensitivity to the market; multiplying option delta by underlying beta converts position-level delta into market-index-equivalent delta, enabling portfolio-level directional management.

### Chapter 2 — Implied Volatility
Table 7.4 shows VIX and VXN are strongly inversely correlated with their underlying indices (–0.80 and –0.76). This is the quantitative confirmation of Chapter 2's core insight: market falls drive IV expansion. The near-identical VIX/VXN correlation (0.89) explains why SPY and QQQ strangles compound losses so reliably — they share both a price direction relationship and an IV environment.

### Chapter 3 — Capital Allocation and Position Sizing
The 25%–50% short premium allocation rule and per-trade position size caps (7% undefined, 5% defined) were first introduced in Chapter 3. Chapter 7 restates and extends them with the core/supplemental framework, adding the 25% cap on supplemental positions.

### Chapter 4 — Buying Power Reduction (BPR)
BPR is the denominator of position sizing — the 7% and 5% per-trade caps are expressed as percentages of portfolio buying power, which is occupied by BPR. High-IV environments reduce BPR per position, allowing more simultaneous positions within the same allocation (established in Chapter 4).

### Chapter 5 — Constructing a Trade
The specific position examples in Chapter 7 (45-DTE 16Δ strangles, 45-DTE 16Δ iron condors with 6Δ wings) are drawn directly from Chapter 5's trade construction framework. Chapter 7 is Chapter 5's output applied to portfolio-level decisions.

### Chapter 6 — Managing Trades
Chapter 6 established management rules for individual trades. Chapter 7 adds the portfolio dimension: what happens when multiple managed positions interact? Correlation and conditional probability explain why good individual management does not automatically produce good portfolio outcomes during systemic stress events.

### Chapter 1 — Expected Value and Law of Large Numbers
The position size caps (5–7%) are the practical application of law of large numbers reasoning: by capping any single position, no individual outlier can destroy the portfolio before the statistical edge has time to manifest across many occurrences.

---

## 9. Key Takeaways

1. **Short premium allocation: 25–50% of portfolio, VIX-scaled** — remainder in cash or passive investment
2. **75/25 split within short premium: undefined/defined risk** with per-trade caps of 7% and 5% respectively
3. **Core positions (ETF underlyings) form the majority; supplemental positions (stocks) capped at 25%** — stocks have 3–8× larger average losses and CVaR than ETFs despite comparable POP
4. **Underlying diversification is the single most important portfolio tool** — uncorrelated underlyings (GLD, TLT) dramatically reduce the conditional probability of compounding outlier losses vs. correlated pairs (SPY+QQQ at 67% vs. SPY+TLT at ~33%)
5. **An asset's individual outlier rate and its portfolio diversification value are different things** — GLD has a 12% individual outlier rate but only a 2.1% simultaneous loss rate with SPY; TLT has even lower compounding rates due to its inverse equity correlation
6. **Correlations strengthen during crashes** — calm-period correlation matrices understate crisis-period diversification failure; always account for this when sizing positions
7. **Maintain bD ≈ 0** — beta-weighted delta neutrality ensures profit comes from IV and theta, not directional market bets
8. **Target theta ratio: 0.05%–0.1% of net liquidity per day** — must significantly exceed the passive SPY benchmark of 0.013–0.025%; hard ceiling at 0.2% to cap hidden gamma risk
9. **Gamma cannot be beta-weighted** — the theta ratio ceiling is the practical proxy for managing gamma risk across a multi-underlying portfolio
10. **Small position sizes (5–7%) remain essential even with diversification** — diversification reduces but does not eliminate compounding outlier losses; position sizing is the last line of defense

---

## 10. New Glossary Terms (Chapter 7)

| Term | Definition |
|------|------------|
| Core position | High-POP, ETF-underlying short premium trade forming the reliable base of portfolio returns |
| Supplemental position | Higher-risk, stock-underlying or earnings-based trade; at most 25% of short premium capital |
| Idiosyncratic risk | Risk specific to an individual asset or sector; reducible through diversification |
| Systemic risk | Risk inherent to the overall market; cannot be diversified away |
| Beta-weighted delta (bD) | Delta adjusted by the underlying's beta to express directional exposure in units of a market index ($1 SPY move) |
| bD neutral | Portfolio state where net beta-weighted delta ≈ 0; profit driven by IV changes and time decay |
| Theta ratio | Portfolio theta ÷ net portfolio liquidity; measures expected daily profit per dollar of capital; target 0.05%–0.1%, ceiling 0.2% |
| Re-centering | Closing and reopening a position at a new delta to restore directional neutrality |
| Compounding outlier loss | Simultaneous outlier losses across multiple correlated positions |
| Conditional probability | Probability of event B given event A has occurred: P(B|A) = P(A∩B) / P(A) |
| Net portfolio liquidity | Total liquid value of the portfolio; denominator for theta ratio |
| VXN | The implied volatility index for the QQQ / Nasdaq 100 (analog to VIX for S&P 500) |
