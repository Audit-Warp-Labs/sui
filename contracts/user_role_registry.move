module sui_auditwarp::user_role_registry {
    use std::string;
    use std::option::{Self, Option};
    use sui::object::{Self, UID};
    use sui::tx_context::TxContext;

    /// Structure to store a single user profile
    public struct UserProfile has key, store {
        id: UID,
        owner: address,
        role: string::String,           // e.g., "auditor", "user", "dapp"
        name: string::String,           // Human-readable name
        link: string::String,           // Optional profile or website link

        // ✅ New fields for verification
        is_verified: bool,
        verified_by: Option<address>,

        // ✅ Optional identity information (default to None)
        email: Option<string::String>,
        discord: Option<string::String>,
        zoom: Option<string::String>,
        credential_link: Option<string::String>,
    }

    /// Registry struct that owns all profiles
    public struct UserRegistry has key {
        id: UID,
    }

    /// Initialize a new UserRegistry
    public fun init_registry(ctx: &mut TxContext): (UserRegistry) {
        let registry = UserRegistry {
            id: UID::new(ctx),
        };
        (registry)
    }

    /// Register a new user with minimal or full information
    public entry fun register_user(
        registry: &mut UserRegistry,
        role: string::String,
        name: string::String,
        link: string::String,
        ctx: &mut TxContext
    ) {
        let profile = UserProfile {
            id: UID::new(ctx),
            owner: ctx.sender(),
            role,
            name,
            link,

            // ✅ Initialize verification defaults
            is_verified: false,
            verified_by: Option::none(),

            // ✅ Optional fields default to none
            email: Option::none(),
            discord: Option::none(),
            zoom: Option::none(),
            credential_link: Option::none(),
        };

        // Publishing user profile under sender’s address
        move_to(&ctx.sender(), profile);
    }

    /// ✅ Only contract owner can verify users
    public entry fun verify_user(
        user_address: address,
        ctx: &mut TxContext
    ) {
        // Replace with actual owner address in production
        let contract_owner = @0x<your_owner_address_here>;  // Set to your real owner address

        assert!(ctx.sender() == contract_owner, 0);

        let mut profile = borrow_global_mut<UserProfile>(user_address);
        profile.is_verified = true;
        profile.verified_by = Option::some(ctx.sender());
    }
}
