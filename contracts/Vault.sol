// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./ERC4626Fees.sol";
import "./ERC4626Asset.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract Vault is ERC4626Fees, ReentrancyGuard {
    using SafeERC20 for IERC20;

    ERC20 public immutable token;
    address payable public vaultOwner;
    uint256 public entryFeeBasisPoints;

    constructor(address _token, IERC20 _asset, uint256 _basisPoints) ERC4626(_asset) ERC20("Vault Ocean Token", "vOCT") {
        vaultOwner = payable(msg.sender);
        entryFeeBasisPoints = _basisPoints;
        token = ERC20(_token);
    }

    function _entryFeeBasisPoints() internal view override returns (uint256) {
        return entryFeeBasisPoints;
    }

    function _entryFeeRecipient() internal view override returns (address) {
        return vaultOwner;
    }

    function _exitFeeBasisPoints() internal view override returns (uint256) {
        return 0; // Define if you want an exit fee, similar to entry fee
    }

    function _exitFeeRecipient() internal view override returns (address) {
        return vaultOwner; // Define recipient for exit fees if any
    }

    // function beforeDeposit(uint256 assets, uint256 shares) internal virtual override {
    //     // Implement any logic needed before a deposit
    // }

    // function beforeWithdraw(uint256 assets, uint256 shares) internal virtual override {
    //     // Implement any logic needed before a withdrawal
    // }

    // function afterDeposit(uint256 assets, uint256 shares) internal virtual override {
    //     // Implement any logic needed after a deposit
    // }

    // function afterWithdraw(uint256 assets, uint256 shares) internal virtual override {
    //     // Implement any logic needed after a withdrawal
    // }

    function _mint(address to, uint256 amount) internal override {
        _mint(to, amount);
    }

    function _burn(address from, uint256 amount) internal override {
        _burn(from, amount);
    }
}
