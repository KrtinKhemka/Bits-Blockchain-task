//SPDX-License-Identifier:GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract Test{
    uint[] questno;
    uint[10] public listofquesnos=[0,0,0,0,0,0,0,0,0,0];
    uint  numberofques=200;
    uint public randomnumber;
    uint numberofquesperstudent=5;
    uint public keccakcount=0;
     constructor ()  
        {
        for(uint i=1;i<=numberofques;i++){
            questno.push(i);
            }
        }
    function generaterandomnumber( ) internal returns(uint){
        keccakcount++;
       randomnumber= uint(keccak256(abi.encodePacked(block.timestamp,keccakcount))) % numberofques;
     
       return randomnumber;
       
    }
    function remove(uint index) internal{
    questno[index] = questno[questno.length - 1];
    questno.pop();
  }
    function getlistofquest() public {
        uint count=0;
        while(count<10){
            uint y= generaterandomnumber();
            
            listofquesnos[count]=questno[y];
            remove(y);

            count++;
            numberofques=numberofques-1;
            }
         }
     function len() public view returns(uint)
    {
        return questno.length;
    }

}