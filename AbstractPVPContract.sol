pragma solidity ^0.4.23;

import './Owned.sol';

contract AbstractPVPContract is Owned {

    uint32 public currentRound;

    function startRound(uint32 number) public onlyOwner returns (uint256) {
        currentRound = number;
        return currentRound;
    }

    function stopRound(uint32 number) public onlyOwner returns (uint256) {
        return currentRound;
    }
}