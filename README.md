# MiniEscrow – Simple 3-Party Escrow Smart Contract

A minimal escrow contract written in Solidity. It handles a basic payment flow between three parties: a client deposits funds, and a trusted arbiter (or the client) decides whether the funds are released to the freelancer or refunded.

## Roles

- **auftraggeber (client):** Deploys the contract and deposits the funds.
- **empfaenger (freelancer):** Receives the funds upon release.
- **schiedsrichter (arbiter):** Can release or refund in case of a dispute.

## Functions

- `auszahlen()` – Sends the full contract balance to the freelancer. Only callable by client or arbiter.
- `erstatten()` – Refunds the full contract balance to the client. Only callable by client or arbiter.

## Status

- ✅ Compiled with Solidity ^0.8.19
- ✅ Deployed & tested on Remix VM
- ✅ Deposit (5 ETH), release & refund flows manually tested

## How to test it yourself

1. Open [Remix IDE](https://remix.ethereum.org)
2. Create `MiniEscrow.sol` and paste the code
3. Compile & deploy on Remix VM (set a value, e.g. 5 ether, plus payee & arbiter addresses)
4. Call `auszahlen()` / `erstatten()` and watch the balance move

## Next steps

- [ ] Deploy on Sepolia testnet
- [ ] Add unit tests (Hardhat/Foundry)

---
*Built as a hands-on learning project while diving into Solidity & smart contract development.*
