pragma solidity ^0.4.23;

contract AbstractRandomizer {
    function random(uint256 seed) public view returns (uint256, uint256) {
        uint blockNumber = block.number;
        bytes32 blockHashPrevious = blockhash(blockNumber - 1);
        bytes32 _seed0 = keccak256(abi.encodePacked(blockHashPrevious, seed));
        bytes32 _seed1 = keccak256(abi.encodePacked(_seed0,block.timestamp));
        uint256 _seed = uint256(_seed1);
        return (_seed % seed + 1, blockNumber);
    }//random
}