//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    string[] public tokens = ["BTC", "ETH"];
    address public owner;
    address[] public players;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "ONLY_OWNER");
        _;
    }

    function changeTokens() public {
        tokens[0] = "VET";
    }

    function start() public {
        players.push(msg.sender);
    }

    function concatenate(string calldata lhs, string calldata rhs) public pure returns (string memory) {
        // return string(abi.encodePacked(lhs, rhs));
        return string.concat(lhs, rhs);
    }

    function transferAll(address payable sendTo) public onlyOwner {
        sendTo.transfer(getBalance());
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    receive() payable external {

    }
}
