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

---

## ⚙️ On-Chain Flow

```mermaid
graph TD
    A[Mint NFT] --> B[Submit Audit Record]
    B --> C[Audit Registry (Stores record)]
    A --> D[NFT Registry]
    E[User Registers Role] --> F[User Profile Created]
    F --> G[Verification (Optional)]
```
