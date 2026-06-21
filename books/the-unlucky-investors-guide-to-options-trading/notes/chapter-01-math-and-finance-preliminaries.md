# Chapter 1 — Math and Finance Preliminaries

## 1. Concept Summary

This chapter builds the entire mathematical and financial vocabulary needed to understand options trading quantitatively. It covers six major areas in sequence:

1. **What you're trading** — stocks, ETFs, and options (calls and puts), their key parameters, and how profit/loss is calculated for long and short positions.
2. **How prices move** — simple vs. log returns as the unit of comparison across assets.
3. **What the market assumes** — the Efficient Market Hypothesis and why the book adopts the semi-strong form, which means options are priced fairly based on publicly available information.
4. **How to reason about uncertainty** — probability distributions, their moments (mean, variance, skew), and the normal distribution as the workhorse model.
5. **How options are priced** — the Black-Scholes model, what it assumes, what it produces, and its most important output: **implied volatility** — the market's perception of risk baked into option prices.
6. **How to measure risk** — The Greeks (Delta, Gamma, Theta), correlation, covariance, Beta, Value at Risk (VaR), and Conditional VaR (CVaR).

The central thesis established here: **options are efficiently priced instruments whose value reflects perceived risk**. Short premium positions profit more often than long ones precisely because large, unexpected moves are rare — but when those moves happen, short positions can suffer massive losses. Risk management is therefore everything.

---

## 2. Key Equations

### Returns

**Eq 1.1 — Simple Return:**
$$R_t = \frac{S_t - S_{t-1}}{S_{t-1}}$$
The percentage change in price from one day to the next. If a stock goes from $100 to $101, simple return = (101−100)/100 = **1%**.

**Eq 1.2 — Log Return:**
$$R_t = \ln\left(\frac{S_t}{S_{t-1}}\right)$$
Same $100→$101 stock: log return = ln(101/100) = **0.00995 ≈ 0.995%**. Nearly identical to simple returns on daily timescales, but log returns are *time-additive*. The book uses simple returns throughout.

---

### Profit & Loss

**Eq 1.3 — Long Call P/L:**
$$\text{Long call P/L} = \max(0,\ S - K) - C$$

**Eq 1.4 — Long Put P/L:**
$$\text{Long put P/L} = \max(0,\ K - S) - P$$

Where S = underlying price at expiration, K = strike price, C = call premium paid, P = put premium paid. The max(0, …) function captures the fact that an option can never force you to exercise at a loss — if it's OTM, intrinsic value is 0 and you simply lose the premium.

**Worked example (long call, S=$100, K=$105, C=$1/share):**
- Underlying → $105: P/L = 100 × (($105−$105) − $1) = **−$100**
- Underlying → $110: P/L = 100 × (($110−$105) − $1) = **+$400**
- Underlying → $95: P/L = 100 × ($0 − $1) = **−$100**
- Short call P/L is the negative of each: +$100, −$400, +$100

Short trader wins 2 out of 3 scenarios — the statistical edge of short premium.

---

### Moneyness

| | Call | Put |
|--|--|--|
| **ITM** | S > K | S < K |
| **OTM** | S < K | S > K |
| **ATM** | S = K | S = K |

- Call intrinsic value = max(S − K, 0)
- Put intrinsic value = max(K − S, 0)
- **Extrinsic value** = market price − intrinsic value (decays to zero at expiration)

---

### Distribution Moments

**Eq 1.5 — Mean:**
$$\mu = \frac{1}{n} \sum_{i=1}^n x_i$$

**Eq 1.6 — Expected Value:**
$$E[X] = \sum_{i=1}^k x_i \cdot p_i$$
For two fair dice: E[D] = 2·2.78% + 3·5.56% + … + 12·2.78% = **7**

**Eq 1.7 — Variance:**
$$\sigma^2 = \frac{1}{n} \sum_{i=1}^n (x_i - \mu)^2$$
For fair dice: Var(D) ≈ **5.84**, so σ ≈ **2.4** (typical roll falls within 7 ± 2.4)

**Eq 1.8 — Alternative Variance:**
$$\text{Var}(X) = E[X^2] - E[X]^2$$

**Eq 1.9 — Skew:**
$$\text{Skew} = \frac{1}{n} \cdot \frac{\sum_{i=1}^n (x_i - \mu)^3}{\sigma^3}$$
Positive skew = long right tail; Negative skew = long left tail; Zero = symmetric.

---

### Normal Distribution

- **68.3%** of outcomes within **±1σ**
- **95.5%** within **±2σ**
- **99.7%** within **±3σ**

Central Limit Theorem: the sum of many independent random variables converges to a normal distribution. Stock log returns are assumed normally distributed under Black-Scholes.

---

### Black-Scholes Model

**Eq 1.10 — Geometric Brownian Motion:**
$$dS(t) = S(t)(\mu\, dt + \sigma\, dW(t))$$
Each tiny price change = deterministic drift + random noise. Neither μ nor σ directly observable — estimated from historical data.

**Eq 1.11 — Black-Scholes PDE:**
$$\frac{\partial C}{\partial t} + rS\left(\frac{\partial C}{\partial S}\right) + \frac{1}{2}\sigma^2 S^2\left(\frac{\partial^2 C}{\partial S^2}\right) = rC$$

**Eq 1.12 — Black-Scholes Formula (European call):**
$$C(S,t) = N(d_1)S(t) - N(d_2)K e^{-r(T-t)}$$

**Eq 1.13:**
$$d_1 = \frac{1}{\sigma\sqrt{T-t}}\left[\ln\frac{S(t)}{K} + \left(r + \frac{1}{2}\sigma^2\right)(T-t)\right]$$

**Eq 1.14:**
$$d_2 = d_1 - \sigma\sqrt{T-t}$$

**Three key takeaways from Black-Scholes:**
1. Inherent uncertainty in stock prices; movements are independent and log-normally distributed
2. Fair option price can be calculated from S, K, σ, r, and T−t
3. Volatility σ cannot be directly observed — only estimated historically or implied from market prices

**Implied Volatility:** Plugging an option's actual market price back into the formula and solving for σ gives **IV** — the market's perceived risk. Example: stock with 20% historical vol but option prices implying 28% vol → IV = **28%** (market perceives more risk than history suggests).

---

### The Greeks

**Eq 1.15 — Delta (Δ):**
$$\Delta = \frac{\partial V}{\partial S}$$
Change in option price per $1 change in underlying. Ranges −1 to +1:
- Long stock: Δ = 1
- Long call / Short put: 0 < Δ < 1 (bullish)
- Long put / Short call: −1 < Δ < 0 (bearish)
- ATM ≈ 50Δ; Deep ITM ≈ 100Δ; Deep OTM ≈ 0Δ

**Eq 1.16 — Gamma (Γ):**
$$\Gamma = \frac{\partial\Delta}{\partial S} = \frac{\partial^2 V}{\partial S^2}$$
Rate of change of delta per $1 move. Long positions: Γ > 0; Short positions: Γ < 0. Highest at ATM.

**Eq 1.17 — Theta (θ):**
$$\theta = \frac{\partial V}{\partial t}$$
Daily P/L from time decay of extrinsic value. Long: θ < 0 (loses value daily); Short: θ > 0 (gains value daily). Highest magnitude at ATM.

**Gamma/Theta trade-off:** These always move together in opposition. High gamma = more upside/profit potential but also more theta decay. A near-ATM long call gains most from large moves but bleeds value every day.

---

### Covariance and Correlation

**Eq 1.18 — Covariance:**
$$\text{Cov}(X,Y) = \frac{1}{n}\sum_{i=1}^n (x_i - \mu_X)(y_i - \mu_Y)$$

**Eq 1.20 — Correlation:**
$$\rho_{XY} = \frac{\text{Cov}(X,Y)}{\sigma_X \sigma_Y}$$
Normalized to [−1, +1]. Real examples (2010–2021): SPY/QQQ ρ = **0.88**, SPY/TLT ρ = **−0.43**, SPY/GLD ρ = **0.00**

**Eq 1.21 — Portfolio Variance:**
$$\text{Var}(X+Y) = \text{Var}(X) + \text{Var}(Y) + 2\text{Cov}(X,Y)$$
Negative correlation reduces total portfolio variance — the mathematical basis for diversification.

---

### Additional Risk Measures

**Eq 1.22 — Beta (β):**
$$\beta = \frac{\text{Cov}(R_i, R_m)}{\text{Var}(R_m)}$$
- β > 1: moves more than market
- β = 1: moves with market
- 0 < β < 1: less volatile than market
- β = 0: no market risk
- β < 0: moves inversely to market

**VaR (Value at Risk):** Maximum expected loss at a given confidence level. SPY 5% VaR (2010–2021) = **−1.65%** per day. Means SPY lost more than 1.65% on only 5% of days.

**CVaR (Conditional VaR / Expected Shortfall):** Average loss on those worst 5% of days. SPY CVaR = **−2.7%**. More conservative than VaR; preferred for short options positions with heavy negative tail exposure.

---

## 3. Figures Explained

**Figure 1.1 — Fair Dice Histogram:** 100,000 simulated two-dice rolls. Roughly triangular/symmetric, peaking at 7 (~16.7%). Introduces the concept of a probability distribution with more likely central outcomes and rare extremes.

**Figure 1.2 — Fair Dice with Mean and SD:** Same histogram with solid line at μ = 7.0 and dashed lines at μ ± σ (≈4.6 and 9.4). Visualizes what standard deviation means: ~2/3 of outcomes fall between the dashed lines.

**Figure 1.3(a) and (b) — Unfair Dice, Skew Illustrated:**
- (a) Small-number bias: shifted left, long right tail. Skew = **+0.45**
- (b) Large-number bias: shifted right, long left tail. Skew = **−0.45**
Demonstrates why ±σ becomes misleading when a distribution is asymmetric.

**Table 1.2 — Die Probabilities:** Fair die = 16.67% per face. Small-number bias = 30% to faces 2 and 3, 10% to others. Large-number bias = 30% to faces 4 and 5, 10% to others.

**Figure 1.4 — Central Limit Theorem in Action:** Three histograms for (a) 2 dice, (b) 4 dice, (c) 6 dice. Shape progressively smooths from triangular → bell curve as dice count increases. This is why stock returns (sum of many micro-events) can be approximated as normal.

**Figure 1.5 — The Normal Distribution:** Clean bell curve annotated with 68.3% / 95.5% / 99.7% probability regions at ±1σ, ±2σ, ±3σ. Segment breakdown: 34.1% each side within 1σ, 13.6% in the next band, 2.1% beyond ±2σ.

**Figure 1.6 — Brownian Motion (3 panels):**
- (a) 2D random walk of particle over 1,000 steps — wanders unpredictably
- (b) Horizontal displacements at each step — oscillates around 0 with occasional large deviations
- (c) Cumulative horizontal displacement — jagged drift that looks exactly like a stock price chart

**Figure 1.7 — Displacement Histogram:** Distribution of 1,000 Wiener process steps. Approximately normal, centered at 0, most steps between −1 and +1. Confirms the mathematical definition of a Wiener process.

**Figure 1.8 — SPY vs. Brownian Motion (3 panels):**
- (a) SPY daily returns 2010–2015: noisy oscillations around 0, but with heavier tails than pure Brownian motion predicts
- (b) SPY price 2010–2015: upward drift from ~$115 to ~$200, identical character to cumulative Brownian displacement
- (c) SPY daily returns histogram: approximately bell-shaped but leptokurtic (fat tails) and slightly negatively skewed

**Figure 1.9 — Covariance Scatter Plots (3 panels):**
- (a) QQQ vs. SPY: tight diagonal line. Cov = 1.25, ρ = **0.88** — strong positive relationship, minimal diversification benefit
- (b) TLT vs. SPY: diffuse negative slope. Cov = −0.48, ρ = **−0.43** — flight-to-safety effect; bonds rise when stocks fall
- (c) GLD vs. SPY: circular cloud. Cov = 0.02, ρ = **0.00** — gold and stocks are unrelated

**Figure 1.10 — VaR on SPY:** Daily returns histogram with dashed line at **−1.65%** (5% VaR). Everything left of this line = worst 5% of days. Most returns cluster between −1% and +2%.

**Figure 1.11 — VaR + CVaR on SPY:** Same histogram plus solid CVaR line at **−2.7%**. The gap between −1.65% and −2.7% shows how much worse-than-threshold losses average out — the extra information CVaR provides over VaR.

---

## 4. Connections

Every concept here feeds directly into later chapters:

| Concept | Used in |
|---------|---------|
| Strike / Delta / Moneyness | Ch 5 — selecting strikes when constructing trades |
| Implied Volatility | Ch 2 — entirely devoted to IV trading |
| Theta (time decay) | Ch 3 — short premium strategy is built on collecting theta |
| Gamma | Ch 6 — managing trades as gamma risk evolves |
| Beta | Ch 7 — beta-weighted delta for portfolio directional exposure |
| VaR / CVaR | Ch 8 — advanced portfolio tail risk management |
| Correlation | Ch 7 & 8 — diversification across underlyings |

**The casino analogy grounded mathematically:** The "house edge" in options selling is the statistical tendency for short premium positions to expire worthless. Large price moves (which would make long positions profitable) are low-probability events in a normally-distributed returns world. But those tail events carry outsized losses for short positions — exactly the negative skew inherent to short premium P/L profiles. Managing that tail risk is the entire point of the book.
