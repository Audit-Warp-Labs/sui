module sui_auditwarp::audit_registry {
    use std::string;
    use std::vector;
    use std::option::{Self, Option};
    use sui::object::{Self, UID, ID};
    use sui::tx_context::TxContext;

    // Structure to store individual audit data
    public struct AuditRecord has key, store {
        id: UID,
        nft_id: ID,                          // Refers to TestnetNFT.object_id
        ipfs_hash: string::String,          // Hash of audit report
        audited_by: address,                // Auditor wallet address
        target_contract: string::String,    // The contract audited
        timestamp: u64,                     // Unix timestamp
    }

    public struct AuditRegistry has key {
        id: UID,
        records: vector<AuditRecord>,
    }

    public fun init_registry(ctx: &mut TxContext): AuditRegistry {
        AuditRegistry {
            id: UID::new(ctx),
            records: vector::empty<AuditRecord>(),
        }
    }

    public entry fun add_audit(
        registry: &mut AuditRegistry,
        nft_id: ID,
        ipfs_hash: string::String,
        target_contract: string::String,
        ctx: &mut TxContext
    ) {
        let new_record = AuditRecord {
            id: UID::new(ctx),
            nft_id,
            ipfs_hash,
            audited_by: ctx.sender(),
            target_contract,
            timestamp: std::clock::now(), // can adjust depending on Sui availability
        };
        vector::push_back(&mut registry.records, new_record);
    }
}
