# Umbrella V1 Deployment Scripts

This repository contains a set of scripts designed for deploying the first version of the **Umbrella** protocol across various networks, as well as for conveniently validating existing addresses.

## Overview

All contracts are deployed using the `CREATE2` opcode, which enables deterministic address generation. By knowing the required Aave component addresses (such as the `Pool`, `Proxy Factory`, `Executor`, and `Collector`), you can accurately predict the final deployment addresses of the contracts.

## Structure

Each file inside the `scripts/networks` directory includes two contracts:

- **Deployment & Verification Contract** – Handles the deployment and verification of `Umbrella` contracts on the target network.
- **Address Prediction Contract** – Computes the full set of system addresses deterministically based on network parameters and known components.

## Behavior

If a full Umbrella V1 system is already deployed on a given network, the deployment script will detect this and skip any redundant operations. This ensures safe and idempotent deployments.

## Usage

To get started, copy the contents of the .env.example file into a new .env file:

```bash
cp .env.example .env
```

Next, configure the required environment variables. You can also override the default RPC settings and provide your API keys if needed.

Install the project dependencies using Foundry:

```bash
forge install
```

The commands required to run the scripts are listed above each corresponding contract in the `scripts` folder.

For example, to deploy Umbrella for the Core Pool on the Ethereum mainnet using a Ledger wallet:

```bash
make deploy-ledger contract=scripts/networks/DeployEthereum.s.sol:DeployUmbrellaCore chain=mainnet
```

Using private-key:

```bash
make deploy-pk contract=scripts/networks/DeployEthereum.s.sol:DeployUmbrellaCore chain=mainnet
```

These scripts will deploy the `Umbrella` system to the Ethereum network.

Predict:

```bash
make predict contract=scripts/networks/DeployEthereum.s.sol:PredictUmbrellaCore chain=mainnet dry=true
```

This script will calculate the `Umbrella` system addresses on the Ethereum network.
