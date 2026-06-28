# BOOK: The Unlucky Investor's Guide to Options Trading
# SUBJECT: Options Trading / Finance

This file is the book-specific context. It loads automatically when working inside this
folder. Keep it current.

## Progress Tracker
- [x] Introduction — Why Trade Options?
- [x] Chapter 1 — Math and Finance Preliminaries
- [x] Chapter 2 — Volatility Trading and Implied Volatility
- [x] Chapter 3 — Trading Short Premium
- [x] Chapter 4 — Buying Power Reduction
- [x] Chapter 5 — Constructing a Trade
- [x] Chapter 6 — Managing Trades
- [x] Chapter 7 — Basic Portfolio Management
- [x] Chapter 8 — Advanced Portfolio Management
- [x] Chapter 9 — Binary Events
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
- Buying Power Reduction (BPR) is the capital a broker requires to hold a short option position; it is YOUR equity held in reserve, not borrowed money (unlike stock margin)
- For long options, BPR = option cost. For short options, BPR is calculated to cover ~95% of potential losses for ETF underlyings and ~90% for stock underlyings
- BPR for a short strangle is max(Put BPR, Call BPR), calculated using max of three scenarios: 20% move, 10% strike breach, and a floor (250 - premium × 100)
- BPR scales linearly with underlying price: expensive underlyings require more BPR because 20% moves are larger in dollar terms
- BPR scales inverse-exponentially with IV: high IV → low BPR (strikes spread wider OTM, loss potential decreases), low IV → high BPR; this incentivizes short premium when IV is highest
- Empirically (SPY 45-DTE 16Δ strangles, 2005–2021), 95% of losses stayed within BPR; only 5% of trades had outlier losses exceeding the reserve
- BPR enables capital allocation rules: more simultaneous positions allowed when IV is high (low BPR per trade), fewer positions when IV is low (high BPR per trade)
- BPR is NOT comparable across different strategies (e.g., short strangles vs. short puts vs. short spreads) because each has different risk profiles; it can only compare variations within the same strategy
- Trade construction has six interdependent decisions: asset universe, underlying, contract duration, risk profile (defined vs undefined), directional assumption, and delta selection
- Liquid asset universe is a prerequisite: underlying must have >1M daily volume and <0.1% bid-ask spread; options contracts must have tight bid-ask spreads and high open interest across strikes
- Stocks have higher IV and higher credits (profits) but also higher BPR, company-specific risk (earnings), and P/L volatility; ETFs are cheaper, diversified, and more stable but have lower credits and less frequent high IV
- Product indifference: if two underlyings have the same IV, their options will have roughly the same price as a percentage of underlying price; choice depends on account size and risk tolerance, not inherent superiority
- Contract duration trade-off: 15 DTE strangles have high gamma and wild P/L swings but leverage premium decay; 30–60 DTE strangles have manageable P/L volatility and time for adjustments; most suitable range is 30–60 DTE for efficient use of BPR
- P/L volatility (standard deviation) increases with gamma and time to expiration; 15 DTE has peak volatility mid-contract due to high gamma; 60 DTE has lower early volatility due to strikes further from ATM
- Defined risk strategies (iron condors, spreads) have lower POP and lower profits but cap maximum loss; undefined risk (strangles, naked) have higher POP and higher profits but unlimited loss; portfolio split is typically 75% undefined, 25% defined
- Strike distance from ATM varies with delta and DTE; 16Δ put is 3.9% OTM for 15 DTE but 8% OTM for 45 DTE; put strikes are systematically further OTM than call strikes (put skew)
- Iron condor maximum loss = (spread width) − (net credit) × 100; wings cap losses for extreme moves; two examples: tight 5Δ wings have 79% POP and $35 avg profit with $251 std dev, while wide 13Δ wings have 73% POP and $6 avg profit with $74 std dev
- Delta selection determines risk-reward profile: 16Δ strangles have 81% POP, $44 avg profit, $614 std dev; 30Δ strangles have 68% POP, $54 avg profit, $747 std dev; 10–40Δ range is typical, 16–20Δ is the sweet spot
- Optimal delta depends on profit goals and risk tolerance; wider deltas (less OTM) have higher profit potential but lower POP and higher volatility; tighter deltas have higher POP but smaller profits and less tail risk
- Strike positioning: as IV increases, strikes for a given delta move further OTM; when IV rises, traders should close existing positions and reopen with adjusted (wider) strikes to maintain the delta target
- Empirical validation: 45-DTE 16Δ SPY strangles have 81% POP, stocks average $400–$1,100 profit with $1,400–$2,900 losses (3–4× larger swings), ETFs average $30–$160 profit with $100–$424 losses; consistent POP across underlyings (76–83%) validates short premium edge
- Active management (closing before expiration) offers three advantages over holding to expiration: more occurrences (faster law-of-large-numbers realization), more efficient BPR redeployment, and lower per-trade P/L standard deviation and tail CVaR
- Managing at 21 DTE for a 45-DTE strangle roughly halves CVaR (–283% vs. –708% at expiration) while giving up only 7 percentage points of per-trade profit (21% vs. 28%)
- Average Daily P/L (avg P/L ÷ avg duration) is the key metric for comparing capital efficiency across strategies; 21 DTE earns $1.60/day vs. $1.29/day at expiration — a 24% improvement
- Profit target management (e.g., close at 50% of initial credit) raises POP (91%) but does NOT reduce tail CVaR — positions that miss the target still hold to expiration and carry full tail risk
- Stop losses reduce CVaR but destroy POP: a –50% stop triggers 40% of the time and collapses POP to 58%; practical minimum is –200% (triggers only 13% of the time while cutting CVaR to –338%)
- The combined "21 DTE or 50% profit, whichever first" strategy is the best all-around approach: POP 81%, CVaR –288%, Avg Daily P/L $1.67 — nearly identical tail risk to pure 21 DTE with slightly better daily efficiency
- Per-trade risk reduction does NOT guarantee lower long-term portfolio risk: more occurrences compound cumulative exposure, and 2018–2019 showed expiration-managed strangles outperforming 21 DTE by ~93% because moderate repeated IV spikes aligned with the early closure window
- Path dependence is extreme: a one-month shift in start date (Feb 3 vs. March 4, 2020) completely reversed which management strategy won, illustrating that backtests must be interpreted with caution
- Stop losses are not suitable for defined risk positions (spreads, iron condors) — their capped maximum loss means they can recover; defined risk losers should run to expiration
- Consistency is the primary management principle: the short premium edge only manifests across many occurrences, so the best rule is whichever can be executed without deviation across all market conditions
- Portfolio capital allocation: 25–50% of buying power to short premium (VIX-scaled), remainder in cash or passive investment; within short premium: 75% min to undefined risk (max 7% per trade), 25% max to defined risk (max 5% per trade), 25% max to supplemental (stock) positions
- Core positions use ETF underlyings (SPY, QQQ, GLD, TLT) for consistent returns; supplemental positions use stock underlyings (AAPL, GOOGL, AMZN) for higher profit potential but 3–8× larger average losses and CVaR
- Diversification by underlying correlation is the single most important portfolio tool: uncorrelated assets (GLD –0.03, TLT –0.41 vs. SPY) dramatically reduce conditional probability of compounding outlier losses vs. highly correlated pairs (SPY+QQQ at 0.89 → 67% conditional compound loss rate)
- An asset's individual outlier rate and its portfolio diversification value are distinct: GLD has 12% individual outlier rate but only 2.1% simultaneous loss rate with SPY; TLT's inverse correlation makes it the strongest equity hedge
- Correlations strengthen during market crashes — calm-period correlation matrices understate crisis-period values; diversification benefits measured in normal times are overstated in stress scenarios
- Beta-weighted delta (bD) = Δ_option × β_underlying; expresses all position deltas in units of $1 SPY move, making them additive across a multi-underlying portfolio; target bD ≈ 0 so profit comes from IV and theta, not market direction
- Theta ratio = θ_portfolio / net portfolio liquidity; target 0.05%–0.1% per day (significantly exceeding the passive SPY benchmark of 0.013–0.025%); hard ceiling at 0.2% — above this, hidden gamma risk is accumulating
- Gamma cannot be beta-weighted across a multi-underlying portfolio; the theta ratio ceiling (0.2%) is the practical proxy for detecting and limiting gamma risk
- Small position sizes (5–7%) remain essential even with diversification — diversification reduces but does not eliminate compounding outlier losses; position sizing is the last line of defense
- Advanced diversification adds two axes beyond underlying: time (staggering expiration dates so the portfolio holds contracts at different DTE stages) and strategy (mixing defined/undefined risk on the same underlying)
- Strategy diversification: strangles vs. iron condors vs. 50/50 mix show approximately the same ~150% proportional drawdown during tail events — strategy diversification reduces absolute dollar losses, not percentage capital drawdowns
- Kelly-derived capital allocation: f = r × (DTE/365) × POP/(1−POP); use r ≈ 3%; yields conservative absolute fractions that should be treated as proportional weights scaled up to the 7% per-trade cap
- POP/(1−POP) is the core Kelly heuristic: allocate more buying power to higher-POP trades in proportion to their odds; GLD (84% POP) gets the 7% cap and all other positions are scaled relative to it
- Correlated underlyings (e.g., SPY–QQQ at 0.88) must share one combined Kelly allocation; split the shared budget between them by their individual Kelly weight proportions (not each get their own independent budget)
- POP-weighted six-ETF portfolio (SPY 3%, QQQ 2.2%, GLD 7%, TLT 4.8%, FXE 6.7%, XLU 5.9% ≈ 30% total) achieves comparable avg P/L to SPY equity with 44% lower std dev and 44% smaller worst-case loss
- POP weighting is a portfolio initializer, not a dynamic rebalancer — ongoing Greek management (bD neutrality, theta ratio) from Chapter 7 remains the primary tool for live portfolio adjustment
- Binary events (earnings, Fed, elections) create predictable IV expansion before and IV crush after, but the magnitude of the post-event price move is unpredictable; the market efficiently prices this uncertainty (EMH), so no consistent edge exists
- Optimal earnings trade: open day before, close day after — captures most IV crush while limiting prolonged delta exposure; performance uniformly deteriorates at 5/10/20 days after
- AAPL earnings strangles (Day After): 72% POP, +$85 avg P/L, CVaR –$405; AMZN: 65% POP, +$99, CVaR –$1,927; GOOGL: 75% POP, –$60, CVaR –$4,639 — GOOGL is the textbook high-POP / negative-EV paradox
- Binary event position sizing: 1–2 lots maximum where a normal position would be 5 lots; trade only with spare capital, never primary allocation
- Small sample sizes (~60 earnings events per stock over 15 years) mean binary event statistics carry very wide confidence intervals; treat findings directionally only

## Notes
- Raw chapter files go in `source/`.
- Finished breakdowns go in `notes/`.
