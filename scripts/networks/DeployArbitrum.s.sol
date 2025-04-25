// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.27;

import {AaveV3Arbitrum} from 'aave-address-book/AaveV3Arbitrum.sol';
import {MiscArbitrum} from 'aave-address-book/MiscArbitrum.sol';
import {GovernanceV3Arbitrum} from 'aave-address-book/GovernanceV3Arbitrum.sol';

import {ArbitrumScript} from 'solidity-utils/contracts/utils/ScriptUtils.sol';

import {DeployUmbrellaSystem} from 'aave-umbrella/scripts/deploy/DeployUmbrella.s.sol';

/**
 * @dev Deploy Arbitrum
 * deploy-command: make deploy-ledger contract=scripts/networks/DeployArbitrum.s.sol:DeployUmbrella chain=arbitrum
 * verify-command: FOUNDRY_PROFILE=arbitrum npx catapulta-verify -b broadcast/DeployArbitrum.s.sol/42161/run-latest.json
 */
contract DeployUmbrella is ArbitrumScript {
  function run() external broadcast {
    DeployUmbrellaSystem.deploy(
      AaveV3Arbitrum.POOL,
      MiscArbitrum.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Arbitrum.EXECUTOR_LVL_1,
      address(AaveV3Arbitrum.COLLECTOR)
    );
  }
}

/**
 * @dev Predict Arbitrum
 * predict-command: make predict contract=scripts/networks/DeployArbitrum.s.sol:PredictUmbrella chain=arbitrum dry=true
 */
contract PredictUmbrella is ArbitrumScript {
  function run() external view {
    DeployUmbrellaSystem.predict(
      AaveV3Arbitrum.POOL,
      MiscArbitrum.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Arbitrum.EXECUTOR_LVL_1,
      address(AaveV3Arbitrum.COLLECTOR)
    );
  }
}
