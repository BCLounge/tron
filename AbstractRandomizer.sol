pragma solidity ^0.4.23;

contract AbstractRandomizer {
    function random(uint256 seed) public view returns (uint256, uint256) {
        uint blockNumber = block.number;
        bytes memory _preseed = abi.encodePacked(seed, blockNumber);
        bytes32 _seed0 = keccak256(_preseed);
        uint256 _seed = uint256(_seed0);
        return ( (_seed % seed) + 1, blockNumber);
    }//random

    function checkRandom(uint256 seed, uint blockNumber) public pure returns (uint256){
        bytes memory _preseed = abi.encodePacked(seed, blockNumber);
        bytes32 _seed0 = keccak256(_preseed);
        uint256 _seed = uint256(_seed0);
        return (_seed % seed) + 1;
    }
}