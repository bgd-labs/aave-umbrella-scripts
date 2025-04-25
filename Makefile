# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

# deps
update:; forge update

# Build & test
build  :; forge build --sizes
test   :; forge test -vvv

deploy-ledger :; FOUNDRY_PROFILE=${chain} forge script $(if $(filter zksync, ${chain}), --zksync) ${contract} --rpc-url ${chain} $(if ${dry}, --sender 0x000000000000000000000000000000000000dEaD -vvv, --ledger --mnemonic-indexes ${MNEMONIC_INDEX} --sender ${LEDGER_SENDER} --verify -vvv --slow --broadcast)
deploy-pk :; FOUNDRY_PROFILE=${chain} forge script $(if $(filter zksync,${chain}),--zksync) ${contract} --rpc-url ${chain} $(if ${dry}, --sender 0x000000000000000000000000000000000000dEaD -vvv, --private-key ${PRIVATE_KEY} --verify -vvv --slow --broadcast)

predict :; FOUNDRY_PROFILE=${chain} forge script $(if $(filter zksync, ${chain}), --zksync) ${contract} --rpc-url ${chain} --sender 0x000000000000000000000000000000000000dEaD -vvv

# Utilities
download :; cast etherscan-source --chain ${chain} -d src/etherscan/${chain}_${address} ${address}
git-diff :
	@mkdir -p diffs
	@npx prettier ${before} ${after} --write
	@printf '%s\n%s\n%s\n' "\`\`\`diff" "$$(git diff --no-index --diff-algorithm=patience --ignore-space-at-eol ${before} ${after})" "\`\`\`" > diffs/${out}.md
