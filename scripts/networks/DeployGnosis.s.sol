// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.27;

import {AaveV3Gnosis} from 'aave-address-book/AaveV3Gnosis.sol';
import {MiscGnosis} from 'aave-address-book/MiscGnosis.sol';
import {GovernanceV3Gnosis} from 'aave-address-book/GovernanceV3Gnosis.sol';

import {GnosisScript} from 'solidity-utils/contracts/utils/ScriptUtils.sol';

import {DeployUmbrellaSystem} from 'aave-umbrella/scripts/deploy/DeployUmbrella.s.sol';

/**
 * @dev Deploy Gnosis
 * deploy-command: make deploy-ledger contract=scripts/networks/DeployGnosis.s.sol:DeployUmbrella chain=gnosis
 * verify-command: FOUNDRY_PROFILE=gnosis npx catapulta-verify -b broadcast/DeployGnosis.s.sol/100/run-latest.json
 */
contract DeployUmbrella is GnosisScript {
  function run() external broadcast {
    DeployUmbrellaSystem.deploy(
      AaveV3Gnosis.POOL,
      MiscGnosis.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Gnosis.EXECUTOR_LVL_1,
      address(AaveV3Gnosis.COLLECTOR)
    );
  }
}

/**
 * @dev Predict Gnosis
 * predict-command: make predict contract=scripts/networks/DeployGnosis.s.sol:PredictUmbrella chain=gnosis dry=true
 */
contract PredictUmbrella is GnosisScript {
  function run() external view {
    DeployUmbrellaSystem.predict(
      AaveV3Gnosis.POOL,
      MiscGnosis.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Gnosis.EXECUTOR_LVL_1,
      address(AaveV3Gnosis.COLLECTOR)
    );
  }
}
