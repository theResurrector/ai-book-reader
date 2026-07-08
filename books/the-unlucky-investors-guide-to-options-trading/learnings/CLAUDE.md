# Learnings — The Unlucky Investor's Guide to Options Trading

> This folder is for **applying** the book's teachings, not reviewing them.
> Chapter-by-chapter breakdowns live in `notes/`. This file reorganizes those
> teachings into the questions you actually ask when facing a real trade or position.
>
> Each lens starts with a framing question, then gives the book's rules and data,
> then leaves space for your own observations and real-world applications.

---

## Lens 1 — Reading the Market
**Question: What is the volatility environment telling me right now?**

### The Book's Framework

**IV is non-directional.** It measures the *magnitude* of expected price movement, not direction. When VIX is high, the market is fearful — not necessarily heading down.

**Three recurring IV states** (Ch. 2):
| State | Frequency | Characteristic |
|---|---|---|
| Lull | ~70% of the time | IV near long-term baseline; slowest to change |
| Expansion | ~10% | IV spikes rapidly (days); often fear-driven |
| Contraction | ~20% | IV deflates toward baseline after a spike |

**IV vs. realized volatility** (Ch. 2): For SPY (2016–2021), the market's implied IV overstated actual realized moves **87% of the time** vs. the theoretical 68.2%. This is the fundamental edge — fear is usually priced higher than reality.

**IV reversion** (Ch. 2): After significant expansions, VIX is assumed to revert downward. This validates making downward directional assumptions about volatility once it is elevated.

**The VIX scaling table** (Ch. 10 — the book's single most important lookup rule):
| VIX Range | Max Short Premium Allocation |
|---|---|
| 0–15 | 25% |
| 15–20 | 30% |
| 20–30 | 35% |
| 30–40 | 40% |
| 40+ | 50% |

**IV percentile (IVP)** (Ch. 3): IVP = number of days in the past year where IV was *below* today's IV, divided by 252. IVP > 50 means today's IV is elevated relative to its own recent history — a better entry point for short premium.

**Asset-specific IV baselines** (Ch. 2): Broad indexes (SPY) ~17–18; commodities (GLD) ~15–16; tech stocks (AAPL, AMZN) ~30. Single stocks run 1.7–2× higher than broad indexes. Earnings dates cause predictable IV spikes for single stocks but not for broad indexes.

### My Notes / Applications

> _Add your own observations here — e.g., what the current VIX level is telling you, how you're interpreting a recent expansion, patterns you've noticed._

---

## Lens 2 — Selecting a Trade
**Question: What should I build, and on which underlying?**

### The Book's Framework

**Liquidity first — non-negotiable** (Ch. 5):
- Underlying: >1M daily volume, <0.1% bid-ask spread
- Options: tight bid-ask spreads and high open interest across strikes
- If liquidity fails, don't trade it.

**ETFs (core) vs. stocks (supplemental)** (Ch. 5 & 7):
| | ETFs | Stocks |
|---|---|---|
| IV level | Lower | 1.7–2× higher |
| Credits collected | Lower | 3–8× higher |
| Avg loss | Smaller | 3–8× larger |
| CVaR | Manageable | Extreme |
| Binary event risk | None | Earnings / dividends |
| Role | Core (≥75% of short premium) | Supplemental (≤25%) |

**Product indifference principle** (Ch. 5): If two underlyings have the same IV, their options price the same as a percentage of underlying price. Choice depends on account size and risk tolerance, not inherent superiority.

**Duration: 30–60 DTE, optimal 45 DTE** (Ch. 5):
- 15 DTE: high gamma, wild P/L swings — avoid
- 30–60 DTE: manageable P/L volatility, time for adjustments, efficient BPR use
- Beyond 60 DTE: BPR inefficiency (too much capital tied up for too long)

**Strike selection: 10–40Δ range, sweet spot 16–20Δ** (Ch. 5):
- 16Δ strangles: 81% POP, $44 avg profit, $614 std dev — the empirical sweet spot
- 30Δ strangles: 68% POP, $54 avg profit, $747 std dev — higher profit but lower POP and more volatile
- Put strikes are systematically further OTM than call strikes (put skew)
- As IV rises, strikes for a given delta move further OTM — when IV spikes, close and reopen with adjusted strikes

**Structure: undefined vs. defined risk** (Ch. 5 & 7):
| | Strangles (undefined) | Iron condors (defined) |
|---|---|---|
| POP | Higher | Lower |
| Credit | Higher | Lower |
| Max loss | Unlimited | Capped: (spread width − credit) × 100 |
| BPR | Higher | Lower |
| Portfolio split | ≥75% of short premium | ≤25% of short premium |
| When preferred | Higher IV environments | Lower IV environments (9× cheaper BPR) |

**High-POP wide iron condors** can occupy *undefined risk* portfolio capital — they have comparable risk profiles to strangles (Ch. 10).

### My Notes / Applications

> _Add your own observations here — e.g., which underlyings you're watching, your experience with IV differences between ETFs and stocks, how you're choosing structure._

---

## Lens 3 — Sizing a Position
**Question: How much capital should this trade occupy?**

### The Book's Framework

**BPR rule of thumb** (Ch. 4 & 10): Short strangles require BPR ≈ **20% of the underlying price** per contract. This is your capital reserved — your own equity, not borrowed money.

**Per-trade caps** (Ch. 7):
- Undefined risk (strangles): max **7%** of total portfolio buying power
- Defined risk (iron condors): max **5%** of total portfolio buying power
- Small accounts have more flexibility on these caps, but the total allocation ceiling still applies

**Total portfolio allocation** (Ch. 7 & 10):
- Short premium: 25–50% of total buying power (VIX-scaled — see Lens 1)
- Within short premium: ≥75% undefined risk, ≤25% defined risk
- Within short premium: ≥75% core positions (ETFs), ≤25% supplemental (stocks)
- Remainder: cash or passive investment (e.g., SPY)

**Kelly-derived POP weighting** (Ch. 8): For active traders sizing a multi-underlying portfolio:

$$f = r \times \frac{DTE}{365} \times \frac{POP}{1-POP}$$

Use r ≈ 3% (risk-free rate). This gives conservative proportional weights — treat outputs as ratios, not literal sizes. Scale the largest ratio to the 7% cap; scale others proportionally.

**Correlated pairs share one budget** (Ch. 8): SPY and QQQ (correlation 0.88) cannot each receive an independent Kelly allocation. Combine their allocations, then split by their individual Kelly proportions. Example: SPY gets 3.0%, QQQ gets 2.2% from a shared 5.2% budget.

**Worked example — six-ETF portfolio** (Ch. 8): SPY 3.0% / QQQ 2.2% / GLD 7.0% / TLT 4.8% / FXE 6.7% / XLU 5.9% = **~30% total** (with VIX in the 15–20 range).

**BPR scales with IV inversely** (Ch. 4): High IV → strikes spread further OTM → lower BPR per trade → more simultaneous positions allowed. This is why high IV environments are both statistically better *and* more capital-efficient.

### My Notes / Applications

> _Add your own observations here — e.g., how you're applying the caps to your account size, what your target total allocation is, how Kelly weighting felt in practice._

---

## Lens 4 — Managing an Open Trade
**Question: When and how do I exit?**

### The Book's Framework

**Why close early** (Ch. 6): Active management — closing before expiration — offers three advantages:
1. More occurrences → law of large numbers works faster
2. BPR freed for redeployment into a fresh 45-DTE position
3. Lower per-trade CVaR

**Key metric: Average Daily P/L** (Ch. 6) = Avg P/L ÷ Avg Duration. 21 DTE management earns $1.60/day vs. $1.29/day at expiration — 24% better capital efficiency despite lower per-trade profit.

**Management strategy comparison** (Ch. 6, backtested 2005–2021, 45-DTE 16Δ SPY strangles):

| Strategy | POP | Avg P/L | CVaR (5%) |
|---|---|---|---|
| Hold to expiration | 81% | 28% | –708% |
| 50–75% profit target | 84–96% | 11–22% | –522% to –699% |
| –200% stop loss | 76% | 27% | –338% |
| 21 DTE | 79% | 21% | **–283%** |
| **21 DTE or 50% profit** | **81%** | **18%** | **–288%** |

**The recommended approach for active traders** (Ch. 6): Close at **50% of initial credit OR at the DTE midpoint (21 DTE for 45-DTE contracts)**, whichever comes first. Best all-around risk-adjusted profile.

**Stop losses** (Ch. 6):
- –50% stop: triggers 40% of the time (too tight; converts recoverable drawdowns into realized losses), POP collapses to 58%
- **–200% minimum** is practical — triggers only 13% of the time, CVaR –338%
- Stop losses do not guarantee max loss — overnight gap moves can bypass them
- **Do not use stop losses on defined risk positions** — capped loss means recovery is possible; let losers run to expiration

**Per-trade risk ≠ long-term portfolio risk** (Ch. 6): Earlier management produces more occurrences, compounding cumulative exposure. The 2018–2019 period showed expiration-held strangles outperforming 21 DTE by ~93% because moderate IV expansions aligned with the early closure window. Always choose a management rule you can execute *consistently* regardless of conditions.

**Defined risk profit targets** (Ch. 6 & 10): Use ~50% or lower — P/L swings are less volatile, so lower targets are appropriate.

### My Notes / Applications

> _Add your own observations here — e.g., how you're setting up limit orders for profit targets, situations where you deviated from the rules and what happened, patterns in when your 21 DTE closures coincided with IV peaks._

---

## Lens 5 — Portfolio Construction
**Question: How do I build and diversify the whole portfolio?**

### The Book's Framework

**Diversification hierarchy** (Ch. 7 & 8):
1. **Underlying** — most essential; directly reduces compounding outlier loss probability
2. **Strategy** — mixing defined/undefined risk on same underlying
3. **Duration** — staggering DTE so positions are at different contract life stages

**Why underlying correlation matters** (Ch. 7): Conditional probability of compounding losses:

| Pair | Correlation | Conditional Loss Rate (given SPY outlier) |
|---|---|---|
| SPY + QQQ | 0.89 | **67%** |
| SPY + GLD | –0.03 | **36%** |
| SPY + TLT | –0.41 | **~33%** |

The independent-events benchmark would predict only 0.50% simultaneous losses for SPY+QQQ — the actual 3.9% rate is 8× higher, purely from correlation.

**Correlation matrix for core ETFs** (Ch. 7 & 8, 2011–2020):
| | SPY | QQQ | GLD | TLT | FXE | XLU |
|---|---|---|---|---|---|---|
| SPY | 1.00 | 0.89 | –0.03 | –0.41 | 0.16 | 0.49 |
| QQQ | 0.89 | 1.00 | –0.04 | –0.34 | 0.12 | 0.35 |
| GLD | –0.03 | –0.04 | 1.00 | 0.23 | 0.34 | 0.08 |
| TLT | –0.41 | –0.34 | 0.23 | 1.00 | –0.03 | –0.04 |

**Important: correlations strengthen in crashes** (Ch. 7). Calm-period correlation matrices understate crisis-period values. Diversification benefits measured in normal times are overstated in tail events — another reason to maintain small position sizes.

**An asset's individual outlier rate ≠ its diversification value** (Ch. 7): GLD has a 12% individual outlier rate (higher than SPY at 5.8%) but only a 2.1% simultaneous loss rate with SPY. GLD's value is its independence, not its individual stability.

**Strategy diversification** (Ch. 8): Mixing strangles + iron condors on the same underlying. 2020 sell-off results:
| Mix | 2020 Worst Drawdown |
|---|---|
| 10 strangles | –$77,520 |
| 5 strangles + 5 iron condors | –$45,080 |
| 10 iron condors | –$12,640 |
All three had the same ~150% *proportional* capital drawdown — strategy diversification cuts dollar losses, not percentage losses.

**Position size remains essential regardless of diversification** (Ch. 7): 5–7% per-trade cap is the last line of defense — diversification reduces but does not eliminate compounding tail risk.

### My Notes / Applications

> _Add your own observations here — e.g., how you're building your underlying universe, which assets you're using as diversifiers, real examples of correlated losses you've experienced._

---

## Lens 6 — Portfolio Monitoring
**Question: Is my portfolio healthy right now?**

### The Book's Framework

**Two key metrics to watch** (Ch. 7):

**1. Beta-weighted delta (bD)**
- Formula: bD = Δ_option × β_underlying (per position, then summed)
- Converts all position deltas into units of a $1 SPY move — makes delta additive across multiple underlyings
- **Target: bD ≈ 0** (market-neutral)
- bD neutral → profit comes from IV decay and time, not market direction

**2. Theta ratio**
- Formula: θ_portfolio / net portfolio liquidity
- **Target range: 0.05%–0.1% per day**
- **Hard ceiling: 0.2%** — above this, hidden gamma risk is accumulating (gamma cannot be beta-weighted, so the theta ratio is its proxy)
- Passive SPY benchmark: 0.013–0.025%/day — short premium must comfortably exceed this to justify tail risk

**The four-scenario adjustment decision tree** (Ch. 7 & 10):

| Situation | Action |
|---|---|
| bD neutral, theta too low (<0.05%) | Replace defined→undefined risk; roll to higher deltas; add new delta-neutral positions; consider higher-IV underlyings |
| Theta too low AND bD too positive (bullish) | Add negative bD: short calls on positive-beta underlyings, or short puts on negative-beta underlyings |
| Theta too low AND bD too negative (bearish) | Add positive bD: short puts on positive-beta underlyings |
| Theta too high (>0.2%), bD skewed positive | Remove positive bD positions (e.g., short puts on positive-beta underlyings) |
| Theta too high (>0.2%), bD skewed negative | Remove negative bD positions (e.g., short calls on positive-beta underlyings) |
| Theta sufficient, bD not neutral | Close and re-center skewed positions; replace with new delta-neutral positions at comparable theta |

**Gamma reminder** (Ch. 7): Gamma and theta are positively correlated — high theta also means high gamma. Positions with large positive theta are highly sensitive to underlying price moves. ATM options and near-expiry options carry the highest gamma risk. The theta ratio ceiling (0.2%) protects against excessive hidden gamma accumulation.

### My Notes / Applications

> _Add your own observations here — e.g., how your bD drifts over time, your experience managing the theta ratio, specific adjustment scenarios you've encountered._

---

## Lens 7 — Special Situations: Binary Events
**Question: How do I handle earnings and other scheduled events?**

### The Book's Framework

**What binary events are** (Ch. 9): Known, scheduled events anticipated to cause large price moves — earnings, Fed press conferences, elections, product launches. They create predictable IV expansion before and IV crush after.

**Why the IV crush isn't a reliable edge** (Ch. 9): The market efficiently prices binary event uncertainty (EMH). The post-event price move magnitude is unpredictable, and a large gap can overwhelm both the credit collected and the IV crush gain.

**The data** (Ch. 9, 45-DTE 16Δ strangles, 2005–2020, closed day after earnings):

| Underlying | POP | Avg P/L | CVaR (5%) | Verdict |
|---|---|---|---|---|
| AAPL | 72% | +$85 | –$405 | Marginal positive edge |
| AMZN | 65% | +$99 | –$1,927 | CVaR 19.5× avg P/L |
| GOOGL | 75% | **–$60** | –$4,639 | Negative EV despite 75% POP |

**GOOGL is the critical lesson:** 75% POP yet negative average P/L at every holding period. High win rate does not guarantee positive expected value when losses in the tail are catastrophic.

**The rules** (Ch. 9):
- **Open day before, close day after** — optimal window; all metrics worsen at 5/10/20 days
- **1–2 lots maximum** where a normal position would be 5 lots
- **Spare capital only** — never primary portfolio allocation
- **Monitor actively** — fast-moving positions during the hold period
- **Small sample caveat:** ~60 earnings events per stock over 15 years = very wide confidence intervals; treat statistics directionally only

**Why trade them at all** (Ch. 9): Capital efficiency (1–2 day hold, rapid IV resolution) and educational practice for active position management under rapidly changing conditions — not for reliable profit.

### My Notes / Applications

> _Add your own observations here — e.g., your experience with earnings trades, which underlyings you've tried, how the day-after exit has worked in practice._

---

## Lens 8 — Foundational Principles
**Question: What is the "why" underneath every decision?**

### The Book's Framework

**The statistical edge is the only foundation** (Ch. 1, 3, 10): Options trading does not rely on predicting market direction. Under the Efficient Market Hypothesis (semi-strong form), prices already reflect all available information. The edge comes from selling volatility (insurance) that is *systematically priced higher than it realizes* — 87% of the time for SPY.

**Law of large numbers: ~200 occurrences minimum** (Ch. 1, 10): A single trade has a wide outcome distribution. The expected value only manifests reliably across many repetitions. This is why:
- Trading in all IV environments is preferred over waiting for perfect setups
- Active management that increases turnover is structurally rational
- Consistency is more important than optimization

**The casino analogy** (Ch. 3): The short premium trader is the casino, not the gambler. The house wins consistently not because every hand goes its way, but because the odds are slightly in its favor across thousands of hands. Any single hand can be lost; the statistical edge requires volume.

**High POP ≠ positive expected value** (Ch. 3, 9): GOOGL earnings strangles have 75% POP and negative average P/L. POP tells you how often you win — not whether your wins outweigh your losses. Both matter. CVaR is the proper measure of whether the risk is worth taking.

**Short premium trade-off** (Ch. 2, 3): Bounded gains (credit received) + unbounded losses. The statistical edge means you win more often, but when you lose, you can lose far more than you gain on a typical winning trade. Portfolio survival through outlier events is as important as profitability during normal conditions.

**Consistency is the primary operational principle** (Ch. 6): The management strategy doesn't need to be optimal — it needs to be executable without exception across all market conditions. A suboptimal consistent strategy outperforms an optimal inconsistent one because the law of large numbers can't work if rules are broken during stress.

**Per-trade risk ≠ long-term portfolio risk** (Ch. 6, 8): Improving individual trade metrics doesn't automatically improve portfolio outcomes. More occurrences compound cumulative exposure; path dependence is extreme (a one-month shift in start date in 2020 completely reversed which management strategy won). Don't over-optimize at the trade level without thinking about portfolio-level effects.

**The complete decision system** (Ch. 10):
> Check VIX → Set allocation → Select underlyings (liquid, diversified, uncorrelated) → Construct trades (45 DTE, 16–20Δ, 75% undefined) → Size by POP weighting → Manage (50% credit or DTE midpoint) → Monitor Greeks (bD≈0, theta ratio 0.05–0.1%) → Binary events with spare capital only

### My Notes / Applications

> _Add your own observations here — e.g., moments where you caught yourself treating short premium like a directional bet, how you've internalized the casino mindset, how consistency has played out for you._

---

## Quick Reference Card

| Decision | Rule |
|---|---|
| How much to allocate? | VIX 0–15 → 25%; 15–20 → 30%; 20–30 → 35%; 30–40 → 40%; 40+ → 50% |
| Core vs. supplemental split? | ≥75% ETF underlyings, ≤25% stock underlyings |
| Undefined vs. defined risk split? | ≥75% undefined (strangles), ≤25% defined (iron condors) |
| Per-trade size? | Max 7% BPR (undefined), max 5% BPR (defined) |
| Duration? | 30–60 DTE; open at 45 DTE |
| Strike? | 10–40Δ; sweet spot 16–20Δ |
| When to close? | 50% of credit OR DTE midpoint, whichever first |
| Stop loss? | –200% of credit minimum; not for defined risk positions |
| bD target? | ≈ 0 (market neutral) |
| Theta ratio target? | 0.05%–0.1% per day; ceiling 0.2% |
| Binary events? | Day before / day after; 1–2 lots; spare capital only |
| Occurrences needed? | ~200 minimum for law of large numbers to manifest |
