// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Event{

    struct EventDetail{
        address organizer;
        string name;
        uint date;
        //uint time;
        uint price;
        uint total_Ticket;
        uint total_remaining;
        

    }

    mapping(uint=>EventDetail) public Events;

    mapping(address=>mapping(uint=>uint)) public Dif_events;

    uint public nxtId;

    function Add_Events(string calldata _name,uint _data,uint _price,uint _totaltick) public {
        require(block.timestamp<_data,"Cant Create For past");
        require(_totaltick>0,"Ticket count should be atleast 1");
        Events[nxtId]=EventDetail(msg.sender,_name,_data,_price,_totaltick,_totaltick);
        nxtId++;

    }

    function Buy_Ticket(uint id,uint quantity) public payable{
        require(Events[id].date!=0,"Events Does not exists");
        require(Events[id].total_remaining>=quantity,"Not enough Tickets");
        require(Events[id].price*quantity<msg.value,"Not enough money to buy");
        payable(Events[id].organizer).transfer(Events[id].price*quantity);
        Events[id].total_remaining-=quantity;
        

    }
}
