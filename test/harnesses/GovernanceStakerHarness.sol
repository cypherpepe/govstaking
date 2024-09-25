// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.23;

import {DelegationSurrogate} from "src/DelegationSurrogate.sol";
import {GovernanceStaker} from "src/GovernanceStaker.sol";

import {IERC20} from "openzeppelin/token/ERC20/IERC20.sol";
import {SafeERC20} from "openzeppelin/token/ERC20/utils/SafeERC20.sol";
import {IERC20Delegates} from "src/interfaces/IERC20Delegates.sol";
import {IEarningPowerCalculator} from "src/interfaces/IEarningPowerCalculator.sol";

contract GovernanceStakerHarness is GovernanceStaker {
  constructor(
    IERC20 _rewardsToken,
    IERC20Delegates _stakeToken,
    IEarningPowerCalculator _earningPowerCalculator,
    address _admin
  ) GovernanceStaker(_rewardsToken, _stakeToken, _earningPowerCalculator, _admin) {}

  function exposed_useDepositId() external returns (DepositIdentifier _depositId) {
    _depositId = _useDepositId();
  }

  function exposed_fetchOrDeploySurrogate(address delegatee)
    external
    returns (DelegationSurrogate _surrogate)
  {
    _surrogate = _fetchOrDeploySurrogate(delegatee);
  }
}
