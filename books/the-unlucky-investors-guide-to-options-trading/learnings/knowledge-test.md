# Knowledge Test — The Unlucky Investor's Guide to Options Trading

> Test yourself before checking the answers. Cover the answers section below and work through each question from memory.
> Theory questions target the 8 core models. Application questions put you in real trade scenarios.

---

## Part A — Theory

**1.** What are the 5 inputs to Black-Scholes and what does each one control?

**2.** How is implied volatility derived from Black-Scholes, and why does it differ from historical volatility?

**3.** What does GBM's equation `dS = S(μdt + σdW(t))` mean in plain English? What are its two components and what does each represent?

**4.** What does semi-strong EMH mean for options traders — what edge does it allow, and what edge does it eliminate?

**5.** Why are stock *prices* modeled as log-normal rather than normal? What breaks if you model prices as normally distributed?

**6.** What is the relationship between Gamma and Theta? Why can't you have high theta without high gamma?

**7.** Why is CVaR preferred over VaR for measuring short options risk? What does VaR miss that CVaR captures?

**8.** The Kelly formula gives `f = r × (DTE/365) × POP/(1−POP)`. What does POP/(1−POP) represent intuitively, and why does it make correlated pairs (SPY + QQQ) share one budget instead of getting independent allocations?

---

## Part B — Application

**1.** VIX is at 35. What is your maximum short premium allocation? What does a VIX of 35 do to your BPR per trade relative to VIX at 15, and why?

**2.** You have a 45-DTE 16Δ SPY strangle. It's now at 21 DTE with 40% of the initial credit remaining (not yet at 50% profit). Do you close or hold? Justify using two separate reasons from the book.

**3.** Your portfolio beta-weighted delta is +0.8 (net bullish). Theta ratio is 0.07%. Your positions are within normal size limits. What do you do, and what specific actions can you take?

**4.** GOOGL earnings strangles historically show 75% POP over 60 earnings events. Is this a good trade? What does the actual data say, and what principle does the GOOGL case illustrate?

**5.** A short strangle has hit −200% of initial credit. What do you do? Now answer the same question for an iron condor that has lost −200% of its initial credit. Why are the answers different?

**6.** You want to add both SPY and QQQ strangles to your portfolio and you're inclined to give each its own full 7% allocation. What's wrong with this? What should you do instead, and why?

**7.** IV spikes from 18 to 45 overnight on one of your underlyings. You have an open 16Δ strangle on it. What has happened to the delta of your short strikes, and what are your two main options for responding?

**8.** A friend argues: "Managing at 21 DTE is strictly better than holding to expiration — the data shows lower CVaR AND better average daily P/L." Is this claim fully correct? What is the strongest counterexample from the book, and what does it reveal about backtesting?

---

---

## Answers

*(Scroll past this line only after you've answered from memory.)*

---

### Part A — Theory Answers

**A1. Black-Scholes inputs:**
- **S (spot price):** current price of the underlying — determines how far the strike is from current price (moneyness)
- **K (strike price):** the price level the contract is written at
- **σ (volatility):** the magnitude of expected price movement — the most important and only unobservable input
- **r (risk-free rate):** time value of money; used to discount the strike price
- **T−t (time to expiration):** how long the option has remaining; more time = more extrinsic value

**A2. Implied volatility:**
IV is derived by plugging the option's *actual market price* back into Black-Scholes and solving for σ — the one input that cannot be directly observed. Historical volatility is the realized standard deviation of past returns (backward-looking). IV is the market's *forward-looking* perception of risk, driven by supply and demand for options (insurance). IV systematically exceeds historical volatility because fear is priced in: buyers pay a premium for protection that the market rarely needs to deliver.

**A3. GBM equation:**
- `μ dt` — the **deterministic drift** component: the expected return pulling price upward over time; predictable
- `σ dW(t)` — the **random noise** component: unpredictable, normally distributed shocks at each step via Wiener process
In plain English: every tiny price change is the sum of a small predictable upward trend plus an unpredictable random shock. Neither the drift nor the volatility is directly observable — both are estimated.

**A4. Semi-strong EMH:**
- **Eliminates:** any directional edge from analyzing public information. You cannot reliably predict whether a stock will go up or down using publicly available data — it's already priced in.
- **Allows:** a volatility edge. IV is systematically priced higher than realized volatility because the market fairly prices *fear and insurance demand*, not actual move magnitude. Selling that overpriced fear is not a contradiction of EMH — it's exploiting the gap between perceived risk (IV) and realized risk (actual moves).

**A5. Log-normal vs. normal for prices:**
Stock prices cannot go below zero — a normal distribution extends to −∞, which would imply negative stock prices. Log-normal prices (derived from normally distributed log returns) are bounded at zero and have a long right tail, matching observed price behavior. If you model prices as normal, your probability calculations for OTM strikes can produce nonsensical results (negative probabilities or stock prices) for large moves.

**A6. Gamma and Theta:**
They are mathematical siblings — both peak at ATM and near expiration, and they always move in the same direction in magnitude (both increase as you approach ATM and expiration). For short positions, high theta (large daily earnings from time decay) necessarily comes with high gamma (large sensitivity to underlying price moves). You cannot selectively have one without the other. This is why the theta ratio ceiling (0.2%) is the practical proxy for detecting excessive hidden gamma risk in a portfolio.

**A7. CVaR vs. VaR:**
VaR only tells you the *minimum threshold* of a bad day — "you lost more than X on 5% of days." It says nothing about *how much worse* those bad days can get. For short options, the P/L distribution has a heavy left tail (negative skew): the worst losses are much larger than the VaR threshold suggests. CVaR (Expected Shortfall) measures the *average loss* on those worst days, capturing the tail's severity. For comparing management strategies (e.g., 21 DTE CVaR −283% vs. expiration CVaR −708%), CVaR is the only meaningful metric.

**A8. Kelly's POP/(1−POP):**
POP/(1−POP) is the **odds ratio** — the ratio of expected wins to expected losses. A trade with 84% POP: 84/16 = 5.25 (for every loss, expect 5.25 wins). Higher odds → larger allocation. Correlated pairs (SPY + QQQ at ρ = 0.88) must share one combined budget because when SPY has an outlier loss, QQQ loses simultaneously 67% of the time. Treating them as independent and giving each a full Kelly allocation would dramatically overstate the portfolio's true diversification and risk capacity.

---

### Part B — Application Answers

**B1. VIX at 35:**
Max allocation: **40%** of buying power to short premium (VIX 30–40 band). At VIX 35, BPR per trade is *lower* than at VIX 15. When IV is high, option strikes at a given delta (e.g., 16Δ) are placed further OTM — the expected loss from a 20% move or 10% strike breach is smaller in relative terms, so the broker reserves less capital per trade. High IV environments are doubly favorable: better credits *and* more capital-efficient (more simultaneous positions possible).

**B2. Close at 21 DTE with 40% remaining:**
**Close.** Two reasons: (1) **Time rule:** 21 DTE is the unconditional close point — the position has reached its DTE midpoint regardless of profit. (2) **Risk deterioration:** The final 21 DTE carries disproportionate gamma risk — CVaR roughly doubles from −283% to −708% if held to expiration while average P/L only improves from 21% to 28%. The risk/reward of the remaining extrinsic value is not worth the gamma exposure. The 40% remaining credit is a small reward relative to the risk of holding through the high-gamma zone.

**B3. Beta-weighted delta +0.8, theta 0.07%:**
Theta is within range (0.05–0.1% target), so no position sizing changes needed. The directional skew is the problem — bD of +0.8 means the portfolio profits if the market rises and loses if it falls. To neutralize: add **negative bD** positions. Options: (a) sell calls on positive-beta underlyings (e.g., short SPY call), (b) sell puts on negative-beta underlyings (e.g., short TLT put), or (c) close existing positions that are contributing the positive bD skew and reopen them delta-neutral.

**B4. GOOGL earnings at 75% POP:**
This is a **negative EV trade** despite the high POP. Historical data (2005–2020): 75% POP but average P/L = **−$60** per trade. The tail losses (CVaR −$4,639) are so large they overwhelm the 75% win rate. This is the book's central lesson: **high POP ≠ positive expected value.** POP tells you how often you win; it says nothing about *how much* you win vs. *how much* you lose. Both matter. If you trade GOOGL earnings at all, it's 1–2 lots maximum with spare capital — never primary allocation.

**B5. −200% loss: strangle vs. iron condor:**
- **Short strangle:** This is the practical stop-loss threshold the book acknowledges. At −200%, the position has lost 2× what you initially collected. The book says this triggers only 13% of the time. Whether to close is a judgment call — −200% is the minimum threshold worth considering, but the primary rule is 21 DTE management, not stop losses.
- **Iron condor:** **Do not close.** Maximum loss is fixed and capped at (spread width − credit) × 100. A defined risk position cannot blow up further. It can recover as IV contracts or price reverts. Closing an iron condor at −200% of initial credit turns a potentially recoverable drawdown into a guaranteed loss. Run it to expiration.

**B6. SPY + QQQ at 7% each:**
Wrong — they share a single Kelly budget. SPY and QQQ have ρ = 0.88. When SPY has an outlier loss, QQQ loses simultaneously 67% of the time. Giving each a full 7% independent allocation treats them as uncorrelated, which dramatically understates combined risk. The correct approach: combine their Kelly allocations into one shared budget (e.g., ~5.2% total), then split proportionally by their individual Kelly weights (SPY ~3%, QQQ ~2.2%). They count as one position for risk purposes.

**B7. IV spikes from 18 to 45:**
When IV rises, strikes at a given delta move further OTM. Your existing 16Δ short strikes are now much closer to ATM — their delta has increased significantly (maybe now 25–35Δ). The position is no longer at the original risk profile. Two main options: (1) **Close and reopen:** buy back the strangle and sell a new one at the same 16Δ target with the wider strikes that IV = 45 implies. This resets your delta target and collects the now-elevated premium. (2) **Hold and manage at 21 DTE:** accept the elevated delta as a temporary condition and let 21 DTE management handle the exit. Option 1 is preferred when IV expansion is severe — the new premium collected at higher IV more than compensates for the buyback cost.

**B8. "21 DTE is strictly better" — is it correct?**
**Not fully correct.** 21 DTE wins on CVaR (−283% vs. −708%) and average daily P/L ($1.60 vs. $1.29). But the 2018–2019 backtest showed expiration management outperforming 21 DTE by ~93%. Why: moderate IV spikes in that period repeatedly aligned with the 21 DTE closure window — positions were being closed at the exact moment of peak stress rather than being held through reversion. Expiration holders outlasted the spikes and collected full reversion profits. The lesson: backtests are path-dependent. A one-month shift in the 2020 start date completely reversed which strategy won. The book's actual principle is **consistency** — the best rule is whichever you can execute without deviation across all conditions, not whichever won in a specific historical window.
