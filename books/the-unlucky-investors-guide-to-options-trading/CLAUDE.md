# BOOK: The Unlucky Investor's Guide to Options Trading
# SUBJECT: Options Trading / Finance

This file is the book-specific context. It loads automatically when working inside this
folder. Keep it current.

## Progress Tracker
- [x] Introduction — Why Trade Options?
- [x] Chapter 1 — Math and Finance Preliminaries
- [x] Chapter 2 — Volatility Trading and Implied Volatility
- [ ] Chapter 3 — Trading Short Premium
- [ ] Chapter 4 — Buying Power Reduction
- [ ] Chapter 5 — Constructing a Trade
- [ ] Chapter 6 — Managing Trades
- [ ] Chapter 7 — Basic Portfolio Management
- [ ] Chapter 8 — Advanced Portfolio Management
- [ ] Chapter 9 — Binary Events
- [ ] Chapter 10 — Conclusion and Key Takeaways

## Glossary
| Term | Definition |
|------|------------|
| Stock | Fractional ownership of a corporation, publicly traded |
| ETF | Exchange-traded fund; basket of securities tracking an index, sector, or commodity |
| Option | Financial derivative giving the holder the right (not obligation) to buy/sell an underlying at a strike price on or before expiration |
| Call | Right to BUY the underlying at strike K |
| Put | Right to SELL the underlying at strike K |
| Long | Purchased position (paid premium) |
| Short | Sold position (received premium) |
| Strike price (K) | The price at which the option contract can be exercised |
| Spot price (S) | Current market price of the underlying |
| DTE | Days to expiration |
| Premium (C, P, V) | Market price of the option |
| ITM | In-the-money: option has intrinsic value if exercised now |
| OTM | Out-of-the-money: no intrinsic value if exercised now |
| ATM | At-the-money: strike ≈ current price |
| Intrinsic value | The real, exercise-now value: max(S−K, 0) for calls, max(K−S, 0) for puts |
| Extrinsic value | Market price minus intrinsic value; driven by time remaining and perceived risk |
| EMH | Efficient Market Hypothesis: prices reflect available information. This book assumes semi-strong form |
| Implied Volatility (IV) | The volatility σ implied by the market price of an option via Black-Scholes; the market's perception of risk |
| Historical Volatility | Standard deviation of actual past returns; backward-looking estimate of risk |
| Delta (Δ) | Change in option price per $1 move in underlying; ranges −1 to +1 |
| Gamma (Γ) | Rate of change of delta per $1 move in underlying; highest at ATM |
| Theta (θ) | Daily P/L change due to time decay of extrinsic value; negative for long, positive for short |
| Beta (β) | Volatility of a stock relative to the overall market |
| Covariance | Measure of how two signals move relative to their means |
| Correlation (ρ) | Normalized covariance; ranges −1 to +1; measures direction AND strength of linear relationship |
| VaR | Value at Risk: maximum expected loss at a given confidence level |
| CVaR | Conditional VaR (Expected Shortfall): average loss beyond the VaR threshold |
| Brownian Motion | Wiener process: random walk with normally distributed, independent increments; model for stock price movements |
| Black-Scholes | Landmark 1973 options pricing model assuming geometric Brownian motion |
| Delta neutral | Position constructed so net delta ≈ 0; insensitive to small directional moves |

## Variables / Notation
| Symbol | Meaning |
|--------|---------|
| S | Spot price (current price of underlying) |
| K | Strike price |
| C | Price of a call option |
| P | Price of a put option |
| V | Price of an option (generic) |
| T | Expiration date |
| T−t | Time remaining to expiration |
| r | Risk-free interest rate |
| σ | Volatility (standard deviation of returns) |
| μ | Mean / drift rate |
| Δ | Delta |
| Γ | Gamma |
| θ | Theta |
| β | Beta |
| ρ | Correlation coefficient |
| W(t) | Wiener process (Brownian motion) |
| E[X] | Expected value of random variable X |
| Var(X) | Variance of X |
| Cov(X,Y) | Covariance of X and Y |
| N(d) | Cumulative standard normal distribution function |

## Core Concepts Established
- Options give the right (not obligation) to buy (call) or sell (put) an underlying at strike K before expiration
- One options contract = 100 shares (one lot)
- Long positions pay premium; short positions receive premium
- Intrinsic value = exercise-now value; extrinsic value = the speculative portion that decays to zero at expiration
- Short premium positions are statistically more likely to profit than long positions because large moves are rare — but short positions face potentially massive losses when rare moves DO occur
- This book assumes semi-strong EMH: markets are efficient, and the edge in options comes from volatility assumptions, not price prediction
- Returns are approximately normally distributed (log-normally for prices) under Black-Scholes assumptions
- The Black-Scholes model prices options from: S, K, σ, r, T−t. Solving it backwards for σ gives implied volatility
- Implied volatility is the market's perceived risk, often higher than historical volatility (a key trading insight)
- Delta measures directional exposure; Gamma measures how fast delta changes; Theta measures daily time decay
- Short premium = positive theta (earns daily); Long premium = negative theta (loses daily)
- Gamma and theta are opposite in sign and trade off against each other
- Correlation between assets determines whether combining positions reduces or increases portfolio risk (Var(X+Y) = Var(X) + Var(Y) + 2Cov(X,Y))
- Beta measures a stock's volatility relative to the market; used in beta-weighted delta calculations (Ch 7)
- CVaR is preferred over VaR for heavy-tailed or skewed distributions like short options P/L
- IV is non-directional; it measures the *magnitude* of expected price movement, not direction
- IV is the market's perceived risk embedded in option prices through supply and demand for financial insurance; when demand increases, IV increases
- IV tends to overstate realized volatility significantly: for SPY (2016–2021), market IV overstated realized moves 87% of the time vs. theoretical 68.2%
- IV reverts to long-term averages after spikes; this reversion is core to premium-selling profitability (high IV contractions create buyback opportunities)
- Different assets have different IV baselines: broad indexes (SPY) ~17–18; commodities (GLD) ~15–16; tech stocks (AAPL, AMZN) ~30; single stocks are 1.7–2× higher than broad indexes
- IV has three recurring states: Lull (~70% of time, IV near baseline), Expansion (~10%, IV spikes), Contraction (~20%, IV deflates); lulls are longest, expansions fastest, contractions intermediate
- Earnings dates create predictable IV spikes for single stocks but not for broad indexes; IV collapses post-earnings once uncertainty resolves
- Expected move cone = IV × √(Days/365) × Stock price; provides estimated 68.2% probability range under normal distribution assumption
- Options sellers (short premium) have long-term statistical advantage because fear is usually priced in higher than realized, but sellers face tail risk from rare large moves
- IV scaling: for 45-day contracts, multiply annualized IV by ~0.35 to match contract duration

## Notes
- Raw chapter files go in `source/`.
- Finished breakdowns go in `notes/`.
