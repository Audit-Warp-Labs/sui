# 🛠 AuditWarp-Sui CLI Tools

This folder contains shell scripts to streamline your development workflow for Move contracts and AuditWarp automation.

## 📦 Scripts

- `build.sh` — Build all Move modules in `contracts/`.
- `test.sh` — Run Move unit tests.
- `publish.sh` — Publish contracts to localnet or testnet.
- `simulate_audit.sh` — Simulate a full audit workflow for testing purposes.

## 🚀 Usage

```bash
cd cli/
./build.sh
./test.sh
./publish.sh <network>
./simulate_audit.sh <network>
```

## 📝 Notes
Make sure sui is installed and the contracts/ folder is present.

Modify the publish.sh and simulate_audit.sh as needed to match your package structure.
