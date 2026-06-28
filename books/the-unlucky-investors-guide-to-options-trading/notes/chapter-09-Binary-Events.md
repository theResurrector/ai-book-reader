# Chapter 9 — Binary Events
## The Unlucky Investor's Guide to Options Trading

---

## 1. Concept Summary

Chapter 9 introduces **binary events** — a predictable, scheduled subclass of IV expansion-and-contraction cycles that are distinct from the unexpected volatility spikes covered in earlier chapters.

**What is a binary event?** A known, upcoming, scheduled event anticipated to cause a large price move in a specific asset. Examples: quarterly earnings reports, Fed press conferences, elections, product announcements, oil market reports. The "binary" label refers to the two possible outcome states: price either stays within expectations or exceeds them.

**The mechanics:**
1. Because the event date is known, demand for options expiring on or after the event rises in the days and weeks beforehand → IV inflates above baseline
2. Once the outcome is known, the uncertainty resolves → IV crushes immediately back to non-event levels

**The central argument:** Despite this seemingly exploitable IV crush, binary events do **not** reliably produce consistent short-premium profits. The magnitude of the post-event price move is unpredictable, and a large gap in either direction can inflict delta losses that far exceed the credit collected plus the IV crush gain.

**The EMH explanation:** Binary events are well-understood by the entire market. Any consistent edge gets arbitraged away — options around binary events are efficiently priced, meaning the inflated IV tends to correctly price the uncertainty of what will actually happen.

**Practical role:** Binary event trades should be treated as **high-risk engagement tools**, not core profit drivers. They are capital-efficient (short duration, rapid IV resolution) and educational (practice adjusting positions under rapidly changing conditions), but position sizes must be kept exceptionally small.

---

## 2. Key Concepts

### The IV Expansion-Crush Cycle (Predictable Timing, Unpredictable Magnitude)

Binary events create IV cycles that are predictable in *timing* but not in *magnitude* of the underlying price move. This is the critical distinction:

| Characteristic | Binary Event IV Cycle | Unexpected IV Spike (Chs. 2–6) |
|---|---|---|
| Timing | Known in advance | Unknown |
| IV direction (pre-event) | Always up | Up (from fear) |
| IV direction (post-event) | Always crushes | Reverts over time |
| Post-event price move | Unpredictable magnitude | Unpredictable |
| Statistical edge | Weak — efficiently priced | Exploitable via consistent short premium |

### The High-POP / Negative Expected Value Paradox

The GOOGL data in Table 9.3 is the clearest demonstration in the book of a paradox introduced in earlier chapters: **high POP does not guarantee positive expected value**.

| Underlying | Day After POP | Day After Avg P/L |
|---|---|---|
| AAPL | 72% | +$85 |
| AMZN | 65% | +$99 |
| GOOGL | 75% | **–$60** |

GOOGL wins 75% of the time yet loses money on average. The 25% of losses are so large that they more than offset the gains across all winning trades. CVaR for GOOGL is –$4,639 at "Day After" — a tail loss of over 46× the average P/L.

### Small Sample Size Warning

Binary events for any given underlying are rare:
- AAPL has reported earnings ~100 times since the mid-1990s
- Fed press conferences: 8 per year
- Elections: every 2–4 years

This means all statistics in Tables 9.1–9.3 carry extremely wide confidence intervals. The 15 years of earnings data (~60 events per underlying) is directionally informative, but conclusions must be held lightly. The author explicitly warns against drawing strong strategic conclusions from this data.

### Earnings Trades: The Standard Structure

The specific structure tested throughout this chapter:
- **Entry:** Day before earnings announcement
- **Structure:** Short 16Δ strangle on a 45-DTE contract
- **Exit:** Typically the day after earnings (to capture IV crush, limit delta exposure)
- **Close timing options tested:** Day after, 5 days after, 10 days after, 20 days after

---

## 3. All Figures Explained

### Figure 9.1 — IV Indexes for AMZN and AAPL Around Earnings (2017–2020)

Two vertically stacked panels showing asset-specific implied volatility indexes from January 2017 to January 2020. Each earnings date is marked with a gray filled circle on the IV line.

**Panel (a) — AMZN IV (VXAZN)**
- Y-axis: VXAZN, approximately 5 to 60
- Pattern: VXAZN reliably spikes to a local maximum on or just before each earnings circle, then drops immediately after
- Notable peaks: ~40 (early 2018), ~45 (mid-2018), ~51–55 (late 2018); 2019 range approximately 25–40
- The spike-and-crush pattern is mechanically consistent across every earnings event in the window

**Panel (b) — AAPL IV (VXAPL)**
- Y-axis: VXAPL, approximately 13 to 52
- Pattern: Same consistent pre-earnings spike and immediate post-earnings crush
- AAPL reports quarterly → circles appear ~every 3 months
- Major outlier spike: ~47–52 around late 2018 / early 2019 (Apple's revenue warning period)
- Other earnings peaks: ~23 to ~35

**Author's conclusion:** Both panels confirm the binary event IV expansion-contraction pattern is mechanically predictable in timing. The IV reliably spikes before each earnings date and immediately collapses after. This is what makes the IV crush trade appealing in theory — and what the market has fully priced in.

---

## 4. All Tables (Complete Data)

### Table 9.1 — AAPL Earnings Strangles (2005–2020)
**45-DTE 16Δ strangles, opened day before earnings, closed at varying intervals after**

| Close Timing | POP | Avg P/L | Std Dev | CVaR (5%) |
|---|---|---|---|---|
| Day After | **72%** | **+$85** | $203 | –$405 |
| 5 Days After | 70% | +$43 | $400 | –$1,027 |
| 10 Days After | 61% | +$60 | $408 | –$1,025 |
| 20 Days After | 56% | **–$34** | $660 | –$1,976 |

**Reading this table:**
- AAPL is the most favorable of the three underlyings for earnings strangles — the only one with positive avg P/L at "Day After" and the smallest std dev and CVaR
- Performance degrades significantly with holding time: 72% → 56% POP, +$85 → –$34 avg P/L over 20 days
- The "Day After" profile is the only one with CVaR below –$1,000, reinforcing that early exit is essential
- Even at its best (Day After), CVaR is 4.8× the average P/L — the tail risk is large relative to the typical win

---

### Table 9.2 — AMZN Earnings Strangles (2005–2020)
**45-DTE 16Δ strangles, opened day before earnings, closed at varying intervals after**

| Close Timing | POP | Avg P/L | Std Dev | CVaR (5%) |
|---|---|---|---|---|
| Day After | **65%** | **+$99** | $803 | –$1,927 |
| 5 Days After | 65% | +$85 | $842 | –$2,154 |
| 10 Days After | 72% | +$1 | $1,446 | –$4,416 |
| 20 Days After | 76% | +$78 | $1,540 | –$4,477 |

**Reading this table:**
- AMZN has the highest average profit at "Day After" (+$99) but paired with a very large std dev ($803) — nearly 4× AAPL's std dev at the same close timing
- CVaR at Day After is –$1,927 — 19.5× the average P/L; the risk-to-reward ratio is extremely poor
- The paradox at 10 and 20 days: POP rises to 72–76% while avg P/L collapses to +$1 and CVaR deepens to –$4,477
- AMZN is a high-variance, low-edge binary event trade at every holding period

---

### Table 9.3 — GOOGL Earnings Strangles (2005–2020)
**45-DTE 16Δ strangles, opened day before earnings, closed at varying intervals after**

| Close Timing | POP | Avg P/L | Std Dev | CVaR (5%) |
|---|---|---|---|---|
| Day After | **75%** | **–$60** | $1,320 | –$4,639 |
| 5 Days After | 67% | –$113 | $1,358 | –$4,724 |
| 10 Days After | 65% | –$122 | $1,275 | –$3,675 |
| 20 Days After | 71% | –$2 | $1,584 | –$4,909 |

**Reading this table:**
- GOOGL is the starkest example of the high-POP / negative-EV paradox: **75% POP at Day After yet –$60 average P/L**
- The avg P/L is negative at every holding period except 20 days (–$2, essentially zero)
- CVaR ranges from –$3,675 to –$4,909 — catastrophic tail exposure relative to near-zero expected returns
- GOOGL earnings strangles have no holding period at which they offer a favorable risk-adjusted profile

---

### Cross-Underlying Comparison at "Day After" (Best Timing)

| Underlying | POP | Avg P/L | Std Dev | CVaR (5%) | CVaR / Avg P/L Ratio |
|---|---|---|---|---|---|
| AAPL | 72% | +$85 | $203 | –$405 | **4.8×** |
| AMZN | 65% | +$99 | $803 | –$1,927 | **19.5×** |
| GOOGL | 75% | –$60 | $1,320 | –$4,639 | **N/A (negative EV)** |

**Takeaway:** Only AAPL shows any case for a favorable earnings trade at Day After, and even then the tail risk is nearly 5× the average gain. AMZN and GOOGL offer no compelling case for any holding period.

---

## 5. Practical Rules

1. **Binary event trades occupy spare capital only** — Never use primary portfolio allocation; reserve these for excess buying power
2. **Position size must be exceptionally small** — If the normal position is 5 lots, the earnings trade is 1–2 lots maximum
3. **Open day before, close day after** — This is the optimal window: captures the majority of the IV crush, limits delta exposure from prolonged post-event price movements
4. **Do not hold binary event positions beyond "day after"** — Tables 9.1–9.3 uniformly show that extended holding increases std dev and CVaR while providing little or no improvement in avg P/L
5. **Do not draw strong conclusions from historical statistics** — Small sample sizes (as few as 60 earnings events per stock over 15 years) mean all statistics carry wide confidence intervals
6. **Monitor closely** — Binary event trades move fast; the short timescale and rapid volatility changes require active attention during the hold period
7. **Do not treat earnings trades as core positions** — They are structured, managed, and risk-profiled differently from SPY/QQQ/GLD strangles

---

## 6. Why Binary Events Are Worth Doing Despite Weak Edge

The author provides two reasons to trade binary events despite the lack of consistent statistical edge:

1. **Capital efficiency:** IV contractions around binary events are among the fastest and most predictable in the market. Capital is deployed for 1–2 days and rapidly recycled. During earnings season, a single week can present 20+ opportunities.

2. **Educational value:** Binary events force position monitoring and adjustment under rapidly changing conditions — good practice for the skills needed in unexpected volatility events. They are described as a learning tool for newer traders to practice active position management.

---

## 7. Connections to Prior Chapters

### Chapter 2 — IV Expansion and Contraction
Chapter 9 is the scheduled, predictable version of Chapter 2's IV expansion events. The mechanics are identical (demand for options → IV inflation → resolution → IV crush). The key difference is that binary events have a known date, creating concentrated pre-event IV buildup rather than sudden unexpected spikes. Chapter 2's principle that IV reverts to baseline after expansion applies directly here.

### Chapter 3 — Trading Short Premium and POP
The high-POP / negative-EV paradox in GOOGL's data (Table 9.3) is the clearest empirical demonstration in the book of the Chapter 3 warning: **POP is not expected value**. A 75% probability of winning means nothing if the 25% of losses are catastrophic. This reinforces the Chapter 3 lesson that short premium positions have bounded gains and potentially unbounded losses.

### Chapter 4 — Buying Power Reduction
The exceptionally small position sizing rule (1–2 lots vs. 5 lots normal) maps directly to BPR management. Earnings strangles on high-IV single stocks require substantial BPR per lot; capping at 1–2 lots keeps the BPR commitment proportionally tiny relative to the portfolio.

### Chapter 5 — Constructing a Trade: Strike Selection
The 16Δ, 45-DTE strangle benchmark from Chapter 5 is used throughout Chapter 9 for comparability. The chapter does not test alternative structures (straddles, defined risk spreads) around earnings — a gap noted in the digest but left open intentionally.

### Chapter 7 — Core vs. Supplemental Positions
Chapter 7 classified earnings trades as **supplemental** (capped at 25% of short premium capital, stock underlyings, higher risk/reward). Chapter 9 narrows this further: earnings trades are the highest-risk end of the supplemental category and should receive even less capital than a typical stock strangle.

### Chapter 8 — POP-Weighted Allocation
Chapter 8's Kelly framework assigns higher capital to higher-POP trades. Applied naively to GOOGL (75% POP), it would suggest more capital — but Chapter 9's avg P/L data shows this would be wrong. This demonstrates a limitation of POP-weighting: POP alone doesn't capture whether the expected value is positive, only the win frequency.

### Chapter 1 — EMH
Chapter 1 introduced the Efficient Market Hypothesis as the foundational assumption of the book. Chapter 9 invokes EMH to explain why binary events lack exploitable edge: because everyone knows when earnings are, the market efficiently prices in that uncertainty in advance. This is the same semi-strong EMH applied in Chapter 1 to justify the short premium approach over directional prediction.

---

## 8. Key Takeaways

1. **Binary events produce predictable IV expansion before and IV crush after** — but the magnitude of the underlying price move is not predictable, so the edge is weak
2. **EMH applies:** Binary events are efficiently priced by the market; consistent edge is arbitraged away
3. **The "Day After" close is the optimal window** — captures most of the IV crush, minimizes prolonged delta exposure; performance uniformly deteriorates at 5, 10, and 20 days
4. **AAPL is the most favorable** of the three underlyings tested (72% POP, +$85 avg P/L, –$405 CVaR at Day After), but even it has a 4.8× CVaR/P/L ratio
5. **GOOGL is the starkest failure case:** 75% POP yet negative avg P/L at every holding period — a textbook demonstration that high POP ≠ positive expected value
6. **Position size must be 1–2 lots** where the normal position would be 5 lots — binary event trades are supplemental to spare capital only
7. **Small samples = wide confidence intervals** — 15 years of quarterly earnings data (~60 events per stock) is insufficient for high-confidence conclusions; treat all statistics directionally
8. **Capital efficiency and learning value** are the primary reasons to trade binary events, not a statistical edge in average P/L

---

## 9. New Glossary Terms (Chapter 9)

| Term | Definition |
|------|------------|
| Binary event | A known, scheduled event anticipated to cause a large price move in a specific asset (earnings, Fed, elections, product launches) |
| IV crush | Rapid contraction of implied volatility immediately after a binary event outcome is known |
| Earnings trade | Short strangle opened day before earnings, closed day after; standard binary event trade structure |
| VXAZN | Amazon-specific implied volatility index |
| VXAPL | Apple-specific implied volatility index |
| High-POP / negative-EV paradox | A trade configuration where POP is high but average P/L is negative because losses in the tail are large enough to offset frequent gains |
