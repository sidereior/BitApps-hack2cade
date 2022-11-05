pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract CoinTreeNFT is ERC721 {
    constructor() ERC721("CoinTreeNFT", "CTNFT") {}

    mapping(uint256 => string) public tokenIdToDescription;
    mapping(uint256 => string) public tokenIdToImage;

    uint256 public tokenCounter = 1;

    function mint(address to, string memory description, string memory image) public {
        _safeMint(to, tokenCounter);
        tokenCounter++;
        tokenIdToDescription[tokenCounter] = description;
        tokenIdToImage[tokenCounter] = image;
    }

    function setTokenDescription(uint256 tokenId, string memory description) public {
        tokenIdToDescription[tokenId] = description;
    }

    function setTokenImage(uint256 tokenId, string memory image) public {
        tokenIdToImage[tokenId] = image;
    }

    function getTokenDescription(uint256 tokenId) public view returns (string memory) {
        return tokenIdToDescription[tokenId];
    }

    function getTokenImage(uint256 tokenId) public view returns (string memory) {
        return tokenIdToImage[tokenId];
    }

    function getTokenCounter() public view returns {
        return tokenCounter-1;
    }

}