// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.27;

import {AaveV3Harmony} from 'aave-address-book/AaveV3Harmony.sol';
// import {MiscHarmony} from 'aave-address-book/MiscHarmony.sol';
// import {GovernanceV3Harmony} from 'aave-address-book/GovernanceV3Harmony.sol';

import {HarmonyScript} from 'solidity-utils/contracts/utils/ScriptUtils.sol';

import {DeployUmbrellaSystem} from 'aave-umbrella/scripts/deploy/DeployUmbrella.s.sol';

/**
 * @dev Deploy Harmony
 * deploy-command: make deploy-ledger contract=scripts/networks/DeployHarmony.s.sol:DeployUmbrella chain=harmony
 * verify-command: FOUNDRY_PROFILE=harmony npx catapulta-verify -b broadcast/DeployHarmony.s.sol/1666600000/run-latest.json
 */
contract DeployUmbrella is HarmonyScript {
  function run() external broadcast {
    DeployUmbrellaSystem.deploy(
      AaveV3Harmony.POOL,
      address(0), // MiscHarmony.TRANSPARENT_PROXY_FACTORY,
      address(0), // GovernanceV3Harmony.EXECUTOR_LVL_1,
      address(AaveV3Harmony.COLLECTOR)
    );
  }
}

/**
 * @dev Predict Harmony
 * predict-command: make predict contract=scripts/networks/DeployHarmony.s.sol:PredictUmbrella chain=harmony dry=true
 */
contract PredictUmbrella is HarmonyScript {
  function run() external view {
    DeployUmbrellaSystem.predict(
      AaveV3Harmony.POOL,
      address(0), // MiscHarmony.TRANSPARENT_PROXY_FACTORY,
      address(0), // GovernanceV3Harmony.EXECUTOR_LVL_1,
      address(AaveV3Harmony.COLLECTOR)
    );
  }
}
