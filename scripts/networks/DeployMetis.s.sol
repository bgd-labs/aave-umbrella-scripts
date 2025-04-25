// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.27;

import {AaveV3Metis} from 'aave-address-book/AaveV3Metis.sol';
import {MiscMetis} from 'aave-address-book/MiscMetis.sol';
import {GovernanceV3Metis} from 'aave-address-book/GovernanceV3Metis.sol';

import {MetisScript} from 'solidity-utils/contracts/utils/ScriptUtils.sol';

import {DeployUmbrellaSystem} from 'aave-umbrella/scripts/deploy/DeployUmbrella.s.sol';

/**
 * @dev Deploy Metis
 * deploy-command: make deploy-ledger contract=scripts/networks/DeployMetis.s.sol:DeployUmbrella chain=metis
 * verify-command: FOUNDRY_PROFILE=metis npx catapulta-verify -b broadcast/DeployMetis.s.sol/1088/run-latest.json
 */
contract DeployUmbrella is MetisScript {
  function run() external broadcast {
    DeployUmbrellaSystem.deploy(
      AaveV3Metis.POOL,
      MiscMetis.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Metis.EXECUTOR_LVL_1,
      address(AaveV3Metis.COLLECTOR)
    );
  }
}

/**
 * @dev Predict Metis
 * predict-command: make predict contract=scripts/networks/DeployMetis.s.sol:PredictUmbrella chain=metis dry=true
 */
contract PredictUmbrella is MetisScript {
  function run() external view {
    DeployUmbrellaSystem.predict(
      AaveV3Metis.POOL,
      MiscMetis.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Metis.EXECUTOR_LVL_1,
      address(AaveV3Metis.COLLECTOR)
    );
  }
}
