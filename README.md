# Serum Borrow Lending


The Serum Borrow Lending protocol is built on top of the [`token-lending`](https://github.com/solana-labs/solana-program-library/tree/master/token-lending) program in [`solana-labs/solana-program-library
`](https://github.com/solana-labs/solana-program-library).

Currently SOL & USDC pools are live on mainnet.

An minimum implementation of an interactive frontend can be found [here](https://serum-borrow-lending.vercel.app/).

## Deployment

| Mainnet        | Address                                        |
| -------------- | ---------------------------------------------- |
| Market Owner   | `3G4uPVXJyasbnxDWGuUMXKTXMbEiuFb2Q7xQNVTyWkJm` |
| Program ID     | `HUsmpgwRHcfSY5et5uFUYhLRi6gHVGL8NcGLSNnD2oPc` |
| Market Address | `5LHe64h39ZuBnBfYBqLTbRwjNevJYqP33By81onYbFuT` |
| Authority      | `DjPg9FYJnhru9iMfQH4D3Mji9F3jbMybrG1wyGtdm2Jf` |

### Solana Pool
| Mainnet                                | Address                                        |
| -------------------------------------- | ---------------------------------------------- |
| SOL Mint Address                       | `So11111111111111111111111111111111111111112`  |
| Reserve Address                        | `BZtonm8EYePKfVGY1u4ztg32uYPEtysrUZvocaq1CMBF` |
| Collateral Token Address               | `6emfYbFo7Jn68vSu1CfKbGqLpqqn9HhQKAKW7PngPsHz` |
| Collateral Supply Address              | `4wMgpR2Vpnh1egTwK22WkJ4KEzXMoAbmCBoVP8p14oBC` |
| Reserve Liquidity Address              | `4FyPXD4svBdDo1PNfKVSTwTxDigbh1QrduZWwuYwet56` |
| Reserve Liquidity Fee Receiver Address | `7QKMT9JQV2AtJutkFjTPHWDpShL4GjnMjHv6jhXwLR6o` |

### USD Coin Pool
| Mainnet                                | Address                                        |
| -------------------------------------- | ---------------------------------------------- |
| USDC Mint Address                      | `EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v` |
| Reserve Address                        | `9v51d4hZ26ZpK1zsdv2aiYxt54A5vZX7vEW1ZNvqEK65` |
| Collateral Token Address               | `4FnpzEwu4yq16JYV6R3UdS31VycMVwGVvDL1kgifGVvZ` |
| Collateral Supply Address              | `GY5xsGtBicSExs1WHYZaDT1PN1SDnwLgAdJod4M9nAM1` |
| Reserve Liquidity Address              | `HifwRxsbhd5DJUtEQFhN1hRaX5qpQoM9tTtU3ypYX2FM` |
| Reserve Liquidity Fee Receiver Address | `2VDgStG1AsiFS1pm5YvbqfH51izFaLt6bouYWo7FrDUq` |


## Parameters

### Solana Pool
| Parameter                | Value   |
| ------------------------ | ------- |
| Optimal utilization rate | `90%`   |
| Loan-to-value ratio      | `90%`   |
| Liquidation bounus       | `3%`    |
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
| Liquidation bounus       | `3%`    |
| Liquidation threshold    | `95%`   |
| Minimum borrow APR       | `0%`    |
| Optimal borrow APR       | `15%`   |
| Max borrow APR           | `200%`  |
| Borrow fee               | `0.2%`  |
| Flash loan fee           | ` 0.3%` |
| Host fee percentage      | `20%`   |
