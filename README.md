# Serum Borrow Lending


The Serum Borrow Lending protocol is built on top of the [`token-lending`](https://github.com/solana-labs/solana-program-library/tree/master/token-lending) program in [`solana-labs/solana-program-library
`](https://github.com/solana-labs/solana-program-library).

Currently SOL & USDC pools are live on mainnet.

A minimum implementation of an interactive UI can be found [here](https://serum-borrow-lending.vercel.app/).

## Deployment

| Mainnet                                                                                             | Address                                        |
| --------------------------------------------------------------------------------------------------- | ---------------------------------------------- |
| [Lending Program](https://explorer.solana.com/address/HUsmpgwRHcfSY5et5uFUYhLRi6gHVGL8NcGLSNnD2oPc) | `HUsmpgwRHcfSY5et5uFUYhLRi6gHVGL8NcGLSNnD2oPc` |
| Market Address                                                                                      | `4gzHdkxcuv66nLpvUV9MSwHQWvFrNFDYcD7y8gFrqyWq` |
| Market Owner                                                                                        | `3G4uPVXJyasbnxDWGuUMXKTXMbEiuFb2Q7xQNVTyWkJm` |
| Authority                                                                                           | `EvSgZDprETSpnvayQjHcYEQxqzQHbmp27CUnWqfEZZ2s` |

### Solana Pool
| Mainnet                                                                                             | Address                                        |
| --------------------------------------------------------------------------------------------------- | ---------------------------------------------- |
| [SOL Mint Address](https://explorer.solana.com/address/So11111111111111111111111111111111111111112) | `So11111111111111111111111111111111111111112`  |
| [Reserve Address](https://explorer.solana.com/address/FnaKCd9dCa8QTLHWLWWSu8dS2gKVAxnFYKLdyjkjTCGq) | `FnaKCd9dCa8QTLHWLWWSu8dS2gKVAxnFYKLdyjkjTCGq` |
| Collateral Token Address                                                                            | `7xf9NF2SH6unNH5GkGLenc3WbTK7v7vzafe1eg8f3gyp` |
| Collateral Supply Address                                                                           | `2ConPe4EpmZUE9Fb46qzygtMcCkfnqTEWQ5TxRor6nH1` |
| Reserve Liquidity Address                                                                           | `9nvxDdfJe6VKSb8dp2Kqa4XGBwXMowk2gYNkhfxDPB85` |
| Reserve Liquidity Fee Receiver Address                                                              | `GCvjXHsPnsQLt597K7TGmfDqMuJjfVfVuYQMM2KZXi2o` |

### USD Coin Pool
| Mainnet                                                                                               | Address                                        |
| ----------------------------------------------------------------------------------------------------- | ---------------------------------------------- |
| [USDC Mint Address](https://explorer.solana.com/address/EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v) | `EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v` |
| [Reserve Address](https://explorer.solana.com/address/C5dzpBbjXFinfMRHR8LQZ6SCJVVRXq2SkSFFYAriUk1t)   | `C5dzpBbjXFinfMRHR8LQZ6SCJVVRXq2SkSFFYAriUk1t` |
| Collateral Token Address                                                                              | `ASD8xkgS1XjEqJZX713GYjRsARtkjhQnD3uB5pgY23JX` |
| Collateral Supply Address                                                                             | `BuK7faQyp8sLYGoYxnBVihQ9MQZD7y1PE3QhGwHmrmJ4` |
| Reserve Liquidity Address                                                                             | `5Ndyh7G48mz3JpDqocyHy2MUBf3FTRh7mdo18AT4CAN9` |
| Reserve Liquidity Fee Receiver Address                                                                | `GqC7HNiU1kU1Tii3UnXQJNFt6yxzFCH5h7s7xm9ecdES` |


## Parameters

### Solana Pool
| Parameter                | Value   |
| ------------------------ | ------- |
| Optimal utilization rate | `90%`   |
| Loan-to-value ratio      | `90%`   |
| Liquidation bonus        | `3%`    |
| Liquidation threshold    | `95%`   |
| Minimum borrow APR       | `0%`    |
| Optimal borrow APR       | `10%`   |
| Max borrow APR           | `150%`  |
| Borrow fee               | `0.1%`  |
| Flash loan fee           | ` 0.3%` |
| Host fee percentage      | `20%`   |

### USD Coin Pool
| Parameter                | Value   |
| ------------------------ | ------- |
| Optimal utilization rate | `90%`   |
| Loan-to-value ratio      | `90%`   |
| Liquidation bonus        | `3%`    |
| Liquidation threshold    | `95%`   |
| Minimum borrow APR       | `0%`    |
| Optimal borrow APR       | `15%`   |
| Max borrow APR           | `200%`  |
| Borrow fee               | `0.2%`  |
| Flash loan fee           | ` 0.3%` |
| Host fee percentage      | `20%`   |

## Documentations
- [solana-labs/solana-program-library](https://github.com/solana-labs/solana-program-library/tree/master/token-lending/cli)
- [solendprotocol/solana-program-library](https://github.com/solendprotocol/solana-program-library/tree/mainnet/token-lending/cli)
