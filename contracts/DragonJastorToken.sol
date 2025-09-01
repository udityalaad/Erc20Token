// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract DragonJastorToken is ERC20, Ownable {
    constructor (
        string memory name,
        string memory symbol,
        uint256 initialSupply
    )   ERC20(name, symbol)
        Ownable(msg.sender)
    {
        _mint(msg.sender, initialSupply);
    }

    receive() external payable {}
    fallback() external payable {}

    /**
     * @dev Mint new coins when required (can only be done by owner)
     */
    function mintTokens(address to, uint256 amount)  public onlyOwner {
        _mint(to, amount);
    }
}

