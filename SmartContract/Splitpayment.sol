// SPDX-License-Identifier: GPL - 3.0
pragma solidity ^0.8.26;

//Smart contract para hacer pagos divididos.
contract Splipayment{

            //Direccion del propietario.
            address public owner;

            //Constructor de nuestra smart contract.
            constructor(address _owner){
                owner = _owner;
            }

            //Funcion para enviar dinero de forma dividida.
            function send(address payable [] memory to, uint[] memory amount) payable onlyOwner public {
                //Las arrays de las direcciones de envio y la cantidad de dinero debe ser iguales.
                require(to.length == amount.length, "to o el amount de las arrays siempre deben ser iguales");
                for(uint i=0; i<to.length;i++){
                    to[i].transfer(amount[i]);
                }
            }



            //Modificador de la funcion.
            modifier onlyOwner(){
                require(msg.sender==owner, "Solo el propietario puede enviar dinero");
                _;
            }
}