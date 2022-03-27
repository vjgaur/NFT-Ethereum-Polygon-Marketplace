//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

/*The ERC721URIStorage contract is an 
implementation of ERC721 that includes 
the metadata standard extensions (IERC721Metadata) 
as well as a mechanism for per-token metadata */

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    /*TokenIds is going to 
    allow us to keep 
    incrementing value for an unique identifier for 
    each token so when the first token is  minted 
    it will get a value of like one and when the 
    second token is minted we ll increment that
    and give it a id of two so on so forth */
    Counters.Counter private _tokenIds;
    //Address of marketplace
    address contractAddress;

    constructor(address marketplaceAddress) ERC721("Metaverse Tokens", "METT") {
        contractAddress = marketplaceAddress;
    }

    function createToken(string memory tokenURI) public returns (uint256) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        setApprovalForAll(contractAddress, true);
        return newItemId;
    }
}
