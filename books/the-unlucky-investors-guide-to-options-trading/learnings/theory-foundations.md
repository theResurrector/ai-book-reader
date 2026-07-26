# Theory Foundations — The Unlucky Investor's Guide to Options Trading

> Reference document for the conceptual scaffolding the entire book is built on.
> Source: all 10 chapters. Strict book-only content.

---

## Part 1 — The 8 Core Models

---

### Model 1: Black-Scholes (1973)

**What it is:** The foundational equation for pricing European options. Given five observable inputs, it produces a fair theoretical price.

**The five inputs:**
| Input | Symbol | What it controls |
|---|---|---|
| Spot price | S | How far the underlying is from the strike right now |
| Strike price | K | The price level the contract is written at |
| Volatility | σ | The magnitude of expected price movement |
| Risk-free rate | r | Time value of money (discounting) |
| Time to expiration | T−t | How long the option has left to move ITM |

**The formula (European call):**
$$C(S,t) = N(d_1)S - N(d_2)Ke^{-r(T-t)}$$

**Why it matters for short premium:** Running it forwards prices the option. Running it backwards — plugging in the market's actual price and solving for σ — gives **implied volatility**. IV is the market's perceived risk embedded in the option price. The entire short premium edge rests on IV systematically overstating realized volatility 87% of the time (for SPY, 2016–2021).

---

### Model 2: Geometric Brownian Motion (GBM)

**What it is:** The stochastic process that Black-Scholes assumes governs stock price movement.

**The equation:**
$$dS(t) = S(t)(\mu\, dt + \sigma\, dW(t))$$

- `μ dt` — deterministic drift: the expected return pulling price upward over time
- `σ dW(t)` — random noise: unpredictable, normally distributed shocks at each step (Wiener process)

**Why it matters for short premium:** GBM implies that price moves are independent from one moment to the next, and that large moves are rare relative to small ones. This is the mathematical justification for why short premium has statistical edge — the model says extreme moves (which hurt short sellers) happen less often than moderate ones. It also explains why IV can systematically overstate realized moves: the market prices in fear of tail events that GBM says are low-probability.

---

### Model 3: Normal / Log-normal Distribution

**What it is:** Two related distribution models for stock returns and prices.
- **Log returns** are approximately **normally distributed** (bell curve, symmetric around zero)
- **Stock prices** are **log-normally distributed** (can't go below zero; long right tail)

**The key numbers:**
| Range | Probability |
|---|---|
| Within ±1σ | 68.3% |
| Within ±2σ | 95.5% |
| Within ±3σ | 99.7% |

**Why it matters for short premium:** The entire probability framework — expected move cones, delta as probability of expiring ITM, POP calculations — is derived from this distribution. A 16Δ short strangle has 81% POP because the normal distribution says there's an 81% chance price stays between the two strikes. The fat tails in actual SPY data (leptokurtic, slightly negatively skewed) are why CVaR matters: the model *understates* extreme losses.

---

### Model 4: Efficient Market Hypothesis — Semi-Strong Form

**What it is:** The assumption that market prices reflect all *publicly available* information at all times. No trader can consistently earn excess returns by analyzing public data because it's already priced in.

**The three forms:**
- Weak: prices reflect past price history only
- **Semi-strong (the book's assumption):** prices reflect all public information
- Strong: prices reflect even insider information

**Why it matters for short premium:** Semi-strong EMH eliminates any directional edge — you cannot reliably predict *where* price will go using public information. The book's edge comes instead from the *volatility dimension*: IV is systematically priced higher than realized volatility. This isn't a contradiction of EMH — it's the market fairly pricing fear and insurance demand. The short premium trader profits from the premium between what fear costs and what reality delivers.

---

### Model 5: The Greeks (Δ, Γ, θ)

**What it is:** Partial derivative measures of how an option's price changes with respect to different variables.

**Delta (Δ):** `∂V/∂S` — change in option price per $1 move in the underlying
- Ranges from −1 to +1
- ATM ≈ 0.50; deep ITM ≈ 1.00; deep OTM ≈ 0.00
- Doubles as approximate probability of expiring ITM
- Short premium target: 16–20Δ (16–20% probability of finishing ITM)

**Gamma (Γ):** `∂Δ/∂S = ∂²V/∂S²` — rate of change of delta per $1 move
- Highest at ATM; highest near expiration
- Short positions: Γ < 0 (delta moves against you as price moves)
- Gamma risk is why the last 21 DTE of a 45-DTE contract becomes dangerous

**Theta (θ):** `∂V/∂t` — daily change in option price due to time decay
- Short positions: θ > 0 (you earn theta every day the option loses extrinsic value)
- Highest at ATM and near expiration

**The Gamma/Theta trade-off:** These always move in opposition. High theta (large daily earnings) = high gamma (large risk if price moves). You cannot have one without the other. This trade-off is the central tension of short premium management.

**Why it matters for short premium:** Greeks are the real-time dashboard. Delta tells you your directional exposure, gamma tells you how fast that exposure is growing, theta tells you how much you're earning per day. Beta-weighted delta (Δ × β) aggregates directional exposure across a multi-underlying portfolio.

---

### Model 6: VaR and CVaR

**What it is:** Two related risk measurement frameworks for quantifying potential losses.

**Value at Risk (VaR):** The maximum expected loss at a given confidence level.
- Example: SPY 5% VaR = −1.65% per day. SPY lost *more* than 1.65% on only 5% of trading days (2010–2021).

**Conditional VaR (CVaR / Expected Shortfall):** The *average* loss on those worst-case days beyond the VaR threshold.
- Example: SPY 5% CVaR = −2.7% per day. On the worst 5% of days, the average loss was −2.7%.

**Why CVaR is preferred for short premium:** Short options P/L is negatively skewed with heavy left tails. VaR only tells you the *minimum* threshold of a bad day; CVaR tells you how bad those bad days actually are on average. For comparing management strategies, the book uses CVaR exclusively (e.g., 21 DTE management: CVaR −283% vs. hold to expiration: CVaR −708%).

---

### Model 7: Beta and Correlation / Covariance

**What it is:** A family of tools from portfolio theory measuring how assets move relative to each other.

**Beta (β):**
$$\beta = \frac{\text{Cov}(R_i, R_m)}{\text{Var}(R_m)}$$
Measures a stock's volatility relative to the market (SPY). β > 1 = amplified market moves; β < 0 = inverse.

**Correlation (ρ):**
$$\rho_{XY} = \frac{\text{Cov}(X,Y)}{\sigma_X \sigma_Y}$$
Normalized to [−1, +1]. Real examples: SPY/QQQ ρ = 0.88 (nearly identical); SPY/TLT ρ = −0.41 (inverse); SPY/GLD ρ = 0.00 (unrelated).

**Portfolio Variance:**
$$\text{Var}(X+Y) = \text{Var}(X) + \text{Var}(Y) + 2\text{Cov}(X,Y)$$
Negative covariance (uncorrelated or inverse assets) directly reduces total portfolio variance.

**Why it matters for short premium:**
- **Beta-weighted delta** (bD = Δ × β) converts all position deltas to units of $1 SPY move, making them additive across a multi-underlying portfolio. Target: bD ≈ 0 (market neutral).
- **Correlation drives diversification value.** SPY+QQQ at 0.88 correlation → 67% conditional compound loss rate when SPY has an outlier. SPY+GLD at −0.03 → only 2.1% simultaneous loss rate.
- **Correlations strengthen in crashes** — calm-period matrices understate crisis values. Always maintain small position sizes as the last line of defense.

---

### Model 8: Kelly Criterion

**What it is:** A formula from information theory (Kelly, 1956) adapted by the book for options capital allocation.

**The book's adapted formula:**
$$f = r \times \frac{DTE}{365} \times \frac{POP}{1-POP}$$

Where r ≈ 3% (risk-free rate), DTE = contract duration, POP/(1−POP) = the odds ratio of the trade.

**POP/(1−POP) intuitively:** The ratio of "times you win" to "times you lose." A trade with 84% POP has odds of 84/16 = 5.25 — for every loss, you expect 5.25 wins. Higher POP → higher Kelly weight → larger allocation.

**Worked example (six-ETF portfolio):** GLD at 84% POP gets the 7% cap. All other positions are scaled proportionally relative to GLD's Kelly weight. SPY and QQQ — being correlated at 0.88 — share one combined budget (not independent allocations): SPY 3.0%, QQQ 2.2%, from a shared ~5.2%.

**Why it matters for short premium:** Kelly provides a mathematically principled reason to allocate *more* capital to higher-POP trades and *less* to lower-POP trades, rather than equal-weighting. It's a portfolio initializer, not a dynamic rebalancer — ongoing Greek management (bD ≈ 0, theta ratio 0.05–0.1%) handles live adjustment.

---

## Part 2 — The 4 Biggest Debates

---

### Debate 1: Defined Risk vs. Undefined Risk

**The question:** Should you use capped-loss strategies (iron condors, spreads) or uncapped strategies (strangles, naked puts/calls)?

**Strongest argument FOR undefined risk (strangles):**
Higher POP, higher credit collected, and lower BPR relative to spread width. A 16Δ strangle earns 81% POP and $44 avg profit. The book's empirical data shows the default allocation is 75% undefined — it's the workhorse strategy because the statistics favor it.

**Strongest argument FOR defined risk (iron condors):**
In low-IV environments, BPR for undefined risk expands dramatically (low IV → strikes closer to ATM → larger potential losses → more capital reserved). Defined risk caps the maximum loss at spread width minus credit, making BPR fixed and predictable. Wide, high-POP iron condors have comparable risk profiles to strangles and can occupy undefined risk portfolio capital.

**Book's verdict:** 75% undefined / 25% defined as a baseline. The split is IV-dependent: high IV → lean undefined (better credits, lower BPR). Low IV → lean defined (BPR efficiency, controlled max loss). Not ideological — mechanical.

---

### Debate 2: Active Management vs. Hold to Expiration

**The question:** Should you close positions early (21 DTE and/or 50% profit target) or hold through expiration?

**Strongest argument FOR active management (21 DTE / 50% profit):**
Holding to expiration roughly doubles CVaR: −708% vs. −283% at 21 DTE. Average daily P/L is 24% higher under active management ($1.60/day vs. $1.29/day) because capital recycles faster into fresh 45-DTE contracts with more extrinsic value and lower gamma. The combined "21 DTE or 50% profit, whichever first" strategy achieves: POP 81%, CVaR −288%, avg daily P/L $1.67 — the best all-around profile in the backtest.

**Strongest argument FOR holding to expiration:**
The 2018–2019 backtest showed expiration-managed strangles outperforming 21 DTE management by ~93%. Moderate, repeated IV spikes aligned precisely with the 21 DTE closure window — actively managed positions were closed at the exact moment of maximum IV, locking in losses. Expiration holders waited, outlasted the spikes, and profited from reversion. Path dependence is extreme: a one-month shift in start date in 2020 completely reversed which strategy won.

**Book's verdict:** Active management (21 DTE or 50% profit) wins on expected value and risk-adjusted metrics across most environments. But the 2018–2019 case is a genuine counterexample — the book warns that the real principle is *consistency*, not optimality. A rule you can execute without exception across all conditions beats one you abandon under stress.

---

### Debate 3: Stocks vs. ETFs as Underlyings

**The question:** Should your core positions be on single stocks (AAPL, AMZN, GOOGL) or ETFs (SPY, QQQ, GLD, TLT)?

**Strongest argument FOR stocks:**
Higher IV means dramatically more premium collected per trade: $400–$1,100 avg profit per strangle vs. $30–$160 for ETFs. For traders who need meaningful P/L with a small number of positions (small accounts), stocks are the only viable option. The book's own data shows consistent 76–83% POP across both categories — so the win rate is comparable.

**Strongest argument FOR ETFs:**
Company-specific risk (earnings surprises, fraud, sector collapse, FDA rulings) is entirely absent from ETFs. Stocks carry 3–4× larger average losses and 3–8× larger CVaR than ETFs on the same strategy. ETFs provide genuine uncorrelated diversification: GLD vs. SPY ρ = −0.03, TLT vs. SPY ρ = −0.41. Diversification is the single most important portfolio risk tool — and stocks don't provide it relative to other stocks.

**Book's verdict:** ETFs are core (SPY, QQQ, GLD, TLT, FXE, XLU) — minimum 75% of short premium allocation. Stocks are supplemental, capped at 25%. The higher credits don't justify the CVaR asymmetry as a primary allocation. Stocks are used for profit enhancement, not as a foundation.

---

### Debate 4: Stop Losses — Use Them or Don't

**The question:** Should you set stop losses on short premium positions to cap downside?

**Strongest argument FOR stop losses:**
They do reduce CVaR in backtests. A −200% stop (close when position loses 2× the initial credit collected) triggers only 13% of the time and cuts CVaR to −338%. This is only marginally worse than pure 21 DTE management (CVaR −283%) but provides a safety net for traders who cannot manage positions actively every day.

**Strongest argument AGAINST stop losses:**
A −50% stop triggers 40% of the time, collapsing POP from 81% to 58% and statistically destroying the edge. The core problem: stop losses turn recoverable drawdowns into realized losses. Short premium positions that go against you are often mid-spike — IV is elevated, the position looks bad, but if held (or managed at 21 DTE), reversion often rescues it. Closing at −50% during an IV expansion is the worst possible timing. Additionally, stop losses cannot guarantee execution at the trigger price — overnight gap moves bypass them entirely.

**For defined risk positions specifically:** Stop losses are always wrong. An iron condor's maximum loss is capped; it can and does recover. Closing a defined risk loser early turns a potentially recoverable position into a guaranteed loss.

**Book's verdict:** Stop losses are incompatible with the short premium system as a primary rule. 21 DTE management already handles tail risk more effectively without destroying POP. If used at all, −200% is the practical minimum threshold. Never on defined risk positions.
