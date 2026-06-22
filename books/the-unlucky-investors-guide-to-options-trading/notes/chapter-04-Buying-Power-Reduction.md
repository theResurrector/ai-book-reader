# Chapter 4: Buying Power Reduction

## 1. Concept Summary

**Buying Power Reduction (BPR)** is the amount of capital a broker reserves to cover potential losses from short option positions. Unlike stock margin (borrowed money), BPR is your own capital held out of play for the duration of the trade—it does not accrue interest, and it cannot be borrowed against.

This chapter bridges theory (Chapters 1–3 on math, volatility, and premium decay) to practice: short premium trading requires significant tail-risk protection. BPR provides a practical metric to quantify worst-case loss on a trade-by-trade basis and to determine how many short positions fit within a portfolio's buying power limits.

**Why it matters:**
- For long options, BPR is simply the option cost (maximum loss is known).
- For short options, maximum loss is theoretically unlimited, so brokers mandate a reserve to guard against large adverse moves.
- BPR directly constrains how many trades can be opened simultaneously, making it essential for risk and capital allocation.

---

## 2. Key Equations

### **Equation 4.1: Short Put BPR**

$$\text{Short Put BPR} = \max\left(\left((0.2 \times S) - (S - K)\right) \times 100, \quad (0.1 \times K) \times 100, \quad 250 - P \times 100\right)$$

**Variables:**
- $S$ = spot price (current underlying price)
- $K$ = strike price of the put
- $P$ = put premium (market price of the put)

**What it computes:**
The formula takes the maximum of three values representing different loss scenarios:
1. **Loss from 20% move:** $((0.2 \times S) - (S - K)) \times 100$ — Expected loss from a 20% downside move in the underlying, minus any intrinsic value already at risk
2. **10% strike breach:** $(0.1 \times K) \times 100$ — Loss from a 10% drop below the strike
3. **Floor for cheap options:** $250 - P \times 100$ — Ensures minimum BPR even for very low-premium contracts

**Worked Example (from Table 4.1, Scenario A):**
- Stock Price $S = \$150$
- Put Strike $K = \$140$
- Put Price $P = \$1$

$$\text{Value 1: } ((0.2 \times 150) - (150 - 140)) \times 100 = (30 - 10) \times 100 = \$2,000$$
$$\text{Value 2: } (0.1 \times 140) \times 100 = 14 \times 100 = \$1,400$$
$$\text{Value 3: } (250 - 1) \times 100 = \$24,900$$

$$\text{BPR} = \max(2000, 1400, 24900) = \$2,000$$

The 20% move scenario dominates, and BPR is set at $2,000.

---

### **Equation 4.2: Short Call BPR**

$$\text{Short Call BPR} = \max\left(\left((0.2 \times S) - (K - S)\right) \times 100, \quad (0.1 \times K) \times 100, \quad 250 - C \times 100\right)$$

**Variables:**
- $S$ = spot price
- $K$ = strike price of the call
- $C$ = call premium

**What it computes:**
Mirrors the put formula but for upside losses:
1. Loss from a 20% upside move beyond the strike
2. Loss from a 10% strike breach to the upside
3. Floor for cheap calls

**Worked Example (from Table 4.1, Scenario A):**
- Stock Price $S = \$150$
- Call Strike $K = \$160$
- Call Price $C = \$1$

$$\text{Value 1: } ((0.2 \times 150) - (160 - 150)) \times 100 = (30 - 10) \times 100 = \$2,000$$
$$\text{Value 2: } (0.1 \times 160) \times 100 = 16 \times 100 = \$1,600$$

$$\text{BPR} = \max(2000, 1600, ...) = \$2,000$$

---

### **Equation 4.3: Short Strangle BPR**

$$\text{Short Strangle BPR} = \max(\text{Put BPR}, \text{Call BPR})$$

**What it computes:**
The BPR required for a short strangle (short OTM call + short OTM put) is the larger of the two individual BPRs. Because the strangle contains both legs, the broker reserves capital for whichever leg faces the larger maximum loss.

**Worked Example (from Table 4.1, Scenario A):**
- Short $140 put: Put BPR = $2,000
- Short $160 call: Call BPR = $2,000

$$\text{Strangle BPR} = \max(2000, 2000) = \$2,000$$

**Worked Example (from Table 4.1, Scenario B — Higher IV):**
- Short $130 put: Put BPR = $1,500
- Short $175 call: Call BPR = $1,500

$$\text{Strangle BPR} = \max(1500, 1500) = \$1,500$$

Note: Higher IV and wider strikes reduce BPR because the probability-weighted maximum loss decreases.

---

### **Key Insight: BPR Multiplier Relationships**

From Table 4.1, comparing Scenarios A, B, and C:

**Scenario A:** $150 stock, $140/$160 16Δ strangle, 20% IV → BPR = $2,000  
**Scenario B:** $150 stock, $130/$175 16Δ strangle, 45% IV → BPR = $1,750 (**25% lower**)  
**Scenario C:** $300 stock, $280/$320 16Δ strangle, 20% IV → BPR = $4,000 (**100% higher**)

**Patterns:**
- **BPR rises linearly with underlying price:** When the underlying doubles (Scenario C), BPR doubles because the dollar magnitude of a 20% move scales proportionally.
- **BPR decreases exponentially as IV increases:** Higher IV causes strikes to spread wider OTM, which reduces the probability-weighted worst-case loss. The factor-of-2.5× increase in IV (20% → 45%) reduces BPR by only 12.5%, showing the exponential decay relationship.

This relationship directly incentivizes short premium selling when IV is highest—capital is freed up to take more positions precisely when premium is most expensive and risk-reward is most favorable.

---

## 3. Figures Explained

### **Figure 4.1: 16Δ SPY Strangle Losses (2005–2021)**

**Chart type:** Histogram  
**X-axis:** Per-trade loss as a percentage of BPR (range: −160% to 0%)  
**Y-axis:** Percentage of occurrences (0% to 45%)  
**Data source:** 164 SPY 16Δ strangle positions, 45 DTE, held to expiration, 2005–2021  

**Description:**
The histogram shows the distribution of realized losses across all trades. The x-axis represents loss magnitude scaled to the BPR reserved for that trade. At x = 0%, the loss was zero (the strangle expired worthless or was closed at a profit). At x = −20%, the loss consumed 20% of the reserved BPR. The left tail extends to −160%, representing losses that exceeded the initial BPR.

**Interpretation:**
- **Central concentration (0% to −20%):** Roughly 95% of all strangles lost between 0% and 20% of their BPR. This is the core purpose of BPR—to capture the most likely loss scenarios.
- **Right tail (x ≈ 0%):** The tallest bar is near 0%, indicating that the single most common outcome is expiration with minimal loss. This validates the Chapter 3 thesis that short premium is usually profitable.
- **Left tail (−20% to −160%):** Roughly 5% of strangles lost more than 20% of BPR. The most extreme losses approach −160%, meaning some trades lost 1.6× the reserved capital. These are the realized tail events that justify why BPR is set conservatively.

**Key finding:** BPR successfully captured 95% of realized losses, confirming that the broker's capital reservation formula is effective for SPY strangles but not perfect—5% of trades breach the reserve.

---

### **Figure 4.2(a): SPY Price vs. 16Δ Strangle BPR (2005–2021)**

**X-axis:** SPY Price ($), range ~$100 to ~$350  
**Y-axis:** Buying Power Reduction ($), range ~$1,000 to ~$6,000  
**Data:** Scatter plot of ~400+ individual 45-DTE strangle trades  

**Pattern:**
Strong positive linear relationship. BPR climbs steadily as SPY price increases:
- At SPY $100–150: BPR ≈ $1,000–$2,500
- At SPY $200–250: BPR ≈ $2,500–$4,000
- At SPY $300–350: BPR ≈ $4,500–$6,000

The relationship is approximately: **BPR ≈ 0.02 × SPY Price × 100** (or roughly 2% of underlying price in dollar terms, consistent with the 20% move scenario in Equations 4.1–4.2).

**Implication:**
Traders selling strangles on expensive underlyings require more capital per trade because a 20% move in dollar terms is larger. A 20% move on a $100 stock ($20) is smaller than a 20% move on a $300 stock ($60), so BPR scales accordingly.

---

### **Figure 4.2(b): VIX (Implied Volatility) vs. 16Δ Strangle BPR (2005–2021)**

**X-axis:** VIX (volatility index), range ~10 to ~80  
**Y-axis:** BPR ($), range ~$1,000 to ~$6,000  
**Data:** Scatter plot of the same ~400+ trades as panel (a)  

**Pattern:**
Strong negative exponential relationship. As VIX rises, BPR falls dramatically:
- At VIX 10–15: BPR ≈ $5,000–$6,000
- At VIX 20–30: BPR ≈ $2,000–$3,500
- At VIX 40–50: BPR ≈ $1,000–$1,500
- At VIX 60–80: BPR ≈ $800–$1,200

The decay is exponential, not linear: doubling VIX does not halve BPR, but reduces it roughly by a factor of $\sqrt{\text{VIX ratio}}$ (consistent with option pricing theory where dollar moves scale as $\sqrt{\text{IV}}$).

**Secondary feature (outliers):**
A cloud of points sits notably above the main trend line, especially at VIX > 40. These represent individual trades that incurred losses exceeding their reserved BPR—the tail events visible in Figure 4.1. The text notes that when VIX is very high, even the exponentially lower BPR can underestimate losses for rare extreme moves.

**Implication:**
When fear is priced into options (high VIX), BPR is lowest, allowing more simultaneous positions with the same capital. This creates a natural capital allocation rule: deploy more short premium when the market pays the most (high IV/VIX) and the capital requirement is lowest. The inverse, when fear subsides (low VIX), capital is consumed by wider reserves, forcing traders to size down.

---

## 4. Connections

### **Back to Earlier Chapters**

**Chapter 1 (Math and Finance Preliminaries):**
- The Greeks (Δ, Γ, θ) influence BPR indirectly through strike selection. Tighter ATM strangles carry higher Γ and thus higher loss potential on large moves, increasing BPR. Wider OTM strangles have lower Γ but higher Δ risk, affecting the strangle's loss profile.

**Chapter 2 (Volatility Trading and Implied Volatility):**
- Figure 4.2(b) is the practical payoff of Chapter 2's central thesis: IV reverts downward. When IV spikes to 40–60, BPR drops to $1,000–$1,500. Traders can open many low-BPR strangles. When IV reverts to baseline (15–20), BPR rises to $3,000–$5,000. The positions opened at high IV harvest the contraction at reduced capital cost.
- The inverse relationship (high IV → low BPR → more positions allowed) is the leverage mechanism that rewards premium sellers during volatility expansion phases.

**Chapter 3 (Trading Short Premium):**
- BPR is the institutional answer to Chapter 3's discussion of tail risk in short positions. Short premium has undefined maximum loss, and BPR operationalizes the risk management: reserve roughly 95% of probability-weighted losses (for SPY) to guard against the remaining 5% tail.
- The ~50% annual return on short premium (cited in Chapter 3) is calculated against the BPR'd capital, not total portfolio capital. This is crucial: a $2,000 BPR trade returning $100 profit is a 5% return on the $2,000 at risk, not on the full portfolio.

### **Forward to Later Chapters**

**Chapter 5 (Constructing a Trade):**
- BPR is the first hard constraint in position sizing. Any trade idea must fit within the portfolio's remaining BPR capacity.

**Chapter 6 (Managing Trades):**
- BPR can change as the underlying price moves (Figure 4.2a) or IV shifts (Figure 4.2b). Traders must monitor BPR usage and adjust or close positions if BPR climbs above portfolio tolerance.

**Chapter 7 & 8 (Portfolio Management):**
- Table 4.2 demonstrates portfolio construction via BPR:
  - **Scenario A (VIX > 40):** $100k portfolio, $50k allocation (50%), SPY 16Δ strangle BPR = $1,500 → max 33 strangles
  - **Scenario B (VIX < 15):** $100k portfolio, $25k allocation (25%), SPY 16Δ strangle BPR = $3,300 → max 7 strangles
  
  High-IV periods allow concentrated positions; low-IV periods require either stepping size or trading more uncorrelated underlyings to diversify the capital base.

### **Glossary Ties**

- **Margin (Stock) vs. BPR (Options):** Margin is borrowed money with interest; BPR is reserved equity with no interest. Short options cannot be bought on margin, hence BPR.
- **Tail Risk:** BPR quantifies tail risk. The 5% of strangles exceeding BPR in Figure 4.1 are realized tail events. Chapter 3 theorized them; Chapter 4 measures them.
- **Delta, Gamma, Theta:** These Greeks from Chapter 1 influence how BPR moves as underlying price and IV change. Γ dominates worst-case loss for large moves; θ contributes to daily P/L decay (Chapter 3).
- **Implied Volatility (IV):** The inverse relationship in Figure 4.2(b) is a cornerstone: IV is the market's perceived risk, priced into options. BPR uses IV to forecast worst-case loss. When IV is high, perceived risk is high, but options are expensive, reducing capital at risk.

### **Structural Role in the Book**

Chapters 1–3 established **theory and motivation:** volatility trading, premium decay, tail risk. Chapters 4–6 establish **mechanics and constraints:** BPR (capital), trade construction (execution), trade management (adjustment). Chapters 7–8 synthesize: portfolio allocation leveraging BPR across multiple underlyings and strategies.

BPR is the link between theory (Greeks, IV) and practice (position sizing, capital management).

---

## Summary

Chapter 4 converts the theoretical framework of Chapters 1–3 into a practical constraint: **capital reservation**. BPR scales linearly with underlying price and inverse-exponentially with IV, creating the economic incentive to sell premium when fear is priced highest and capital requirements are lowest. The chapter's empirical validation (Figure 4.1 showing 95% of SPY strangles fit within BPR; Figure 4.2 showing the strong price and IV relationships) builds confidence for the capital allocation strategies in the chapters ahead.

**Key takeaway:** Understanding BPR transitions the trader from "what could happen to my P/L" (theory) to "what capital do I need at risk" (practice), making it essential for all short premium trading.
