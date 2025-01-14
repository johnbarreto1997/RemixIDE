// SPDX-License-Identifier: GPL - 3.0
pragma solidity ^0.8.26;

//Smart contract de una billetera de ether.
contract EtherWallet{

            //Direccion del propietario.
            address public owner;


            //Constructor del smart contract.
            constructor (address _owner){
                owner = _owner;
            }

            //Funcion para depositar el dinero.
            function deposit() payable public {

            }

            //Funcion enviar dinero.
            function send(address payable to, uint amount)public {
                if(msg.sender==owner){
                    to.transfer(amount);
                    return;
                }
                revert("Esta cuenta no tiene permitido enviar dinero");
            }

            //Funcion obtener el balance de la billetera.
            function balanceOf() view public returns(uint){
                return address(this).balance;
            }
}