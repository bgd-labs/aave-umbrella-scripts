// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.27;

import {AaveV3Fantom} from 'aave-address-book/AaveV3Fantom.sol';
import {MiscFantom} from 'aave-address-book/MiscFantom.sol';
// import {GovernanceV3Fantom} from 'aave-address-book/GovernanceV3Fantom.sol';

import {FantomScript} from 'solidity-utils/contracts/utils/ScriptUtils.sol';

import {DeployUmbrellaSystem} from 'aave-umbrella/scripts/deploy/DeployUmbrella.s.sol';

/**
 * @dev Deploy Fantom
 * deploy-command: make deploy-ledger contract=scripts/networks/DeployFantom.s.sol:DeployUmbrella chain=fantom
 * verify-command: FOUNDRY_PROFILE=fantom npx catapulta-verify -b broadcast/DeployFantom.s.sol/250/run-latest.json
 */
contract DeployUmbrella is FantomScript {
  function run() external broadcast {
    DeployUmbrellaSystem.deploy(
      AaveV3Fantom.POOL,
      address(0), // MiscFantom.TRANSPARENT_PROXY_FACTORY,
      address(0), // GovernanceV3Fantom.EXECUTOR_LVL_1,
      address(AaveV3Fantom.COLLECTOR)
    );
  }
}

/**
 * @dev Predict Fantom
 * predict-command: make predict contract=scripts/networks/DeployFantom.s.sol:PredictUmbrella chain=fantom dry=true
 */
contract PredictUmbrella is FantomScript {
  function run() external view {
    DeployUmbrellaSystem.predict(
      AaveV3Fantom.POOL,
      address(0), // MiscFantom.TRANSPARENT_PROXY_FACTORY,
      address(0), // GovernanceV3Fantom.EXECUTOR_LVL_1,
      address(AaveV3Fantom.COLLECTOR)
    );
  }
}
