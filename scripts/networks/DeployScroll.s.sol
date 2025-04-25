// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.27;

import {AaveV3Scroll} from 'aave-address-book/AaveV3Scroll.sol';
import {MiscScroll} from 'aave-address-book/MiscScroll.sol';
import {GovernanceV3Scroll} from 'aave-address-book/GovernanceV3Scroll.sol';

import {ScrollScript} from 'solidity-utils/contracts/utils/ScriptUtils.sol';

import {DeployUmbrellaSystem} from 'aave-umbrella/scripts/deploy/DeployUmbrella.s.sol';

/**
 * @dev Deploy Scroll
 * deploy-command: make deploy-ledger contract=scripts/networks/DeployScroll.s.sol:DeployUmbrella chain=scroll
 * verify-command: FOUNDRY_PROFILE=scroll npx catapulta-verify -b broadcast/DeployScroll.s.sol/534352/run-latest.json
 */
contract DeployUmbrella is ScrollScript {
  function run() external broadcast {
    DeployUmbrellaSystem.deploy(
      AaveV3Scroll.POOL,
      MiscScroll.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Scroll.EXECUTOR_LVL_1,
      address(AaveV3Scroll.COLLECTOR)
    );
  }
}

/**
 * @dev Predict Scroll
 * predict-command: make predict contract=scripts/networks/DeployScroll.s.sol:PredictUmbrella chain=scroll dry=true
 */
contract PredictUmbrella is ScrollScript {
  function run() external view {
    DeployUmbrellaSystem.predict(
      AaveV3Scroll.POOL,
      MiscScroll.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Scroll.EXECUTOR_LVL_1,
      address(AaveV3Scroll.COLLECTOR)
    );
  }
}
