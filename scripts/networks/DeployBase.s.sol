// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.27;

import {AaveV3Base} from 'aave-address-book/AaveV3Base.sol';
import {MiscBase} from 'aave-address-book/MiscBase.sol';
import {GovernanceV3Base} from 'aave-address-book/GovernanceV3Base.sol';

import {BaseScript} from 'solidity-utils/contracts/utils/ScriptUtils.sol';

import {DeployUmbrellaSystem} from 'aave-umbrella/scripts/deploy/DeployUmbrella.s.sol';

/**
 * @dev Deploy Base
 * deploy-command: make deploy-ledger contract=scripts/networks/DeployBase.s.sol:DeployUmbrella chain=base
 * verify-command: FOUNDRY_PROFILE=base npx catapulta-verify -b broadcast/DeployBase.s.sol/8453/run-latest.json
 */
contract DeployUmbrella is BaseScript {
  function run() external broadcast {
    DeployUmbrellaSystem.deploy(
      AaveV3Base.POOL,
      MiscBase.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Base.EXECUTOR_LVL_1,
      address(AaveV3Base.COLLECTOR)
    );
  }
}

/**
 * @dev Predict Base
 * predict-command: make predict contract=scripts/networks/DeployBase.s.sol:PredictUmbrella chain=base dry=true
 */
contract PredictUmbrella is BaseScript {
  function run() external view {
    DeployUmbrellaSystem.predict(
      AaveV3Base.POOL,
      MiscBase.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Base.EXECUTOR_LVL_1,
      address(AaveV3Base.COLLECTOR)
    );
  }
}
