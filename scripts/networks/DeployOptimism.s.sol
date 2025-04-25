// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.27;

import {AaveV3Optimism} from 'aave-address-book/AaveV3Optimism.sol';
import {MiscOptimism} from 'aave-address-book/MiscOptimism.sol';
import {GovernanceV3Optimism} from 'aave-address-book/GovernanceV3Optimism.sol';

import {OptimismScript} from 'solidity-utils/contracts/utils/ScriptUtils.sol';

import {DeployUmbrellaSystem} from 'aave-umbrella/scripts/deploy/DeployUmbrella.s.sol';

/**
 * @dev Deploy Optimism
 * deploy-command: make deploy-ledger contract=scripts/networks/DeployOptimism.s.sol:DeployUmbrella chain=optimism
 * verify-command: FOUNDRY_PROFILE=optimism npx catapulta-verify -b broadcast/DeployOptimism.s.sol/10/run-latest.json
 */
contract DeployUmbrella is OptimismScript {
  function run() external broadcast {
    DeployUmbrellaSystem.deploy(
      AaveV3Optimism.POOL,
      MiscOptimism.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Optimism.EXECUTOR_LVL_1,
      address(AaveV3Optimism.COLLECTOR)
    );
  }
}

/**
 * @dev Predict Optimism
 * predict-command: make predict contract=scripts/networks/DeployOptimism.s.sol:PredictUmbrella chain=optimism dry=true
 */
contract PredictUmbrella is OptimismScript {
  function run() external view {
    DeployUmbrellaSystem.predict(
      AaveV3Optimism.POOL,
      MiscOptimism.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Optimism.EXECUTOR_LVL_1,
      address(AaveV3Optimism.COLLECTOR)
    );
  }
}
