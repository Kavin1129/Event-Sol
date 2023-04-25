// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract HB{
    address private owner;
    int public Available_Rooms=0;
     constructor(){
        owner=msg.sender;
     }

    struct addrooms{
         address owner_room;
         uint roomid;
         uint _type;
         uint cost;
         bool available;
         string name;
    }
    mapping(uint => addrooms) public adding;
    uint [] public RoomNumberAVA;
    // struct allocate{
    //      address new_owner;
    //      string name;
    //      uint _days;
    //  } 
    // mapping(uint=> allocate) public allocation;

    modifier onlyadmin(){
        require(msg.sender==owner,"Only admin can access");
        _;
    }
    modifier notadmin(){
        require(msg.sender!=owner,"Only customer can access");
        _;
    }

    function add_room(uint _roomnumber,uint _types,uint _cost) onlyadmin public{
        addrooms memory _room=addrooms({
            owner_room:msg.sender,
            roomid:_roomnumber,
            _type:_types,
            cost:_cost,
            available:true,
            name:"NA"
        });
        adding[_roomnumber]=_room;
        Available_Rooms++;
        RoomNumberAVA.push(_roomnumber);

    }
    function AVA() public view returns (uint [] memory){
        return RoomNumberAVA;
    }

    function allocate_room(uint _roomno,string memory _name,uint _days) payable  public{
        uint price=0;
        addrooms storage xaddrooms=adding[_roomno];
        price=xaddrooms.cost*_days;
        require(price<=msg.value,"Insufficent Fund");
        require(xaddrooms.available==true,"Already allocated");
        payable(owner).transfer(price);
        xaddrooms.available=false;
        xaddrooms.name=_name;
        xaddrooms.owner_room=msg.sender;
        Available_Rooms--;
        delete RoomNumberAVA[_roomno];
    }

}
