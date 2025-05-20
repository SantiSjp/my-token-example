# MyToken

A customizable ERC20 token built with OpenZeppelin contracts, featuring pausable, burnable, and mintable capabilities, as well as owner-only controls and reentrancy protection.

## Features

- **ERC20 Standard**: Fully compliant with the ERC20 token standard.
- **Ownable**: Ownership control for sensitive functions.
- **Pausable**: The owner can pause/unpause all token transfers.
- **Burnable**: Any holder can burn (destroy) their tokens.
- **Mintable**: The owner can mint new tokens to any address.
- **ReentrancyGuard**: Protection against reentrancy attacks on sensitive functions.

## Getting Started

### Prerequisites

- [Node.js](https://nodejs.org/) (v16+ recommended)
- [npm](https://www.npmjs.com/) or [yarn](https://yarnpkg.com/)
- [Hardhat](https://hardhat.org/) (already included in this project)

### Installation

1. **Clone the repository:**
   ```sh
   git clone <your-repo-url>
   cd my-token
   ```

2. **Install dependencies:**
   ```sh
   npm install
   # or
   yarn install
   ```

### Configuration

- Copy `.env.example` to `.env` and fill in any required environment variables.

### Compile the Contracts

```sh
npx hardhat compile
```

### Run Tests

```sh
npx hardhat test
```

### Deploy to Monad Testnet

To deploy your contract to the Monad Testnet, follow these steps:

1. **Configure Environment Variables:**
   - Copy `.env.example` to `.env`:
     ```sh
     cp .env.example .env
     ```
   - Edit the `.env` file and fill in the required values, such as your Monad Testnet RPC URL and private key.

2. **Update Hardhat Network Settings:**
   - Ensure your `hardhat.config.ts` includes a network configuration for Monad Testnet, using the variables from your `.env` file. Example:
     ```js
     networks: {
       monadTestnet: {
         url: process.env.MONAD_TESTNET_RPC_URL,
         accounts: [process.env.PRIVATE_KEY]
       }
     }
     ```

3. **Deploy the Contract:**
   - Run the deployment script with the Monad Testnet network:
     ```sh
     npx hardhat run scripts/deploy.js --network monadTestnet
     ```

## Contract Overview

### Constructor

```solidity
constructor(uint256 initialSupply)
```
- Mints `initialSupply` tokens to the deployer (owner).

### Functions

- `pause()`: Pauses all token transfers (owner only).
- `unpause()`: Unpauses token transfers (owner only).
- `mint(address to, uint256 amount)`: Mints new tokens to an address (owner only, non-reentrant).
- `burn(uint256 amount)`: Burns tokens from the caller's balance (non-reentrant).

### Events

- `Burn(address indexed from, uint256 amount)`
- `Mint(address indexed to, uint256 amount)`
- `Pause()`
- `Unpause()`

## Security

- Uses OpenZeppelin's battle-tested contracts.
- Owner-only access for minting and pausing.
- Reentrancy protection on mint and burn functions.

## License

This project is licensed under the MIT License. 