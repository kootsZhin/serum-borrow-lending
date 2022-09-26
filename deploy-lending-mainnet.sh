#!/usr/bin/env bash
#
# deploy the token lending program on mainnet-beta
# init turbo pool with SOL and USDC
#



echo "Running mainnet deploy script...";

MARKET_OWNER=$1
PROGRAM_ID=$2

if [[ -z $PROGRAM_ID ]]; then
  echo "Usage: $0 <owner-addr> <program-addr>"
  exit 1
fi

cargo build
cargo build-bpf

OWNER = "owner.json"
PROGRAM = "lending.json"
NETWORK = "https://solana-api.projectserum.com"

WSOL_ADDR = "So11111111111111111111111111111111111111112"
USDC_ADDR = "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v"

bold = $(tput bold)
normal = $(tput sgr0)

SOL_CONFIG_OUTPUT=$(solana config set --url $NETWORK --keypair owner.json); # deploying on mainnet-beta


echo -e "\nDeploying program...\n";
solana program deploy \
  -k $OWNER \
  --program-id $PROGRAM \
  target/deploy/spl_token_lending.so;


echo -e "\nCreating lending market...\n";
MARKET_OUTPUT=$(spl-token-lending \
  --program      $PROGRAM_ID \
  --fee-payer    $OWNER \
  create-market \
  --market-owner $MARKET_OWNER);
MARKET_ADDR=$(echo "$MARKET_OUTPUT" | grep "market" | cut -d ' ' -f 4);


echo -e "\nCreating SOL Reserve...\n";
WSOL_TOKEN_ACC_OUTPUT=$(spl-token create-account $WSOL_ADDR);
WSOL_TOKEN_ACC=$(echo "$WSOL_TOKEN_ACC_OUTPUT" | grep "account" | cut -d ' ' -f 3);

SOL_RESERVE_OUTPUT=$(spl-token-lending \
  --program           $PROGRAM_ID \
  --fee-payer         $OWNER \
  add-reserve \
  --market-owner      $OWNER \
  --source-owner      $OWNER \
  --market            $MARKET_ADDR \
  --source            $WSOL_TOKEN_ACC \
  --amount            0  \
  --pyth-product      ALP8SdU9oARYVLgLR7LrqMNCYBnhtnQz1cj6bwgwQmgj \
  --pyth-price        H6ARHf6YXhGYeQfUzQNGk6rDNnLBQKrenN712K4AQJEG \

  --optimal-utilization-rate 90 \
  --loan-to-value-rate 90 \
  --liquidation-bonus 3 \
  --liquidation-threshold 95 \
  --min-borrow-rate 0 \
  --optimal-borrow-rate 10 \
  --max-borrow-rate 150 \
  --borrow-fee 0.1 \
  --flash-loan-fee 0.3 \
  --host-fee-percentage 20 \

  --verbose);

SOL_RESERVE_ADDR=$(echo "$SOL_RESERVE_OUTPUT" | grep "reserve" | cut -d ' ' -f 3);
SOL_RESERVE_COLLATERAL_MINT_ADDR=$(echo "$SOL_RESERVE_OUTPUT" | grep "Adding collateral mint" | cut -d ' ' -f 4);
SOL_RESERVE_COLLATERAL_SUPPLY_ADDR=$(echo "$SOL_RESERVE_OUTPUT" | grep "Adding collateral supply" | cut -d ' ' -f 4);
SOL_RESERVE_LIQUIDITY_ADDR=$(echo "$SOL_RESERVE_OUTPUT" | grep "Adding liquidity supply" | cut -d ' ' -f 4);
SOL_RESERVE_LIQUIDITY_FEE_RECEIVER_ADDR=$(echo "$SOL_RESERVE_OUTPUT" | grep "Adding liquidity fee receiver" | cut -d ' ' -f 5);


echo -e "\nCreating USDC Reserve...\n";

USDC_TOKEN_ACC_OUTPUT=$(spl-token create-account $USDC_ADDR);
USDC_TOKEN_ACC=$(echo "$USDC_TOKEN_ACC_OUTPUT" | grep "account" | cut -d ' ' -f 3);

USDC_RESERVE_OUTPUT=$(spl-token-lending \
  --program           $PROGRAM_ID \
  --fee-payer         $OWNER \
  add-reserve \
  --market-owner      $OWNER \
  --source-owner      $OWNER \
  --market            $MARKET_ADDR \
  --source            $USDC_TOKEN_ACC \
  --amount            0  \
  --pyth-product      8GWTTbNiXdmyZREXbjsZBmCRuzdPrW55dnZGDkTRjWvb \
  --pyth-price        Gnt27xtC473ZT2Mw5u8wZ68Z3gULkSTb5DuxJy7eJotD \

  --optimal-utilization-rate 90 \
  --loan-to-value-rate 90 \
  --liquidation-bonus 3 \
  --liquidation-threshold 95 \
  --min-borrow-rate 0 \
  --optimal-borrow-rate 15 \
  --max-borrow-rate 200 \
  --borrow-fee 0.2 \
  --flash-loan-fee 0.3 \
  --host-fee-percentage 20 \

  --verbose);

USDC_RESERVE_ADDR=$(echo "$USDC_RESERVE_OUTPUT" | grep "reserve" | cut -d ' ' -f 3);
USDC_RESERVE_COLLATERAL_MINT_ADDR=$(echo "$USDC_RESERVE_OUTPUT" | grep "Adding collateral mint" | cut -d ' ' -f 4);
USDC_RESERVE_COLLATERAL_SUPPLY_ADDR=$(echo "$USDC_RESERVE_OUTPUT" | grep "Adding collateral supply" | cut -d ' ' -f 4);
USDC_RESERVE_LIQUIDITY_ADDR=$(echo "$USDC_RESERVE_OUTPUT" | grep "Adding liquidity supply" | cut -d ' ' -f 4);
USDC_RESERVE_LIQUIDITY_FEE_RECEIVER_ADDR=$(echo "$USDC_RESERVE_OUTPUT" | grep "Adding liquidity fee receiver" | cut -d ' ' -f 5);


echo -e "${bold}\n\nDeveployment Results\n${normal}";
echo -e "${bold}NETWORK=${normal}$NETWORK";
echo -e "${bold}MARKET_OWNER=${normal}$MARKET_OWNER";
echo -e "${bold}PROGRAM_ID=${normal}$PROGRAM_ID";
echo -e "${bold}MARKET_ADDR=${normal}$MARKET_ADDR";
echo -e ""

echo -e "${bold}WRAPPED_SOL_ADDR=${normal}$WSOL_ADDR";
echo -e "${bold}WRAPPED_SOL_DECIMAL=${normal}9"
echo -e "${bold}WRAPPED_SOL_SOURCE_ADDR=${normal}$SOURCE";
echo -e "${bold}WRAPPED_SOL_RESERVE_ADDR=${normal}$SOL_RESERVE_ADDR";
echo -e "${bold}WRAPPED_SOL_COLLATERAL_MINT_ADDR=${normal}$SOL_RESERVE_COLLATERAL_MINT_ADDR";
echo -e "${bold}WRAPPED_SOL_COLLATERAL_SUPPLY_ADDR=${normal}$SOL_RESERVE_COLLATERAL_SUPPLY_ADDR";
echo -e "${bold}WRAPPED_SOL_RESERVE_LIQUIDITY_ADDR=${normal}$SOL_RESERVE_LIQUIDITY_ADDR";
echo -e "${bold}WRAPPED_SOL_RESERVE_LIQUIDITY_FEE_RECEIVER_ADDR=${normal}$SOL_RESERVE_LIQUIDITY_FEE_RECEIVER_ADDR";
echo -e ""

echo -e "${bold}USDC_ADDR=${normal}$USDC_ADDR";
echo -e "${bold}USDC_DECIMAL=${normal}6"
echo -e "${bold}USDC_SOURCE_ADDR=${normal}$USDC_TOKEN_ACC";
echo -e "${bold}USDC_RESERVE_ADDR=${normal}$USDC_RESERVE_ADDR";
echo -e "${bold}USDC_COLLATERAL_MINT_ADDR=${normal}$USDC_RESERVE_COLLATERAL_MINT_ADDR";
echo -e "${bold}USDC_COLLATERAL_SUPPLY_ADDR=${normal}$USDC_RESERVE_COLLATERAL_SUPPLY_ADDR";
echo -e "${bold}USDC_RESERVE_LIQUIDITY_ADDR=${normal}$USDC_RESERVE_LIQUIDITY_ADDR";
echo -e "${bold}USDC_RESERVE_LIQUIDITY_FEE_RECEIVER_ADDR=${normal}$USDC_RESERVE_LIQUIDITY_FEE_RECEIVER_ADDR";
echo -e ""