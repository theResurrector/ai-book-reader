# Chapter 5: Constructing a Trade

## 1. Concept Summary

**Core Idea:**
Chapter 5 is a practical manual for building an individual short premium trade. It presents a **6-step decision framework** to select parameters that produce a desired risk-reward profile:

1. Choose an **asset universe** (liquidity constraints)
2. Choose an **underlying** (stocks vs. ETFs)
3. Choose a **contract duration** (days to expiration)
4. Choose a **risk profile** (defined vs. undefined risk)
5. Choose a **directional assumption** (bullish, bearish, or neutral)
6. Choose a **delta** (perceived risk per share)

**Why It Matters:**
Chapters 1–4 established theory (Greeks, IV, premium decay, capital requirements). Chapter 5 bridges to **applied practice**: how do you actually _build_ a trade given these constraints? The chapter emphasizes that trade construction is **non-linear and interdependent**—each choice constrains the others. For example:
- If you want undefined risk, the underlying choice has constraints.
- If IV is low, BPR is high, which limits how many contracts fit portfolio allocation.
- Account size determines which underlyings and strategies are viable.

The chapter treats trade construction as a **personalized process** shaped by account size, profit goals, risk tolerance, and market conditions, not a mechanical formula.

---

## 2. Key Equations

### **Equation 5.1: Short Iron Condor BPR**

$$\text{Short Iron Condor BPR} = 100 \times \max(\text{Call Spread Width}, \text{Put Spread Width}) - 100 \times \text{Net Credit}$$

**Variables:**
- Call Spread Width = Long Call Strike − Short Call Strike (in dollars)
- Put Spread Width = Short Put Strike − Long Put Strike (in dollars)
- Net Credit = (Short Call Price + Short Put Price) − (Long Call Price + Long Put Price)
- 100 = number of shares per options contract

**What It Computes:**
The maximum loss (= BPR) for a short iron condor. This is the width of either the call or put spread (whichever is larger) minus the net credit received from opening the trade. Unlike a short strangle (undefined risk), the iron condor's maximum loss is defined and equals the spread width minus the credit.

**Worked Example (from Table 5.9 and 5.10):**
SPY iron condor with:
- Short call strike: $328, credit $122
- Short put strike: $302, credit $108
- Long call strike: $332, debit $69
- Long put strike: $298, debit $57
- Net credit: ($122 + $108) − ($69 + $57) = $230 − $126 = $104 (per share, or $1.04 × 100 = $104 total)

Call spread width: $332 − $328 = $4  
Put spread width: $302 − $298 = $4

$$\text{Max Loss} = 100 \times \max(4, 4) − 100 \times 1.04 = 400 − 104 = \$296$$

**Interpretation:**
The maximum loss is $296 per iron condor (one contract = 100 shares). If SPY rallies above $332 or falls below $298 at expiration, the loss is capped at $296. The width of the spread ($4 per side) is the loss buffer against the short strike; the credit ($1.04) reduces that buffer.

---

## 3. Figures Explained

### **Table 5.1: Liquidity Data for Equities (Feb 10, 2020)**

| Asset | Previous Closing Price | Bid-Ask Spread | Spread/Close (%) | Daily Trading Volume |
|-------|----------------------|----------------|------------------|----------------------|
| AMZN  | $3,322.94           | $0.32          | 0.01%            | 1,240,935           |
| IBM   | $121.98             | $0.05          | 0.04%            | 2,484,505           |
| SPY   | $390.51             | $0.02          | 0.005%           | 16,619,920          |
| TSLA  | $863.42             | $0.51          | 0.06%            | 9,371,760           |

**Description:**
Four examples of highly liquid equity underlyings and their liquidity metrics (underlying liquidity, not options liquidity). All have daily volumes >1M shares and bid-ask spreads <0.1% of closing price.

**Interpretation:**
- **SPY** has the tightest spread (0.005%) and highest volume (16.6M) → ideal for options trading
- **TSLA** has the widest spread (0.06%) → less ideal but still tradeable
- **Prerequisite:** Underlying liquidity is necessary but not sufficient. Options markets for these underlyings must also be liquid.
- **Why It Matters:** Liquid underlying → liquid options market → ability to enter/exit trades at fair prices → lower slippage.

---

### **Table 5.2: General Pros and Cons for Stock and ETF Underlyings**

| **Stocks** | | **ETFs** | |
|-----------|---|---------|---|
| **Pros** | **Cons** | **Pros** | **Cons** |
| Higher credits, higher profit potentials | Single-company risk factors | Inherently diversified | Limited selection compared to stocks |
| Frequent high IV conditions | Earnings and dividend risk | Lower BPRs, still highly liquid | High IV conditions less common |
| | Higher BPRs (more expensive) | | |

**Interpretation:**
- **Stocks** offer more premium (higher credit, higher profit potential) because they have company-specific volatility (earnings, product announcements, etc.). But this idiosyncratic risk means:
  - Higher BPR required (more capital per trade)
  - Unpredictable IV spikes (earnings dates inflate IV suddenly)
  - More P/L volatility
- **ETFs** are cheaper to trade (lower BPR) and inherently diversified. They experience:
  - Lower profits per trade
  - Less frequent high IV conditions
  - Smoother P/L (less tail risk)
- **Product Indifference Principle:** If two assets have the same IV, their options will have roughly the same price as a **percentage of underlying price**. So the choice is based on P/L tolerance and account size, not inherent superiority.

---

### **Table 5.3: Options P/L and Probability of Profit (POP) Statistics for 45 DTE 16Δ Strangles (2009–2020)**

| Underlying | Avg Profit | Avg Loss | POP |
|-----------|-----------|---------|-----|
| SPY       | $160      | –$297   | 82% |
| GLD       | $125      | –$424   | 83% |
| SLV       | $33       | –$103   | 81% |
| AAPL      | $431      | –$1,425 | 76% |
| GOOGL     | $1,108    | –$2,886 | 80% |
| AMZN      | $1,041    | –$2,215 | 78% |

**Description:**
Empirical performance of 45-day, 16Δ strangle positions (short put + short call, held to expiration) across different underlyings from 2009–2020.

**Interpretation:**
- **Stock underlyings (AAPL, GOOGL, AMZN):** 
  - Much higher average profits (~$400–$1,100)
  - Much larger average losses (~$1,400–$2,900)
  - P/L swings are 3–4× larger than ETF underlyings
  - Reasons: Single-stock volatility is higher; company-specific events create outlier moves
  
- **ETF underlyings (SPY, GLD, SLV):** 
  - Lower profits (~$30–$160)
  - Lower losses (~$100–$424)
  - Moderate P/L swings
  - Reason: Diversification smooths volatility
  
- **POP is consistent (76–83%):** The statistical edge of short premium holds across all underlyings.

**Conclusion:** Stock strangles are "riskier but more rewarding"; ETF strangles are "safer but less rewarding." The choice depends on account size and risk tolerance.

---

### **Table 5.4: Product Indifference Example**

| Option Parameters | Scenario A | Scenario B |
|-------------------|-----------|-----------|
| Stock Price       | $100      | $200      |
| IV                | 33%       | 33%       |
| 45 DTE 16Δ Put Price | $1      | $2        |

**Description:**
Two scenarios with identical IV but different underlying prices. The put price doubles when the underlying doubles, maintaining 1% of underlying price.

**Interpretation:**
- **Key Principle:** When IV is identical between two underlyings, option prices scale proportionally with underlying price.
- Therefore, a $100 stock strangle with $1 premium is equivalent in percentage terms to a $200 stock strangle with $2 premium.
- **Implication:** The choice of underlying is **not** about inherent superiority but about fit with account size, profit targets, and P/L swing tolerance.

---

### **Figure 5.1: Standard Deviation of Daily P/L Throughout Contract Duration (2005–2021)**

Four line charts showing how P/L volatility evolves over contract lifetime for 16Δ SPY strangles:

**(a) 15 DTE:**
- High variance early (days 1–7): ~$50–$180
- Peaks around day 5 at ~$180
- Sharp drop near expiration (days 13–15): ~$50–$100

**(b) 30 DTE:**
- Lower early variance (~$50–$100)
- Gradual rise to peak of ~$200 mid-contract
- Sharp drop near expiration

**(c) 45 DTE:**
- Moderate early variance (~$50–$100)
- Multiple peaks throughout (days 10–40), averaging ~$100–$180
- Drop near expiration

**(d) 60 DTE:**
- Lowest early variance (~$50–$75)
- Gentle rise and fall pattern throughout
- Peak ~$170 mid-duration

**What It Demonstrates:**
- **15 DTE:** Very volatile early because strikes are close to ATM (high gamma = high delta sensitivity). Volatility collapses near expiration due to rapid premium decay (high theta).
- **30+ DTE:** More manageable early volatility (strikes further from ATM, lower gamma). Longer window for trading adjustments.
- **Key Insight:** 
  - Short-term contracts (15 DTE) are "all-in" bets on premium decay with wild P/L swings early.
  - Longer-term contracts (30–60 DTE) provide smoother trading experience, more time to assess viability before P/L becomes volatile.
  - The sharp drop near expiration is theta decay: options lose extrinsic value rapidly as expiration approaches.

---

### **Table 5.5: Distance from ATM for 16Δ SPY Options (April 20, 2021)**

| Option Type | 15 DTE | 30 DTE | 45 DTE |
|------------|--------|--------|--------|
| Put Distance | 3.9%   | 6.5%   | 8.0%   |
| Call Distance | 2.4%  | 3.9%   | 4.9%   |

**Description:**
For the same 16Δ delta specification, put strikes are placed further OTM than call strikes (asymmetry due to put skew). Distance from ATM increases as DTE increases.

**Interpretation:**
- **Put Skew:** The market perceives downside risk as higher than upside risk. A 16Δ put is 3.9% OTM (for 15 DTE) but a 16Δ call is only 2.4% OTM. This reflects the "fear asymmetry" discussed in Ch 3.
- **DTE Effect:** As time increases, the 16Δ strikes move further from ATM (3.9% → 8.0% for puts). This is because the expected move cone (from Ch 2) widens with time.
- **Implication:** Shorter-dated strangles have strikes closer to the current price, meaning higher gamma and more P/L sensitivity to directional moves. Longer-dated strangles have wider strikes, lower gamma, and more stable P/L.

---

### **Table 5.6: Comparison of Defined and Undefined Risk Strategies**

| | **Undefined Risk** | **Defined Risk** |
|---|---|---|
| **Pros** | Higher POPs, Higher profit potentials | Limited downside risk, Lower BPRs |
| **Cons** | Unlimited downside risk, Higher BPRs (more expensive) | Lower POPs, Lower profit potentials, Can run into liquidity issues |

**Interpretation:**
- **Undefined Risk (Strangle):** 
  - Pros: Higher probability of profit, higher credit received, higher average profit potential.
  - Cons: Loss is theoretically unlimited if market makes an extreme move. Higher BPR required (more expensive to trade).
  
- **Defined Risk (Iron Condor, Vertical Spread):** 
  - Pros: Maximum loss is capped (known before entry), lower BPR (cheaper to trade).
  - Cons: Lower probability of profit, lower credit received, less profit per winning trade, possible liquidity issues if wings need to be unwound.

- **Key Distinction:** You **cannot** use BPR to compare risk between strategies with different profiles. A strangle's $5,000 BPR and a condor's $500 BPR do not mean the strangle is 10× riskier.

---

### **Table 5.7: Portfolio Allocation for Defined and Undefined Risk Strategies ($100k portfolio)**

| VIX Level | Max Portfolio Allocation | Min Undefined Risk Allocation | Max Defined Risk Allocation |
|-----------|-----------------------------|-----------------------|----------------------|
| 20        | $30,000                     | $22,500 (75% of allocated) | $7,500 (25% of allocated) |
| 40        | $50,000                     | $37,500 (75% of allocated) | $12,500 (25% of allocated) |

**Description:**
Recommended capital allocation at different VIX levels for a $100k portfolio, following the rule: at least 75% to undefined risk, at most 25% to defined risk.

**Interpretation:**
- **Low VIX (20):** Only 30% of portfolio ($30k) should be allocated. 75% of that ($22.5k) to undefined, 25% ($7.5k) to defined.
- **High VIX (40):** 50% of portfolio ($50k) can be allocated. Ratio stays 75/25.
- **Rationale (from Ch 4):** Low VIX → high BPR → fewer positions fit → lower capital allocation. High VIX → low BPR → more positions fit → higher allocation.
- **Risk Management:** Allocation is dynamic based on market conditions. In low IV environments, reduce leverage. In high IV, deploy more capital.

---

### **Table 5.8: Examples of Popular Short Options Strategies**

| Strategy | Composition | Defined/Undefined | Directional | POP |
|----------|-----------|---|---|---|
| Naked Put | Short put | Undefined | Bullish | 80% |
| Naked Call | Short call | Undefined | Bearish | 80% |
| Bull Call Spread | Short call + Long call | Defined | Bullish | 77% |
| Bear Put Spread | Short put + Long put | Defined | Bearish | 77% |
| Strangle | Short put + short call | Undefined | Neutral | 70% |
| Iron Condor | Short call spread + short put spread | Defined | Neutral | 60% |

**Description:**
Six common short premium strategies with their properties.

**Interpretation:**
- **Naked options (80% POP):** Directional bets, close to ATM, high gamma = risky but high probability of small profit.
- **Vertical spreads (77% POP):** Defined risk, directional, medium probability of medium profit.
- **Strangle (70% POP):** Neutral, undefined risk, higher profit potential but lower POP than naked options.
- **Iron Condor (60% POP):** Neutral, defined risk, safest profile but lowest POP and profit.
- **Pattern:** Higher POP = closer to ATM = higher risk. Lower POP = further OTM = lower risk but fewer winners.

---

### **Table 5.9: Example Iron Condor – SPY at $315, IV 12%**

| Contract Strikes | 16Δ Strangle | 16Δ Iron Condor with 10Δ Wings |
|---|---|---|
| Long Call Strike | --- | $332 |
| Short Call Strike | $328 | $328 |
| Short Put Strike | $302 | $302 |
| Long Put Strike | --- | $298 |

**Description:**
Concrete example of an iron condor overlaid with a wider strangle to highlight the difference.

**Interpretation:**
- **Short strikes** ($328 call, $302 put) are where the trade generates profit.
- **Long wings** ($332 call, $298 put) cap maximum loss.
- The wings are 10Δ (further OTM than the 16Δ short strikes), providing a $4 buffer on each side.

---

### **Figure 5.2: SPY Price with Iron Condor Strike Overlays (2019-07 to 2020-01)**

Chart showing:
- X-axis: Time from July 2019 to January 2020
- Y-axis: SPY Price ($280–$330)
- Grey shaded region: Expected move cone (±4.2% for 45 DTE)
- Horizontal lines: Long call ($332), short call ($328), short put ($302), long put ($298)
- Blue line: Actual SPY price path (volatile, ranging $285–$325)

**Interpretation:**
- **Expected move cone:** The shaded region represents the range where 68% of outcomes are expected (based on IV). The cone widens over time.
- **Strike positioning:** Short strikes at the edges of the expected cone; wings beyond it.
- **Trade outcome:** SPY stays within the short strike range most of the time, generating profit. On the rare occasion it breaches a wing, loss is capped.

---

### **Table 5.10: Credit Comparison – Strangle vs. Iron Condor**

| Contract Credit | 16Δ Strangle | 16Δ Iron Condor with 10Δ Wings |
|---|---|---|
| Long Call Debit | --- | –$69 |
| Short Call Credit | $122 | $122 |
| Short Put Credit | $108 | $108 |
| Long Put Debit | --- | –$57 |
| **Net Credit** | **$230** | **$104** |
| **Max Loss** | ∞ | $296 |
| **BPR** | $5,000 | $296 |

**Interpretation:**
- **Strangle:** $230 net credit (higher), no wings, undefined risk (max loss infinite), BPR $5,000.
- **Iron Condor:** $104 net credit (lower), wings cap loss at $296, BPR $296.
- **Capital Efficiency:** The condor costs only $296 BPR vs. the strangle's $5,000 BPR — roughly 1/17th the capital. But the condor only captures 45% of the strangle's $230 credit.
- **When to use:**
  - Strangles: When BPR is low (high IV) and capital is abundant.
  - Condors: When capital is constrained or IV is low and BPR is high.

---

### **Table 5.11: Iron Condor Statistics by Wing Width (2005–2021)**

| Statistics | 5Δ Wings | 10Δ Wings | 13Δ Wings | 16Δ Strangle (Reference) |
|---|---|---|---|---|
| POP | 79% | 75% | 73% | 81% |
| Avg P/L | $35 | $15 | $6 | $44 |
| Std Dev P/L | $251 | $132 | $74 | $614 |
| CVaR (5%) | –$771 | –$399 | –$220 | –$1,535 |

**Description:**
Performance statistics for iron condors with varying wing widths. Tighter wings = shorter OTM distance; wider wings = longer OTM distance.

**Interpretation:**
- **5Δ Wings (Tight):** 79% POP, avg profit $35, but std dev $251 and tail loss –$771. Frequent small wins, occasional large losses.
- **10Δ Wings (Medium):** 75% POP, avg profit $15, std dev $132, tail loss –$399. Balanced profile.
- **13Δ Wings (Wide):** 73% POP, avg profit $6, std dev $74, tail loss –$220. Consistent tiny wins, minimal losses.
- **Strangle (No Wings):** 81% POP, avg profit $44, std dev $614, tail loss –$1,535. Highest frequency of winners and highest profit per winner, but massive tail risk.

**Trade-off:** Tighter wings = more winners, higher volatility. Wider wings = fewer winners, lower volatility.

---

### **Table 5.12: BPR Comparison – Strangle vs. Iron Condor (2005–2021)**

| VIX Range | Strangle BPR | Iron Condor BPR (10Δ Wings) |
|-----------|-----------|---|
| 0–15 | $3,270 | $363 |
| 15–25 | $2,641 | $426 |
| 25–35 | $2,261 | $585 |
| 35–45 | $1,648 | $553 |
| 45+ | $1,445 | $615 |

**Description:**
Average BPR for strangles and iron condors across different IV environments.

**Interpretation:**
- **Strangles:** BPR decreases as IV increases ($3,270 at low IV → $1,445 at high IV). Reason (from Ch 4): higher IV → strikes spread wider OTM → lower worst-case loss.
- **Iron Condors:** BPR is relatively stable (~$300–$600) across IV ranges. Reason: the spread width (defined at trade entry) doesn't change with IV; only the strike positions adjust.
- **Capital Efficiency by Environment:**
  - At low IV (0–15): Condor is 9× cheaper than strangle ($363 vs. $3,270).
  - At high IV (45+): Strangle is only 2.35× more expensive than condor ($1,445 vs. $615).
- **Implication:** Low IV favors condors (both are viable, but condors preserve capital). High IV favors strangles (both are cheap, and strangles have higher POP and profit).

---

### **Figure 5.3: Expected Move Cone with Strike Skew (Dec 2019)**

Chart showing:
- X-axis: Time (5 months of price history)
- Y-axis: SPY Price ($290–$330)
- Grey cone: 45-day expected move (±4.2%)
- Horizontal lines:
  - Short call strike: $328 (upper edge of expected cone)
  - Short put strike: $302 (below lower edge of cone)
  - Long call strike: $332 (outside cone)
  - Long put strike: $298 (outside cone)
- Blue line: Actual SPY price path

**What It Demonstrates:**
- **Skew:** The short put ($302) is 4.1% below the current price ($315), while the short call ($328) is 4.1% above. Despite being equidistant in delta (16Δ), the distances are NOT symmetric due to put skew.
- **Expected Move Cone:** Derived from IV (±4.2% for 45 DTE). Most outcomes are expected to fall within the cone.
- **Trade Placement:** Short strikes are positioned at the edges of the expected move cone, maximizing the probability of expiration at profit. Wings extend beyond the cone to cap losses for extreme moves.

---

### **Table 5.13: SPY Strangle Statistics by Delta (2005–2021)**

| Statistics | 16Δ | 20Δ | 30Δ |
|---|---|---|---|
| POP | 81% | 76% | 68% |
| Avg P/L | $44 | $49 | $54 |
| Std Dev P/L | $614 | $659 | $747 |
| CVaR (5%) | –$1,535 | –$1,673 | –$1,931 |

**Description:**
Performance of 45 DTE SPY strangles with different delta specifications. Higher delta = tighter strangle (closer to ATM).

**Interpretation:**
- **16Δ (Tight):** 81% POP, $44 avg profit, $614 std dev. Safest.
- **20Δ (Medium):** 76% POP, $49 avg profit, $659 std dev.
- **30Δ (Wide):** 68% POP, $54 avg profit, $747 std dev, –$1,931 CVaR. Riskiest but most rewarding.

**Trade-off:**
- Higher delta (tighter strangle) = higher POP, lower volatility, lower tail risk, smaller profit.
- Lower delta (wider strangle) = lower POP, higher volatility, higher tail risk, larger profit.

**Consensus:** For short premium, deltas 10–40Δ are typical, with 16–20Δ being the "sweet spot" (reasonable POP, manageable volatility, decent profit).

---

### **Table 5.14: Average BPRs by Delta (2005–2021)**

| VIX Range | 16Δ | 20Δ | 30Δ |
|-----------|-----|-----|-----|
| 0–15 | $3,270 | $3,366 | $3,573 |
| 15–25 | $2,641 | $2,756 | $3,014 |
| 25–35 | $2,261 | $2,415 | $2,794 |
| 35–45 | $1,648 | $1,715 | $2,058 |
| 45+ | $1,445 | $1,421 | $1,520 |

**Interpretation:**
- Higher delta strangles require slightly more BPR across all IV levels.
- Example: At VIX 0–15, 16Δ is $3,270 but 30Δ is $3,573 (+$303 or +9%).
- **Reason:** 30Δ strikes are closer to ATM (higher gamma), so worst-case loss is larger.
- **Implication:** Tight strangles are more capital-intensive, but the difference is modest (typically 5–10%).

---

### **Table 5.15: Probability of Loss Exceeding BPR (2005–2021)**

| Strangle Delta | Prob Loss > BPR |
|---|---|
| 16Δ | 0.90% |
| 20Δ | 0.93% |
| 30Δ | 1.0% |

**Interpretation:**
- **16Δ strangles:** Only 0.90% of trades lose more than their reserved BPR. BPR captures 99.1% of outcomes.
- **30Δ strangles:** 1.0% of trades exceed BPR. Slightly higher outlier frequency.
- **Conclusion:** Tighter strangles (16Δ) are safer; wider strangles (30Δ) are more prone to tail events. But even at 30Δ, the breach rate is <1%.

---

### **Table 5.16: Strike Prices by IV – 30 DTE 16Δ Call Option**

| IV | Underlying Price | Strike Price |
|---|---|---|
| 10% | $100 | $103 |
| 50% | $100 | $117 |

**Description:**
Same underlying, same delta, same DTE, but different IVs. The strike price moves significantly.

**Interpretation:**
- **IV 10%:** 16Δ call is $103 (3% OTM from $100 stock).
- **IV 50%:** 16Δ call is $117 (17% OTM from $100 stock).
- **Reason:** Higher IV → wider expected move cone → strikes spread further away from the current price.
- **Practical Implication:** When IV increases, existing positions become tighter (delta becomes larger) and closer to ATM. Good practice is to close and reopen positions with adjusted strikes that maintain the 16Δ target.

---

## 4. Connections

### **Back to Earlier Chapters**

**Chapter 1 (Greeks):**
- **Gamma and P/L Volatility:** Figure 5.1 shows gamma's effect on P/L swings. Shorter-term contracts (15 DTE) have strikes close to ATM (high gamma), resulting in large P/L swings. Longer-term contracts have lower gamma and more stable P/L.
- **Theta Decay:** The sharp drop in P/L volatility near expiration in Figure 5.1 reflects theta's acceleration—extrinsic value evaporates rapidly as expiration approaches.
- **Delta as Share Equivalence:** The chapter equates delta to perceived risk: a 20Δ option behaves like owning 20 shares. This links delta to the Black-Scholes framework from Ch 1.

**Chapter 2 (Implied Volatility):**
- **Expected Move Cone:** Tables 5.5 and Figure 5.3 use the expected move formula from Ch 2: Expected Move = IV × √(T/365) × Stock Price. This cone positions the short strikes at its edges.
- **IV Scaling:** Table 5.16 demonstrates that as IV increases, strikes for a given delta move further from ATM. This is the IV scaling principle from Ch 2.
- **Strike Skew:** Tables 5.5 and Figure 5.3 show put strikes further OTM than call strikes (put skew), reflecting the market's downside fear discussed in Ch 2.
- **Product Indifference:** Table 5.4 shows that options on different underlyings with the same IV have proportional prices—the "product indifference" concept from Ch 2.

**Chapter 3 (Short Premium):**
- **Empirical POP:** Table 5.3 provides real-world P/L data for short strangles, validating Ch 3's thesis that short premium is statistically favorable (POPs of 76–83%).
- **Profit Expectation:** The "average profit" column in Table 5.3 shows short strangles generate consistent positive expected value, despite tail risk.
- **Tail Risk Trade-off:** Table 5.11 illustrates the core tension from Ch 3: tighter-winged condors (73% POP) have smaller profits and more consistent wins, while strangles (81% POP) have larger average profits but higher tail risk (CVaR –$1,535).

**Chapter 4 (Buying Power Reduction):**
- **BPR as Constraint:** Tables 5.7, 5.12, and 5.14 show BPR dominating trade selection. The chapter emphasizes: "The capital requirement of the trade is a limiting factor."
- **BPR vs. IV:** Table 5.12 operationalizes Ch 4's inverse relationship: as IV increases, strangle BPR decreases (because strikes spread wider). Portfolio allocation (Table 5.7) directly follows from this relationship.
- **Capital Allocation Rules:** Table 5.7 implements Ch 4's portfolio allocation principle: at low VIX allocate 30%, at high VIX allocate 50%, with 75/25 split between undefined/defined risk.

### **Forward to Later Chapters**

**Chapter 6 (Managing Trades):**
- **Adjustment Signals:** Table 5.16 and the discussion of IV changes note that when IV increases, traders should close and reopen positions with adjusted strikes. This previews Ch 6's focus on live trade management.
- **P/L Monitoring:** Figure 5.1's P/L volatility profile motivates the need for management tools. Ch 6 will cover how to respond to large mid-trade moves.

**Chapter 7 (Portfolio Management):**
- **Allocation Framework:** Table 5.7 is the starting framework for Ch 7. The chapter will expand on how to allocate across multiple positions, different underlyings, and different strategies simultaneously.
- **Balancing Risk Profiles:** The 75/25 undefined-to-defined ratio in Table 5.7 is a foundational principle for Ch 7's portfolio construction.

**Chapter 9 (Binary Events):**
- **Contextual Information:** The chapter notes that earnings dates (mentioned in footnote 1) cause IV inflation for stocks, creating special opportunities. Ch 9 will cover earnings plays as a specific case.

### **Links to Glossary and Core Concepts from Ch 1–4**

- **Delta (Δ):** Perceived risk per share; drives strike selection and directional exposure.
- **Gamma (Γ):** Rate of delta change; explains P/L volatility variation by duration (Figure 5.1).
- **Theta (θ):** Time decay; explains sharp P/L drops near expiration and why longer-duration contracts are more tradeable.
- **Implied Volatility (IV):** Determines expected move cone, strike positioning, and BPR. Higher IV = wider cone = further OTM strikes.
- **Buying Power Reduction (BPR):** The hard constraint that shapes all trade selection. Operationalized in portfolio allocation (Table 5.7).
- **Probability of Profit (POP):** Empirically quantified in Tables 5.3, 5.8, 5.11, 5.13, 5.15. Higher POP for tight positions, lower for wide.
- **Risk Profile:** Defined (capped loss) vs. Undefined (unlimited loss). Critical to capital allocation and strategy selection.
- **Expected Move:** IV × √(T/365) × S; used to position strikes (Figure 5.3).
- **Strike Skew:** Put strikes further OTM than call strikes due to market fear (Tables 5.5, 5.16, Figure 5.3).

### **Structural Role in the Book**

- **Chapters 1–4:** Theory and Motivation
  - Ch 1: Greeks and pricing models
  - Ch 2: IV, reversion, and expected moves
  - Ch 3: Short premium statistical edge and tail risk
  - Ch 4: Capital requirements (BPR)
  
- **Chapter 5:** Trade Construction (Applying theory to practice)
  - 6-step framework for building a single trade
  - Empirical validation of concepts from Ch 1–4
  
- **Chapters 6–8:** Scale and Portfolio
  - Ch 6: Managing individual trades (live adjustments)
  - Ch 7: Allocating capital across multiple positions
  - Ch 8: Advanced portfolio strategies

Chapter 5 is the **pivot point** where the book transitions from individual mechanics to portfolio construction.

---

## Summary

Chapter 5 systematizes the **non-linear process** of constructing a short premium trade. The six decision steps—asset universe, underlying, duration, risk profile, directional assumption, and delta—are interdependent and constrained by account size, BPR, profit goals, and risk tolerance. The chapter provides **empirical validation** (Tables 5.3, 5.11, 5.13) showing that the theoretical framework from Chapters 1–4 holds in practice: short premium is statistically favorable (POPs 68–83%), but risk and reward scale with position tightness (delta) and strategy choice (strangle vs. condor, naked options vs. spreads).

**Key Takeaways:**
1. Trade construction has **six major decisions**, each affecting the others.
2. **Liquidity** is a prerequisite; only trade liquid assets.
3. **Stocks vs. ETFs:** Stock options offer higher credits but more risk; ETF options are cheaper and safer.
4. **Duration:** 30–60 DTE balances manageable P/L volatility with adequate time for adjustments.
5. **Risk Profile:** Undefined risk has higher POP and profit, but defined risk preserves capital.
6. **Directional Assumption:** Most profitable are neutral strategies (strangle, iron condor) when IV is elevated.
7. **Delta:** 10–40Δ is typical; 16–20Δ is the sweet spot (high POP, manageable risk).
8. **BPR is the hard constraint:** It determines how many positions fit and drives allocation decisions.

The chapter emphasizes that **trade construction is personal**—no single "best" trade exists. The choice depends on account size, preferred P/L magnitude, risk tolerance, and contextual information (earnings, events). The six-step framework is a guide, not a prescription.
