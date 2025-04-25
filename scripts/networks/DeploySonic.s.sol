// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.27;

import {AaveV3Sonic} from 'aave-address-book/AaveV3Sonic.sol';
import {MiscSonic} from 'aave-address-book/MiscSonic.sol';
import {GovernanceV3Sonic} from 'aave-address-book/GovernanceV3Sonic.sol';

import {SonicScript} from 'solidity-utils/contracts/utils/ScriptUtils.sol';

import {DeployUmbrellaSystem} from 'aave-umbrella/scripts/deploy/DeployUmbrella.s.sol';

/**
 * @dev Deploy Sonic
 * deploy-command: make deploy-ledger contract=scripts/networks/DeploySonic.s.sol:DeployUmbrella chain=sonic
 * verify-command: FOUNDRY_PROFILE=sonic npx catapulta-verify -b broadcast/DeploySonic.s.sol/146/run-latest.json
 */
contract DeployUmbrella is SonicScript {
  function run() external broadcast {
    DeployUmbrellaSystem.deploy(
      AaveV3Sonic.POOL,
      MiscSonic.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Sonic.EXECUTOR_LVL_1,
      address(AaveV3Sonic.COLLECTOR)
    );
  }
}

/**
 * @dev Predict Sonic
 * predict-command: make predict contract=scripts/networks/DeploySonic.s.sol:PredictUmbrella chain=sonic dry=true
 */
contract PredictUmbrella is SonicScript {
  function run() external view {
    DeployUmbrellaSystem.predict(
      AaveV3Sonic.POOL,
      MiscSonic.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Sonic.EXECUTOR_LVL_1,
      address(AaveV3Sonic.COLLECTOR)
    );
  }
}
