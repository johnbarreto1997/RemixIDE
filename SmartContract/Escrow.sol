// SPDX-License-Identifier: GPL - 3.0 
pragma solidity ^0.8.26;

//Compra venta de una propiedad con garantia.
contract Escrow{
    //Direccion del pagador.
    address public payer;
    //Direccion del tenedor de la propiedad.
    address payable public payee;
    //Direccion del abogado.
    address public lawyer;
    //Cantidad de dinero.
    uint public amount;

    //Constructor del smart contract
    constructor( address _payer, address payable _payee, uint _amount){
        payer = _payer;
        payee = _payee;
        lawyer = msg.sender;
        amount = _amount;
    }

    //Funcion para depositar el dinero.
    function deposit()payable public {
        require(msg.sender==payer, "Snder debe de ser el pagador");
        require(address(this).balance <= amount, "");
    }

    //Funcion para liberar la propiedad una vez pagada.
    function release()public {
        require(address(this).balance == amount, "No se puede liberar hasta que no se deposite el dinero");
        require(msg.sender == lawyer, "Solo el abogado puede liberar");
        payee.transfer(amount);
    }

    //Obtener el balance de la billetera.
    function balance()view public returns(uint){
        return address(this).balance;
    }
}