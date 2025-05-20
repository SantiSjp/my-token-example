// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract MyToken is ERC20, Ownable, Pausable, ERC20Burnable, ReentrancyGuard {
    constructor(uint256 initialSupply) ERC20("MyToken", "MTK") Ownable(msg.sender) {
        _mint(msg.sender, initialSupply);
    }

    event Burn(address indexed from, uint256 amount);
    event Mint(address indexed to, uint256 amount);
    event Pause();
    event Unpause();

    function pause() external onlyOwner {
        _pause();
        emit Pause();
    }

    function unpause() external onlyOwner {
        _unpause();
        emit Unpause();
    }

    function mint(address to, uint256 amount) external onlyOwner nonReentrant {
        _mint(to, amount);
        emit Mint(to, amount);
    }

    function burn(uint256 amount) public override nonReentrant {
        super.burn(amount);
        emit Burn(msg.sender, amount);
    }
    
}