// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.27;

import {AaveV3Polygon} from 'aave-address-book/AaveV3Polygon.sol';
import {MiscPolygon} from 'aave-address-book/MiscPolygon.sol';
import {GovernanceV3Polygon} from 'aave-address-book/GovernanceV3Polygon.sol';

import {PolygonScript} from 'solidity-utils/contracts/utils/ScriptUtils.sol';

import {DeployUmbrellaSystem} from 'aave-umbrella/scripts/deploy/DeployUmbrella.s.sol';

/**
 * @dev Deploy Polygon
 * deploy-command: make deploy-ledger contract=scripts/networks/DeployPolygon.s.sol:DeployUmbrella chain=polygon
 * verify-command: FOUNDRY_PROFILE=polygon npx catapulta-verify -b broadcast/DeployPolygon.s.sol/137/run-latest.json
 */
contract DeployUmbrella is PolygonScript {
  function run() external broadcast {
    DeployUmbrellaSystem.deploy(
      AaveV3Polygon.POOL,
      MiscPolygon.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Polygon.EXECUTOR_LVL_1,
      address(AaveV3Polygon.COLLECTOR)
    );
  }
}

/**
 * @dev Predict Polygon
 * predict-command: make predict contract=scripts/networks/DeployPolygon.s.sol:PredictUmbrella chain=polygon dry=true
 */
contract PredictUmbrella is PolygonScript {
  function run() external view {
    DeployUmbrellaSystem.predict(
      AaveV3Polygon.POOL,
      MiscPolygon.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Polygon.EXECUTOR_LVL_1,
      address(AaveV3Polygon.COLLECTOR)
    );
  }
}
