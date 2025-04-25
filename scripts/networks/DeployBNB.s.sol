// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.27;

import {AaveV3BNB} from 'aave-address-book/AaveV3BNB.sol';
import {MiscBNB} from 'aave-address-book/MiscBNB.sol';
import {GovernanceV3BNB} from 'aave-address-book/GovernanceV3BNB.sol';

import {BNBScript} from 'solidity-utils/contracts/utils/ScriptUtils.sol';

import {DeployUmbrellaSystem} from 'aave-umbrella/scripts/deploy/DeployUmbrella.s.sol';

/**
 * @dev Deploy BNB
 * deploy-command: make deploy-ledger contract=scripts/networks/DeployBNB.s.sol:DeployUmbrella chain=bnb
 * verify-command: FOUNDRY_PROFILE=bnb npx catapulta-verify -b broadcast/DeployBNB.s.sol/56/run-latest.json
 */
contract DeployUmbrella is BNBScript {
  function run() external broadcast {
    DeployUmbrellaSystem.deploy(
      AaveV3BNB.POOL,
      MiscBNB.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3BNB.EXECUTOR_LVL_1,
      address(AaveV3BNB.COLLECTOR)
    );
  }
}

/**
 * @dev Predict BNB
 * predict-command: make predict contract=scripts/networks/DeployBNB.s.sol:PredictUmbrella chain=bnb dry=true
 */
contract PredictUmbrella is BNBScript {
  function run() external view {
    DeployUmbrellaSystem.predict(
      AaveV3BNB.POOL,
      MiscBNB.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3BNB.EXECUTOR_LVL_1,
      address(AaveV3BNB.COLLECTOR)
    );
  }
}
