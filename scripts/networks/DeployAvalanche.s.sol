// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.27;

import {AaveV3Avalanche} from 'aave-address-book/AaveV3Avalanche.sol';
import {MiscAvalanche} from 'aave-address-book/MiscAvalanche.sol';
import {GovernanceV3Avalanche} from 'aave-address-book/GovernanceV3Avalanche.sol';

import {AvalancheScript} from 'solidity-utils/contracts/utils/ScriptUtils.sol';

import {DeployUmbrellaSystem} from 'aave-umbrella/scripts/deploy/DeployUmbrella.s.sol';

/**
 * @dev Deploy Avalanche
 * deploy-command: make deploy-ledger contract=scripts/networks/DeployAvalanche.s.sol:DeployUmbrella chain=avalanche
 * verify-command: FOUNDRY_PROFILE=avalanche npx catapulta-verify -b broadcast/DeployAvalanche.s.sol/43114/run-latest.json
 */
contract DeployUmbrella is AvalancheScript {
  function run() external broadcast {
    DeployUmbrellaSystem.deploy(
      AaveV3Avalanche.POOL,
      MiscAvalanche.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Avalanche.EXECUTOR_LVL_1,
      address(AaveV3Avalanche.COLLECTOR)
    );
  }
}

/**
 * @dev Predict Avalanche
 * predict-command: make predict contract=scripts/networks/DeployAvalanche.s.sol:PredictUmbrella chain=avalanche dry=true
 */
contract PredictUmbrella is AvalancheScript {
  function run() external view {
    DeployUmbrellaSystem.predict(
      AaveV3Avalanche.POOL,
      MiscAvalanche.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Avalanche.EXECUTOR_LVL_1,
      address(AaveV3Avalanche.COLLECTOR)
    );
  }
}
