// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.27;

import {AaveV3Linea} from 'aave-address-book/AaveV3Linea.sol';
import {MiscLinea} from 'aave-address-book/MiscLinea.sol';
import {GovernanceV3Linea} from 'aave-address-book/GovernanceV3Linea.sol';

import {LineaScript} from 'solidity-utils/contracts/utils/ScriptUtils.sol';

import {DeployUmbrellaSystem} from 'aave-umbrella/scripts/deploy/DeployUmbrella.s.sol';

/**
 * @dev Deploy Linea
 * deploy-command: make deploy-ledger contract=scripts/networks/DeployLinea.s.sol:DeployUmbrella chain=linea
 * verify-command: FOUNDRY_PROFILE=linea npx catapulta-verify -b broadcast/DeployLinea.s.sol/59144/run-latest.json
 */
contract DeployUmbrella is LineaScript {
  function run() external broadcast {
    DeployUmbrellaSystem.deploy(
      AaveV3Linea.POOL,
      MiscLinea.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Linea.EXECUTOR_LVL_1,
      address(AaveV3Linea.COLLECTOR)
    );
  }
}

/**
 * @dev Predict Linea
 * predict-command: make predict contract=scripts/networks/DeployLinea.s.sol:PredictUmbrella chain=linea dry=true
 */
contract PredictUmbrella is LineaScript {
  function run() external view {
    DeployUmbrellaSystem.predict(
      AaveV3Linea.POOL,
      MiscLinea.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Linea.EXECUTOR_LVL_1,
      address(AaveV3Linea.COLLECTOR)
    );
  }
}
