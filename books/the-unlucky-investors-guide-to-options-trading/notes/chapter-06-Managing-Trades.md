# Chapter 6 — Managing Trades
## The Unlucky Investor's Guide to Options Trading

---

## 1. Concept Summary

Chapter 6 answers a single operational question: **when and how do you close a short options position before it expires?**

The chapter argues that **active management** — closing positions early rather than holding to expiration — offers three structural advantages:

1. **More occurrences** — Faster turnover means more trades over a given period, allowing the law of large numbers to work faster
2. **More efficient use of buying power** — Capital freed from a nearly-expired trade can be redeployed into a fresh position with more extrinsic value to collect
3. **Lower per-trade risk** — Earlier closure reduces P/L standard deviation and tail CVaR per individual trade

The chapter then presents and compares three management approaches using 17 years of SPY 45-DTE 16Δ strangle backtests (2005–2021):
- **Managing by DTE** — Close when the contract reaches a pre-set number of remaining days
- **Managing by profit target** — Close when the position reaches a fixed percentage of the initial credit
- **Managing by loss limit (stop loss)** — Close when losses reach a fixed percentage of the initial credit

The chapter closes with a critical warning: **lower per-trade risk does not guarantee lower long-term portfolio risk**. The timing of management relative to market volatility cycles can completely reverse which strategy "wins," and two dramatically different historical periods (2020 COVID crash vs. 2018–2019 moderate volatility) are presented to prove this point.

The single most important operational principle throughout the chapter is **consistency** — a management rule must be simple enough to execute across all trades, because statistical edge is only realized across many occurrences.

---

## 2. Key Equations

No new algebraic equations are introduced in Chapter 6. All metrics (POP, P/L standard deviation, CVaR) were established in prior chapters and are applied here without re-derivation.

The one implicit quantitative relationship used to compare capital efficiency is:

### Average Daily P/L

$$\text{Average Daily P/L} = \frac{\text{Average P/L (per trade)}}{\text{Average Duration (days)}}$$

**What it measures:** How much profit, on average, each dollar of capital generates per day it is deployed. A trade closed in 24 days for 16% of initial credit earns faster than a trade closed in 44 days for 28% — even though the 44-day trade makes more per occurrence.

**Worked example from Table 6.3:**

| Strategy | Avg P/L | Avg Duration | Avg Daily P/L |
|---|---|---|---|
| 50% profit or Exp. | 16% of credit | 24 days | $1.67/day |
| 75% profit or Exp. | 22% of credit | 34 days | $1.49/day |
| Hold to expiration | 28% of credit | 44 days | $1.29/day |
| 21 DTE | 21% of credit | 24 days | $1.60/day |

Key insight: **21 DTE management earns $1.60/day vs. $1.29/day for holding to expiration** — a 24% improvement in capital efficiency, even though the per-trade profit is lower (21% vs. 28%).

---

## 3. Figures Explained

### Figure 6.1 — 2020 COVID Sell-Off: 21 DTE vs. Expiration

**Panel (a): Portfolio Value (Feb 2020 – Jan 2021)**
- Two hypothetical portfolios, each starting at $100,000
- **Dashed line (21 DTE management):** Drops sharply to ~$60,000 during the March 2020 COVID sell-off (~40% drawdown), then gradually recovers to ~$85,000 by year-end
- **Solid line (Hold to expiration):** Drops catastrophically in March 2020 to approximately –$20,000 (wiped out and into negative equity), then stays flat for the remainder of the year

**Panel (b): SPY IV (VIX)**
- VIX spikes from ~15 in early 2020 to a peak of ~83 in March 2020 — the fastest and largest IV expansion in the 17-year dataset
- Rapidly falls back, oscillating between 20–40 through mid-2020, declining toward 20 by January 2021

**What this shows:** The 2020 COVID crash was so fast (weeks, not months) that 45-DTE contracts opened in late January/February 2020 experienced the full IV explosion before reaching their 21 DTE management point. For the expiration-managed portfolio, those contracts couldn't be closed — they expired at maximum loss. For the 21 DTE portfolio, positions were closed early enough that even a smaller loss was taken, preserving the portfolio.

**Start date sensitivity (explicitly provided in the chapter):**
- Trader starting Feb 3, 2020: 21 DTE → final P/L **–$717**; Expiration → final P/L **–$8,087**
- Trader starting March 4, 2020 (one month later): 21 DTE → final P/L **–$2,271**; Expiration → final P/L **+$518**
- A one-month shift in start date completely reverses which strategy wins, illustrating extreme path dependence

---

### Figure 6.2 — 2018–2019 Moderate Volatility: 21 DTE vs. Expiration

**Panel (a): Portfolio Value (Sep 2018 – Sep 2019)**
- **Dashed line (21 DTE management):** Starts at $100,000, drops steadily to ~$80,000 in late 2018, falls further to ~$60,000 in early 2019, then edges down to ~$57,000 by September 2019 — cumulative ~43% loss
- **Solid line (Hold to expiration):** Starts at $100,000, rises steadily and strongly throughout the entire period, ending at approximately $150,000 by September 2019 — cumulative ~50% gain

**Panel (b): SPY IV (VIX)**
- VIX is elevated and volatile throughout late 2018, with a sharp spike to ~36 around January 2019
- Falls to lower levels (13–20) through mid-2019 with a moderate secondary spike to ~25

**What this shows:** During 2018–2019, IV expansions were smaller but more frequent. The 21 DTE management window (closing at 21 DTE for 45 DTE contracts) consistently aligned with IV peaks — positions were being closed at the exact moment the market was most stressed. The expiration-managed portfolio simply waited, outlasted the moderate volatility spikes, and profited as they subsided. Result: the strategy with lower per-trade risk produced far worse portfolio-level outcomes in this environment.

**Author's conclusion:** There is no universally "better" management strategy. Which approach wins depends entirely on whether volatility spikes are fast and extreme (favoring early management) or slow and moderate (favoring holding to expiration).

---

## 4. All Tables (Complete Data)

### Table 6.1 — Managing by DTE
**16-delta SPY Strangle Statistics (2005–2021) — Management by remaining DTE**

| Management DTE | POP | Avg P/L | Avg Daily P/L | P/L Std Dev | CVaR (5%) |
|---|---|---|---|---|---|
| 40 DTE | 67% | 2.3% | $0.23 | 73% | –206% |
| 30 DTE | 73% | 10% | $1.75 | 88% | –212% |
| 21 DTE | 79% | 21% | $1.60 | 96% | –283% |
| 15 DTE | 78% | 25% | $1.51 | 105% | –304% |
| 5 DTE (a) | 82% | 33% | $1.34 | 185% | –514% |
| Expiration | 81% | 28% | $1.29 | 247% | –708% |

*(a) The 5 DTE results appear to outperform expiration but were likely skewed by specific historical events; the author warns against generalizing this.*

**Reading this table:**
- As management DTE decreases (later closure), average P/L per trade increases but so does P/L standard deviation and CVaR tail risk
- The jump from 15 DTE to 5 DTE shows a dramatic increase in CVaR (–304% to –514%) and Std Dev (105% to 185%), illustrating the danger of the final days before expiration
- **Sweet spot: 21 DTE** — best risk-adjusted profile before tail risk escalates sharply

---

### Table 6.2 — Managing by Profit Target
**16-delta SPY Strangle Statistics (2005–2021) — Profit target (if not reached, hold to expiration)**

| Profit Target | POP | Avg P/L | P/L Std Dev | Prob. of Reaching Target | CVaR (5%) |
|---|---|---|---|---|---|
| 25% or Exp. | 96% | 11% | 191% | 96% | –522% |
| 50% or Exp. | 91% | 16% | 236% | 90% | –654% |
| 75% or Exp. | 84% | 22% | 245% | 80% | –699% |
| 100% (Expiration) | 81% | 28% | 247% | 52% | –708% |
| **21 DTE (reference)** | **79%** | **21%** | **96%** | **N/A** | **–283%** |

**Reading this table:**
- Tighter profit targets create higher POP and more frequent success — but the rare losses are catastrophic (CVaR –522% even at 25% target)
- The trades that miss the profit target hold all the way to expiration and carry full tail risk — this is why CVaR for profit-target strategies is nearly as bad as holding to expiration
- **Critical observation:** Profit target management alone does NOT reduce tail risk relative to expiration. 21 DTE management, by contrast, halves the CVaR (–283% vs. –708%) because it closes unconditionally
- "Probability of Reaching Target" drops from 96% at 25% target to 52% at 100% (expiration) — only about half of strangles ever reach their maximum possible profit

*(Note: Tests measured whether targets were reached by end of trading day, not intraday — statistics are approximate.)*

---

### Table 6.3 — Average Daily P/L Comparison
**16-delta SPY Strangle Statistics (2005–2021)**

| Profit Target | Avg Daily P/L | Avg Duration (Days) |
|---|---|---|
| 25% or Exp. | $1.75 | 15 |
| 50% or Exp. | $1.67 | 24 |
| 75% or Exp. | $1.49 | 34 |
| 100% (Expiration) | $1.29 | 44 |
| 21 DTE | $1.60 | 24 |

**Reading this table:**
- Despite lower per-trade P/L, profit target strategies extract more P/L per day of capital deployment
- The 25% target generates $1.75/day but closes positions in only 15 days on average — meaning roughly 2 positions can be cycled through per 30-day month
- 21 DTE generates $1.60/day over the same 24-day average duration as a 50% profit target strategy — making it essentially equivalent in capital efficiency while carrying far less tail risk

---

### Table 6.4 — Managing by Loss Limit (Stop Loss)
**16-delta SPY Strangle Statistics (2005–2021) — Loss limit (if not triggered, hold to expiration)**

| Loss Limit | POP | Avg P/L | P/L Std Dev | Prob. of Triggering | CVaR (5%) |
|---|---|---|---|---|---|
| –50% or Exp. | 58% | 21% | 90% | 40% | –168% |
| –100% or Exp. | 69% | 25% | 110% | 25% | –238% |
| –200% or Exp. | 76% | 27% | 131% | 13% | –338% |
| –300% or Exp. | 79% | 27% | 149% | 8% | –450% |
| –400% or Exp. | 79% | 27% | 160% | 6% | –536% |
| None (Expiration) | 81% | 28% | 247% | N/A | –708% |
| **21 DTE (reference)** | **79%** | **21%** | **96%** | **N/A** | **–283%** |
| **50% Profit (reference)** | **91%** | **16%** | **236%** | **90%** | **–654%** |

**Reading this table:**
- A –50% stop loss triggers 40% of the time — nearly every losing trade gets stopped out, converting recoverable drawdowns into realized losses. POP collapses to 58%
- A –200% stop loss triggers only 13% of the time — it stops the genuine catastrophes while letting most positions ride to recovery
- Stop losses dramatically reduce CVaR from –708% to –168% (at –50%), but they also hurt POP and average P/L
- **Key warning:** Stop losses do not eliminate tail risk entirely. A sudden overnight IV expansion can move a position from –25% to –75% in a single day, bypassing a –50% stop. This "gap risk" means CVaR never reaches zero
- **Recommendation: –200% or higher** (less aggressive) as a practical stop loss level that avoids over-triggering while still catching genuine disasters

---

### Table 6.5 — Combined Strategy: 21 DTE or 50% Profit (Whichever First)
**16-delta SPY Strangle Statistics (2005–2021) — Ranked by CVaR**

| Management Strategy | POP | Avg P/L | Avg Daily P/L | P/L Std Dev | CVaR (5%) |
|---|---|---|---|---|---|
| 21 DTE | 79% | 21% | $1.60 | 96% | –283% |
| **21 DTE or 50% Profit** | **81%** | **18%** | **$1.67** | **96%** | **–288%** |
| –200% Loss or Exp. | 76% | 27% | N/A | 131% | –338% |
| 50% Profit or Exp. | 91% | 16% | $1.67 | 236% | –654% |
| Expiration | 81% | 28% | $1.29 | 247% | –708% |

**Reading this table:**
- The combined "21 DTE or 50% profit" strategy is essentially the same as pure 21 DTE in risk profile (CVaR –288% vs. –283%, same Std Dev 96%)
- It gains slightly in POP (81% vs. 79%) and marginally better daily P/L ($1.67 vs. $1.60) by locking in profits when they come early
- This is the author's implied recommendation for active traders: **a simple, automated rule that takes profit when available and always closes by midpoint regardless**

---

### Table 6.6 — Qualitative Comparison of Management Strategies

| Criterion | 21 DTE | 50% or Exp. | –200% or Exp. | Expiration |
|---|---|---|---|---|
| Convenience | Medium | High (a) | High | High |
| POP | Medium | High | Medium | Medium |
| Per-Trade Loss Potential | **Low** | High | Low | **High** |
| Per-Trade Profit Potential | Medium | Low | High | High |
| Number of Occurrences | Medium | Medium | Low | **Low** |

*(a) When limit orders are used, profit target management is very convenient — set it and forget it.*

**What this table means for strategy selection:**
- **21 DTE:** Best for active traders who want controlled risk and higher turnover; moderate convenience requires monitoring
- **50% or Exp.:** Best for passive traders with defined-risk positions or those prioritizing high POP; automates easily with limit orders; hides large tail risk
- **–200% or Exp.:** Best as a safety net, not a primary strategy; retains most profit upside but adds risk monitoring overhead
- **Expiration:** Best for truly passive investors comfortable with maximum tail exposure; simplest to run

---

## 5. Connections to Prior Chapters

### Chapter 3 and Chapter 5 — P/L Volatility Increases Near Expiration
Chapter 6 operationalizes the observation from Chapters 3 and 5 that P/L swings become more erratic as contracts approach expiration. This is the foundational motivation for early management: the risk-to-reward trade-off deteriorates in the final weeks. Table 6.1 quantifies this: CVaR jumps from –283% at 21 DTE to –708% at expiration, while average P/L only improves from 21% to 28%.

### Chapter 3 — Probability of Profit (POP)
POP was introduced in Chapter 3 as a property of strike selection. Chapter 6 reveals that POP is also a function of management strategy — it is not fixed. Managing at 21 DTE achieves 79% POP; adding a 50% profit trigger raises it to 81%; but using a –50% stop loss collapses it to 58%. POP is dynamically controlled by how you manage positions, not just where you place them.

### Chapter 4 — Buying Power Reduction (BPR)
The capital efficiency argument for active management (the Average Daily P/L metric in Tables 6.2–6.3) is a direct extension of BPR logic. When BPR is locked in a position near expiration, it earns diminishing returns — the remaining extrinsic value is small but gamma risk is high. Early management frees BPR for deployment in a fresh 45-DTE contract with far more extrinsic value remaining and lower gamma exposure.

### Chapter 5 — Trade Construction and Duration
Chapter 5 established that 30–60 DTE is the optimal duration band for strangles. Chapter 6 assumes all positions open at 45 DTE and shows that closing around the midpoint (21 DTE) maximizes risk-adjusted daily returns. This is consistent: 45 DTE opening + 21 DTE closure means holding through the zone of efficient theta decay established in Chapter 5.

### Chapter 2 — IV Expansion and Reversion
The COVID 2020 and 2018–2019 case studies in Chapter 6 are directly linked to the IV lifecycle from Chapter 2. The 2020 collapse is a textbook Expansion event (IV spiked from ~15 to ~83); the 2018–2019 period represents frequent moderate expansions followed by contractions. Chapter 6 shows that which management strategy "wins" depends entirely on where you are in the IV cycle — an extension of Chapter 2's core insight that IV reverts and that timing relative to those cycles matters.

### Chapter 1 — Expected Value and Law of Large Numbers
The emphasis on occurrences (more trades = law of large numbers working faster) connects directly to Chapter 1's expected value framework. A single strangle has a wide outcome distribution; the long-term edge manifests only across many repetitions. Earlier management maximizes occurrences, which is rational under EV reasoning if the per-occurrence edge is maintained.

---

## 6. Management Strategy Framework

### The Three Dimensions of Choosing a Management Strategy

1. **Convenience and consistency** — Can you execute this rule without exceptions across every trade?
2. **Capital preferences** — Do you want more occurrences (earlier management) or higher per-trade profit (later management)?
3. **Outlier tolerance** — How large a per-trade loss can you absorb without abandoning your strategy?

### Ranking by Loss Potential (Highest to Lowest Risk)

| Rank | Strategy | CVaR (5%) |
|---|---|---|
| 1 (most risk) | Hold to expiration | –708% |
| 2 | 50–75% profit target | –654% to –699% |
| 3 | –200% loss limit | –338% |
| 4 (least risk) | 21 DTE | –283% |

### Trader Profiles

| Trader Type | Recommended Strategy |
|---|---|
| Passive (high outlier tolerance) | Stop loss only; hold to expiration otherwise |
| Active (moderate tolerance) | Manage general positions at fixed profit target; close higher-risk positions at DTE midpoint |
| Very active (low outlier tolerance) | Close all undefined risk at 50% of credit OR at contract midpoint (21 DTE), whichever comes first |

### For Defined Risk Positions (Spreads, Iron Condors)
- **Do NOT use stop losses** — maximum loss is already known and capped; positions can recover
- Profit target of ~50% or lower is appropriate (P/L swings are less volatile than undefined risk)
- Losers should run toward expiration to allow recovery

---

## 7. Key Takeaways

1. **Active management beats passive holding** — Not in per-trade profit, but in capital efficiency (daily P/L), portfolio resilience, and number of occurrences
2. **21 DTE is the recommended management point** for 45 DTE strangles — it roughly halves tail CVaR (–283% vs. –708%) while losing only 7 percentage points of per-trade profit (21% vs. 28%)
3. **Profit targets reduce POP variance but not tail CVaR** — Positions that miss their profit target still hold to expiration and carry full tail risk; profit targets do not substitute for DTE management
4. **Stop losses reduce CVaR but destroy POP** — A –50% stop loss triggers 40% of the time and collapses POP to 58%; –200% is the practical minimum
5. **Combined "21 DTE or 50% profit" is the best all-around approach** — Nearly identical risk to pure 21 DTE management but with slightly better daily P/L and POP from early profit locking
6. **Per-trade risk reduction ≠ long-term portfolio risk reduction** — More occurrences from earlier management compounds cumulative exposure; 2018–2019 showed expiration-held strangles outperforming 21 DTE management by ~93 percentage points despite higher per-trade risk
7. **Path dependence is extreme** — A one-month shift in start date (Feb 3 vs. March 4, 2020) completely reversed which strategy won and lost; options backtests must be interpreted with caution
8. **Consistency is the primary principle** — The statistical edge in short premium only manifests across large numbers of occurrences; the best management strategy is whichever one you can execute without deviation across all market conditions

---

## 8. New Glossary Terms (Chapter 6)

| Term | Definition |
|------|------------|
| Active management | Closing an options position prior to expiration |
| Management DTE | The pre-set number of remaining days to expiration at which a position is closed |
| Profit target | A fixed percentage of the initial credit received at which a position is closed for a gain |
| Loss limit / Stop loss | A fixed percentage of the initial credit at which a position is closed to cap a loss |
| Rolling | Closing an existing position and opening the same type of new position with capital freed |
| Occurrences | The number of completed trades over a given period; more occurrences allow faster realization of expected value |
| Initial credit | The premium received when opening a short options position; base for normalizing P/L |
| Probability of Reaching Target | Percentage of trades that hit a profit or loss target before expiration |
| Average Daily P/L | Average per-trade P/L divided by average duration; measures capital efficiency across strategies |
| Per-trade risk | Risk measured on an individual contract basis, distinct from cumulative portfolio risk |
| Path dependence | The sensitivity of long-term outcomes to the specific sequence and timing of market events |
