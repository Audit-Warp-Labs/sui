module nft_minting_contract::nft {

    use std::string;
    use sui::event;
    use sui::url;            // Import the entire URL module.
    use sui::object::{Self, UID, ID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// An example NFT that can be minted by anybody.
    /// Each mint creates a new TestnetNFT instance with its own unique ID.
    public struct TestnetNFT has key, store {
        id: UID,
        /// Name for the token.
        name: string::String,
        /// Description of the token.
        description: string::String,
        /// URL for the token.
        url: url::Url,
    }

    // ===== Events =====

    public struct NFTMinted has copy, drop {
        // The object ID of the NFT.
        object_id: ID,
        // The creator (caller) of the NFT.
        creator: address,
        // The name of the NFT.
        name: string::String,
    }

    public struct DescriptionUpdated has copy, drop {
        // The object ID of the NFT.
        object_id: ID,
        // The updater of the NFT.
        updater: address,
        // The updated description of the NFT.
        new_description: string::String,
    }

    // ===== Public View Functions =====

    /// Retrieve the NFT's name.
    public fun name(nft: &TestnetNFT): &string::String {
        &nft.name
    }

    /// Retrieve the NFT's description.
    public fun description(nft: &TestnetNFT): &string::String {
        &nft.description
    }

    /// Retrieve the NFT's URL.
    public fun url(nft: &TestnetNFT): &url::Url {
        &nft.url
    }

    // ===== Entrypoints =====

    #[allow(lint(self_transfer))]
    /// Mint a new TestnetNFT with the provided name, description, and URL.
    /// The minted NFT is transferred to the caller.
    public entry fun mint_to_sender(
        name: string::String,
        description: string::String,
        url: string::String,
        ctx: &mut TxContext,
    ) {
        let sender = ctx.sender();
        let nft = TestnetNFT {
            id: sui::object::new(ctx),
            name,
            description,
            // Construct a URL object from the provided string.
            url: url::new_unsafe_from_bytes(string::into_bytes(url)),
        };

        event::emit(NFTMinted {
            object_id: sui::object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        // Transfer the minted NFT to the sender.
        transfer::public_transfer(nft, sender);
    }

    /// Transfer the NFT to a new recipient.
    public entry fun transfer(nft: TestnetNFT, recipient: address, _: &mut TxContext) {
        transfer::public_transfer(nft, recipient)
    }

    /// Update the NFT's description using a byte vector.
    public entry fun update_description(
        nft: &mut TestnetNFT,
        new_description: vector<u8>,
        _: &mut TxContext,
    ) {
        nft.description = string::utf8(new_description)
    }

    /// Update the NFT's description using a string directly.
    public entry fun update_description_str(
        nft: &mut TestnetNFT,
        new_description: string::String,
        ctx: &mut TxContext,
    ) {
        nft.description = new_description;
        event::emit(DescriptionUpdated {
            object_id: sui::object::id(nft),
            updater: ctx.sender(),
            new_description: nft.description,
        });
    }

    /// Permanently delete (burn) the NFT.
    public entry fun burn(nft: TestnetNFT, _: &mut TxContext) {
        let TestnetNFT { id, name: _, description: _, url: _ } = nft;
        id.delete()
    }
}