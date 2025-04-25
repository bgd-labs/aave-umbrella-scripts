// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.27;

import {AaveV3BaseSepolia} from 'aave-address-book/AaveV3BaseSepolia.sol';
import {MiscBaseSepolia} from 'aave-address-book/MiscBaseSepolia.sol';

import {WithChainIdValidation} from 'solidity-utils/contracts/utils/ScriptUtils.sol';

import {DeployUmbrellaSystem} from 'aave-umbrella/scripts/deploy/DeployUmbrella.s.sol';

/**
 * @dev Deploy BaseSepolia
 * deploy-command: make deploy-ledger contract=scripts/testnets/BaseSepolia.s.sol:DeployUmbrella chain=base_sepolia
 * verify-command: FOUNDRY_PROFILE=base_sepolia npx catapulta-verify -b broadcast/DeployBaseSepolia.s.sol/84532/run-latest.json
 */
contract DeployUmbrella is WithChainIdValidation(84532) {
  function run() external broadcast {
    DeployUmbrellaSystem.deploy(
      AaveV3BaseSepolia.POOL,
      MiscBaseSepolia.TRANSPARENT_PROXY_FACTORY,
      address(0), // replace with a convenient address
      address(AaveV3BaseSepolia.COLLECTOR)
    );
  }
}

/**
 * @dev Predict BaseSepolia
 * predict-command: make predict contract=scripts/testnets/DeployBaseSepolia.s.sol:PredictUmbrella chain=base_sepolia dry=true
 */
contract PredictUmbrella is WithChainIdValidation(84532) {
  function run() external view {
    DeployUmbrellaSystem.predict(
      AaveV3BaseSepolia.POOL,
      MiscBaseSepolia.TRANSPARENT_PROXY_FACTORY,
      address(0), // replace with a convenient address
      address(AaveV3BaseSepolia.COLLECTOR)
    );
  }
}
