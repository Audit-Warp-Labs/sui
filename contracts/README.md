# 🔐 AuditWarp Labs – Smart Contracts Suite

Welcome to the smart contract repository for **AuditWarp Labs**, a decentralized audit infrastructure protocol on the Sui blockchain. This repo contains the on-chain primitives powering audit registration, decentralized identity, and NFT-based audit artifacts.

---

## 📦 Contracts Included

### 1. 🧩 `nft_minting_contract::nft`

**Purpose:** Enables users to mint, update, transfer, and burn NFTs that represent unique audit reports or assets.

- Each NFT includes:
  - `name`: Human-readable title
  - `description`: Metadata or audit summary
  - `url`: Link to full content (e.g., hosted audit report)
- Events:
  - `NFTMinted`: Emitted on successful mint
  - `DescriptionUpdated`: Tracks metadata changes
- ✅ Compatible with Sui tooling and wallets

🔗 Example Use: Mint a unique audit certificate linked to IPFS and bind it to a report or registry entry.

📄 Sui Deployment (Testnet)

- **Sui NFT Contract Address (Testnet):** [`0x0d865f8b0ca4c353fbc142af6b74d88c4ec49d28c970b58c48b5599e1d314914`](https://testnet.suivision.xyz/package/0x0d865f8b0ca4c353fbc142af6b74d88c4ec49d28c970b58c48b5599e1d314914?tab=Code)  
- **Deployer Address (Testnet):** [`0x768478578364d08dfc4e7c114a883602289256f0e603b64f58eb14ac288ab673`](https://testnet.suivision.xyz/account/0x768478578364d08dfc4e7c114a883602289256f0e603b64f58eb14ac288ab673)

---

### 2. 🧾 `sui_auditwarp::audit_registry`

**Purpose:** Stores audit records on-chain and links them to NFTs and IPFS hashes.

- Stores structured data:
  - `nft_id`: Corresponds to a `TestnetNFT` ID
  - `ipfs_hash`: Points to audit report location
  - `audited_by`: Wallet of the auditor
  - `target_contract`: The contract being audited
  - `timestamp`: When the audit occurred

🛠 Entry Functions:

- `init_registry`: Deploys a new empty audit registry
- `add_audit`: Adds a new audit record with full traceability

🔗 Example Use: Add an audit record with linked NFT and report hash. Can be queried by frontends for analytics or verification.

📄 Sui Deployment (Testnet)

- **Sui Audit Registry Contract Address (Testnet):** [`0xf8ee5163f71ed274e1c1cb40c8f26cbb4e03c68335e0d3ff087b4aacaabe170a`](https://testnet.suivision.xyz/package/0xf8ee5163f71ed274e1c1cb40c8f26cbb4e03c68335e0d3ff087b4aacaabe170a?tab=Code)  
- **Deployer Address (Testnet):** [`0x768478578364d08dfc4e7c114a883602289256f0e603b64f58eb14ac288ab673`](https://testnet.suivision.xyz/account/0x768478578364d08dfc4e7c114a883602289256f0e603b64f58eb14ac288ab673)


---

### 3. 🧑‍💼 `sui_auditwarp::user_role_registry`

**Purpose:** Registers user roles and profiles for ecosystem actors like auditors, dApps, researchers, and users.

- Each `UserProfile` includes:
  - `role`: e.g., "auditor", "user", "dapp"
  - `name`, `link`: Identity details
  - `is_verified`: Boolean toggle for validation
  - `verified_by`: Optional verifier address
  - `email`, `discord`, `zoom`, `credential_link`: Optional off-chain identifiers

🛠 Entry Functions:

- `register_user`: Adds a new user profile
- `verify_user`: Verifies an address (only callable by contract owner)

🔗 Example Use: Tag auditors by role, attach a credential link, and allow dashboard displays with verified identities.

📄 Sui Deployment (Testnet)

- **Sui User Roles Contract Address (Testnet):** [`0x5b978db265ec08239574ef4b2ae17d84e7de531e557c080a142763c4e11a83b2`](https://testnet.suivision.xyz/package/0x5b978db265ec08239574ef4b2ae17d84e7de531e557c080a142763c4e11a83b2?tab=Code)  
- **Deployer Address (Testnet):** [`0x768478578364d08dfc4e7c114a883602289256f0e603b64f58eb14ac288ab673`](https://testnet.suivision.xyz/account/0x768478578364d08dfc4e7c114a883602289256f0e603b64f58eb14ac288ab673)



---

## ⚙️ On-Chain Flow

```bash
    A[Mint NFT] --> B[Submit Audit Record]
    B --> C[Audit Registry (Stores record)]
    A --> D[NFT Registry]
    E[User Registers Role] --> F[User Profile Created]
    F --> G[Verification (Optional)]
```

## 🧪 Local Dev & Deployment

```bash
# Build all contracts
sui move build

# Run tests
sui move test

# Publish to local validator or testnet
sui client publish --gas-budget 500000000
```
- 🔁 Ensure you link all modules to the correct package addresses when deploying.

---

## 📄 Use Cases
- Mint NFT → Store on-chain proof of audit result
- Register dApp roles → Link auditors to ecosystems
- Query verified auditors → Build trust layer on-chain

---

## 👨‍💻 Maintained By
AuditWarp Labs
Led by the sr18z engineering team.
Building modular infrastructure for on-chain auditing and identity.

---

## 🚨 Disclaimer
This repository includes smart contracts designed for use on the Sui blockchain and assumes users understand Move programming, gas budgeting, and transaction flow. Use in production only after thorough testing and security review.
