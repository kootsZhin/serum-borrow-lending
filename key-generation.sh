#!/usr/bin/env bash
#
# generating new keys
#

bold=$(tput bold)
normal=$(tput sgr0)

echo -e "Gnerating new owner key...";

if test -f owner.json; then
    rm owner.json
fi

OWNER_OUTPUT=$(solana-keygen new -o owner.json);
MARKET_OWNER=$(echo "$OWNER_OUTPUT" | grep "pubkey:" | cut -d ' ' -f 2);


echo -e "\nGnerating new lending key...";
if test -f lending.json; then
    rm lending.json
fi
LENDING_OUTPUT=$(solana-keygen new -o lending.json);
PROGRAM_ID=$(echo "$LENDING_OUTPUT" | grep "pubkey:" | cut -d ' ' -f 2);


echo -e "${bold}\n\nResults:\n${normal}";
echo -e "${bold}Owner address:${normal} $MARKET_OWNER (owner.json)";
echo -e "${bold}Program address:${normal} $PROGRAM_ID (lending.json)";

export MARKET_OWNER
export PROGRAM_ID

echo -e ""
echo -e "Modify static program ID in lib.rs before moving on";