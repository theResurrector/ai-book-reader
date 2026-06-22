# Chapter 3: Trading Short Premium

## Concept Summary

This chapter introduces **short premium trading**—the practice of selling options to capture decay and volatility mispricing. The core thesis mirrors the "casino owner" analogy: just as casinos profit consistently by hosting games with a statistical edge (while occasionally paying out large jackpots), short options sellers profit frequently by collecting premium, but face rare, catastrophic tail losses when markets move violently.

The chapter develops four key areas:
1. **Why short premium works**: IV typically overstates realized moves, creating a statistical edge
2. **The strangle as the working example**: A delta-neutral position (short OTM call + short OTM put) that profits if price stays in expected range
3. **Risk quantification**: How to measure tail risk using skewness and CVaR, not just standard deviation
4. **Position and portfolio management**: Sizing positions and allocating capital based on current IV environment to survive extremes

---

## Key Equations

### (3.1) IV Percentile (IVP)

$$\text{IVP} = \frac{\text{Number of days in past year with IV below current IV}}{252}$$

**Interpretation**: Normalizes raw IV to a 0–100% scale, allowing fair comparison across different assets with different baseline volatilities.

**Worked Example** (from Figure 3.4):
- SPY end of 2015: VIX = 18, IVP = 74%
  - This means IV was **below 18** on 74% of trading days in the past year
  - Conclusion: current VIX of 18 is **elevated** relative to recent history
  
- AMZN end of 2015: IV = 37, IVP = 67%
  - AMZN IV of 37 is **below** its typical level (it's the 67th percentile)
  - Conclusion: AMZN is **less elevated** than SPY despite a higher raw IV number

---

### (3.2) IV Rank (IVR)

$$\text{IVR} = \frac{\text{Current IV} - \text{Min. IV over past year}}{\text{Max. IV over past year} - \text{Min. IV over past year}}$$

**Interpretation**: Similar to IVP but uses the range (max–min) instead of percentile rank. Ranges 0–100%.

**Comparison**:
- IVP is more robust to outlier spikes (doesn't care about absolute max/min)
- IVR is more sensitive to recent extremes (weights current high/low heavily)

---

## Figures Explained

### **Figure 3.1: SPY Expected Move Cone (IV = 12%)**

SPY price history with 45-day expected move cone showing 1σ range (±4.2% = $302–$328 from $315 spot). Illustrates how IV translates to expected price range used to set strangle strikes.

### **Figure 3.2: Historical P/L Distribution for 16Δ SPY Strangle (2005–2021)**

Three histograms showing P/L:
- **(a)** % of initial credit
- **(b)** Dollar amounts
- **(c)** Zoomed: **81% profitable, 19% losses**

Long-term average: **$44 per trade (28% of initial credit)**. Tail risk: losses up to –4,000% possible.

**Key insight**: Even though theory predicts 68% POP, historical SPY strangles hit 81%—because IV typically overstates realized moves.

### **Figure 3.3: Standard Deviation Does NOT Capture Tail Risk**

Histogram with statistics:
- Mean = $44
- Std Dev = $614
- ±1σ range accounts for **77.2%** of outcomes (not 68%)

Standard deviation **overestimates** likely losses and **underestimates** tail risk for right-skewed distributions.

### **Figure 3.4: IV Indexes – VIX vs. VXAZN (2015–2016)**

Shows VIX (solid, 12–28 range) vs. VXAZN (dashed, 20–52 range). Demonstrates:
- Raw IV is incomparable across assets
- SPY IVP = 74%, AMZN IVP = 67% at similar percentiles despite vastly different raw numbers

### **Figure 3.5: SPY IV and Strangle Initial Credits (2010–2020)**

Average prices for 45 DTE 16Δ strangles at different VIX levels:
- **VIX 10–20**: Avg credit ≈ **$168**
- **VIX 20–30**: Avg credit ≈ **$206** (+22%)
- **VIX 30–40**: Avg credit ≈ **$239** (+42%)

Higher IV = higher premiums, but high IV opportunities rare.

### **Figure 3.6: Extreme Losses (–$1,000+) from 16Δ SPY Strangles**

Two panels: (a) all losses 2005–2021, (b) zoomed 2008 recession.

**Key insight**: Extreme losses occur when **expected move was tight (low IV) but actual move was huge**. In 2008, strangle sellers opened expecting ±$13 move (12% IV) but market moved ±$100 (30+ IV), wiping out small credits.

### **Figure 3.7: P/L Distribution by VIX Regime**

Four histograms stratified by VIX level when trade opened:

| VIX Range | Occurrences | Skew | Mean | CVaR(5%) |
|---|---|---|---|---|
| 0–15 | 1,603 | –12.4 | $20 | –$1,364 |
| 15–25 | 1,506 | –9.06 | $7 | –$1,927 |
| 25–35 | 416 | –2.75 | $159 | –$981 |
| >35 | 228 | –1.48 | $255 | –$775 |

**Counterintuitive finding**: **High IV reduces tail risk** because expected ranges widen; actual moves fit more comfortably inside expected range. When IV is low, expected move is tight; even normal swings breach strikes.

### **Figure 3.8: Full Historical P/L Distribution (Long-Term Average)**

Histogram of all ~3,750 trades (2005–2021):
- Mean = $44
- Std Dev = $614
- Tail extends to –$4,000+ and +$1,000+

Over very long period, traders average $44/trade. Any single trade is highly uncertain.

### **Figure 3.9: Portfolio Convergence (Number of Trades)**

Scatter showing average P/L for portfolios of N randomly selected trades:
- **N=10**: Range –$900 to +$200
- **N=100**: Range –$100 to +$150
- **N=200+**: Tightly converges around $44
- **N=1,000**: Nearly all within $20–$70

**Implication**: Minimum ~200 trades needed for reliable convergence to long-term average.

### **Figure 3.10: Portfolio Allocation Strategies (2017–2021)**

Three allocation schemes tracked through 2020 crash:
- **IV-Allocated (25–50%)**: Outperforms; survives crash with 70% value; recovers fastest
- **Constant 15%**: Conservative, survives crash (70% value) but limited upside
- **Constant 65%**: Aggressive, decimated in crash (~0%), months to recover

**Key takeaway**: Dynamic scaling according to IV environment outperforms fixed allocation.

---

## Tables Explained

### **Table 3.1: CVaR Comparison – Two Strangle Examples**

| Risk Factor | Strangle A | Strangle B |
|---|---|---|
| Skew | –5.0 | –1.0 |
| CVaR (5%) | –$200 | –$2,000 |

Strangle A is "uglier" (more skewed) but safer in dollar terms. Strangle B looks normal but is a tail-risk bomb.

### **Table 3.2: VIX Distribution (2005–2021)**

| VIX Range | % of Days |
|---|---|
| 0–15 | 43% |
| 15–25 | 40% |
| 25–35 | 11% |
| 35+ | 6% |

**83% of time** VIX is below 25 (low volatility). Only 17% elevated, 6% crisis. Must trade profitably in low IV or accept few high-IV opportunities.

### **Table 3.3: POP and Avg P/L by VIX Range**

| VIX Range | POP | Avg P/L |
|---|---|---|
| 0–15 | 82% | $20 |
| 15–25 | 78% | $7 |
| 25–35 | 86% | $159 |
| 35+ | 89% | $255 |

POP and profit per trade both improve dramatically with IV. High IV trades are superior on both dimensions.

### **Table 3.4: Portfolio Allocation Guidelines by VIX**

| VIX Range | Max Allocation |
|---|---|
| 0–15 | 25% |
| 15–20 | 30% |
| 20–30 | 35% |
| 30–40 | 40% |
| 40+ | 50% |

**Allocate more when IV high** (lower tail risk per dollar); **allocate less when IV low** (higher tail risk per dollar).

### **Table 3.5: Held-to-Expiration vs. Early Management (21 DTE Close)**

| Metric | Held to Expiration | Managed at 21 DTE |
|---|---|---|
| POP | 81% | 79% |
| Avg P/L | $44 | $30 |
| Avg Daily P/L | $1.29 | $1.60 |
| Std Dev of P/L | $614 | $260 |
| CVaR (5%) | –$1,535 | –$695 |

Even though per-trade profit is lower ($30 vs. $44), daily profit is higher ($1.60 vs. $1.29) due to faster capital turnover. Early management halves tail risk.

---

## Connections to Previous Chapters

### **From Chapter 1 (Math & Finance)**

- **Normal Distribution & Skewness**: Short option P/L distributions are **negatively skewed** (left tail of losses). Figure 3.7 shows skewness ranging from –12.4 (low IV) to –1.48 (high IV, nearly symmetric).
- **Standard Deviation Limitations**: ±1σ accounts for 77.2% of outcomes (not 68%), and tail risk beyond 1σ is disproportionately large. **CVaR** introduced as better tail risk metric for non-normal distributions.
- **Expected Value & Law of Large Numbers**: Long-term edge ($44/trade) realized only across thousands of trials. High variance requires many occurrences.

### **From Chapter 2 (Implied Volatility)**

- **IV Overstatement**: Chapter 2 found IV overstates realized volatility 87% of the time. Chapter 3 **exploits** this: 81% historical win rate vs. 68% theoretical POP proves IV overstates moves.
- **IV States**: Lulls (70%, lowest profit); Expansions (10%, create losses if IV was low); Contractions (20%, profitable if IV was high).
- **IV Percentile & Ranking**: IVP and IVR (Eqs 3.1–3.2) contextualize raw IV numbers across assets.
- **Expected Move Cone**: Directly applied to set strangle strikes at ±1σ boundaries.

### **Greeks Applied**

- **Delta-Neutral**: Strangle is delta-neutral (–0.16 call delta + 0.16 put delta ≈ 0). No directional bet; only sensitivity to magnitude (IV, gamma).
- **Positive Theta**: Strangles held 45 DTE earn ~$1.29/day in time decay (Table 3.5).
- **Gamma Risk**: Late in duration, gamma increases volatility of daily P/L. Early management (21 DTE) cuts gamma, reducing std dev from $614 to $260.

### **New Concepts**

- **Number of Occurrences**: Minimum ~200 trades required for reliable convergence to μ = $44 (Figure 3.9). Law of large numbers: variance of sample mean = σ²/N.
- **Dynamic Portfolio Allocation**: Scale allocation (25–50%) based on current IV environment (Table 3.4), not historical volatility. **IV-Allocated strategy** (Figure 3.10) outperformed fixed allocations through 2020 crash.
- **CVaR vs. VaR**: VaR insufficient for skewed distributions. CVaR measures average loss in tail scenarios, more informative for options risk.

---

## Takeaways

1. **Consistent Edge, Fragile Execution**: Short premium has a long-term statistical advantage (81% POP vs. 68% theory), but catastrophic tail losses require small position sizes and discipline.

2. **High IV Paradoxically Reduces Tail Risk**: When IV is high, expected move cones are wide; actual swings fit inside expectations. When IV is low, expected range is tight; normal swings breach strikes. Trade high IV for both higher POP AND lower tail risk.

3. **Number of Occurrences is Critical**: Average P/L of $44/trade meaningless without ~200+ trades. Small portfolios (10 trades) could average –$900 to +$200 due to variance. Scale required for edge to manifest.

4. **Dynamic Allocation Outperforms Fixed**: Scaling capital allocation to current IV (25% at VIX 0–15, 50% at VIX 40+) survives crashes and capitalizes on high-IV opportunities. IV-allocated strategy outperformed conservative and aggressive fixed allocations through 2017–2021.

5. **Active Management Improves Daily Profit**: Closing positions at 21 DTE (midway) reduces tail risk (CVaR –$695 vs. –$1,535) and increases daily profit ($1.60 vs. $1.29), even though per-trade profit is lower. Faster turnover = more occurrences per year.
