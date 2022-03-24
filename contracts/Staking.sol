// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract StakeIt is ERC20, Ownable {
    constructor() ERC20("StakeIt", "Stk") {
        _mint(msg.sender, 1000 * 10 ** decimals());
    }
    mapping(address=> Staker )public Stakers;

    struct Staker{
         // The  amount staked by the Staker
        uint256 stakes;
        // Last time of details update for stakes
        uint256 timeOfLastUpdate;
        // Calculated, but unclaimed rewards. These are calculated each time
        // a user writes to the contract
        uint256 unclaimedRewards;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount*10*decimals());
    }
    function modifyTokenBuyPrice(uint price) public onlyOwner{

    }
    // function stake(uint amount)public  {
    //     require(amount <=_balances[msg.sender],"Insufficent token");
    //     balanceOf

    // }
    function buyToken()public payable {
        _mint(msg.sender,msg.value*10**decimals());
    }
    //function claimReward()
}