# 🧱 AuditWarp Sui 

This repository contains all the Move-based smart contracts, CLI scripts, and developer tooling for the **AuditWarp** protocol on the **Sui blockchain**.

---

## 📂 Structure

```bash
/
├── contracts/    # Move smart contracts (NFT, AuditRegistry, RoleRegistry)
├── cli/          # CLI tools and scripts (optional custom tooling)
├── sui.config/   # Sui local/testnet configuration files
└── README.md     # You're here!
```

## ✅ What's Inside

### 📁 Smart Contracts
Located in the `contracts/` folder, these Move modules include:

- **NFT Minting**  
  Wraps audit metadata into transferable NFTs on Sui.

- **Audit Registry**  
  Records audit logs with IPFS hashes and contract references.

- **User Role Registry**  
  Tags users as auditors, dApps, or researchers with optional identity metadata.

### 🛠 CLI + Dev Tools

Includes helper scripts and commands for:

- Building and testing Move contracts
- Publishing contracts to local/testnet
- Simulating audit actions

---

## 📦 Requirements

To use or contribute to this repo, install:

- [Sui CLI](https://docs.sui.io/build/install)
- Move compiler (bundled with Sui CLI)
- Node.js (for optional CLI automation tools)

---

## 🔧 Common Commands
```bash
# Build contracts
sui move build

# Run tests
sui move test

# Publish to local/testnet
sui client publish --gas-budget 500000000
```


---

## 📘 Repo Description

This repo hosts the **full on-chain and CLI codebase** for AuditWarp’s integration on Sui.  
It includes smart contracts, audit workflows, user identity tagging, and automation tools for blockchain security audits.

---

## 👨‍💻 Maintained by AuditWarp Labs

Built and maintained by the `sr18z` team as part of the **AuditWarp Labs** initiative. 

For **smart contract** details, see [`contracts/README.md`](./contracts/README.md).

For **Sui-CLI** details, see [`cli/README.md`](./cli/README.md).

For **sui.config** details, see [`sui.config/README.md`](./sui.config/README.md).
