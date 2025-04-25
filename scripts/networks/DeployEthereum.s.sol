// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.27;

import {AaveV3Ethereum} from 'aave-address-book/AaveV3Ethereum.sol';
import {AaveV3EthereumLido} from 'aave-address-book/AaveV3EthereumLido.sol';
import {AaveV3EthereumEtherFi} from 'aave-address-book/AaveV3EthereumEtherFi.sol';

import {MiscEthereum} from 'aave-address-book/MiscEthereum.sol';
import {GovernanceV3Ethereum} from 'aave-address-book/GovernanceV3Ethereum.sol';

import {EthereumScript} from 'solidity-utils/contracts/utils/ScriptUtils.sol';

import {DeployUmbrellaSystem} from 'aave-umbrella/scripts/deploy/DeployUmbrella.s.sol';

/**
 * @dev Deploy Ethereum Core
 * deploy-command: make deploy-ledger contract=scripts/networks/DeployEthereum.s.sol:DeployUmbrellaCore chain=mainnet
 * verify-command: FOUNDRY_PROFILE=mainnet npx catapulta-verify -b broadcast/DeployEthereum.s.sol/1/run-latest.json
 */
contract DeployUmbrellaCore is EthereumScript {
  function run() external broadcast {
    DeployUmbrellaSystem.deploy(
      AaveV3Ethereum.POOL,
      MiscEthereum.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Ethereum.EXECUTOR_LVL_1,
      address(AaveV3Ethereum.COLLECTOR)
    );
  }
}

/**
 * @dev Deploy Ethereum Prime
 * deploy-command: make deploy-ledger contract=scripts/networks/DeployEthereum.s.sol:DeployUmbrellaPrime chain=mainnet
 * verify-command: FOUNDRY_PROFILE=mainnet npx catapulta-verify -b broadcast/DeployEthereum.s.sol/1/run-latest.json
 */
contract DeployUmbrellaPrime is EthereumScript {
  function run() external broadcast {
    DeployUmbrellaSystem.deploy(
      AaveV3EthereumLido.POOL,
      MiscEthereum.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Ethereum.EXECUTOR_LVL_1,
      address(AaveV3EthereumLido.COLLECTOR)
    );
  }
}

/**
 * @dev Deploy Ethereum
 * deploy-command: make deploy-ledger contract=scripts/networks/DeployEthereum.s.sol:DeployUmbrella chain=mainnet
 * verify-command: FOUNDRY_PROFILE=mainnet npx catapulta-verify -b broadcast/DeployEthereum.s.sol/1/run-latest.json
 */
contract DeployUmbrellaEtherFi is EthereumScript {
  function run() external broadcast {
    DeployUmbrellaSystem.deploy(
      AaveV3EthereumEtherFi.POOL,
      MiscEthereum.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Ethereum.EXECUTOR_LVL_1,
      address(AaveV3EthereumEtherFi.COLLECTOR)
    );
  }
}

/**
 * @dev Predict Ethereum Core
 * predict-command: make predict contract=scripts/networks/DeployEthereum.s.sol:PredictUmbrellaCore chain=mainnet dry=true
 */
contract PredictUmbrellaCore is EthereumScript {
  function run() external view {
    DeployUmbrellaSystem.predict(
      AaveV3Ethereum.POOL,
      MiscEthereum.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Ethereum.EXECUTOR_LVL_1,
      address(AaveV3Ethereum.COLLECTOR)
    );
  }
}

/**
 * @dev Predict Ethereum Prime
 * predict-command: make predict contract=scripts/networks/DeployEthereum.s.sol:PredictUmbrellaPrime chain=mainnet dry=true
 */
contract PredictUmbrellaPrime is EthereumScript {
  function run() external view {
    DeployUmbrellaSystem.predict(
      AaveV3EthereumLido.POOL,
      MiscEthereum.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Ethereum.EXECUTOR_LVL_1,
      address(AaveV3EthereumLido.COLLECTOR)
    );
  }
}

/**
 * @dev Predict Ethereum EtherFi
 * predict-command: make predict contract=scripts/networks/DeployEthereum.s.sol:PredictUmbrellaEtherFi chain=mainnet dry=true
 */
contract PredictUmbrellaEtherFi is EthereumScript {
  function run() external view {
    DeployUmbrellaSystem.predict(
      AaveV3EthereumEtherFi.POOL,
      MiscEthereum.TRANSPARENT_PROXY_FACTORY,
      GovernanceV3Ethereum.EXECUTOR_LVL_1,
      address(AaveV3EthereumEtherFi.COLLECTOR)
    );
  }
}
