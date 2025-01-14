// SPDX-License-Identifier: GPL - 3.0
pragma solidity ^0.8.26;

//Smart contract para hacer un trato o acuerdo con un tiempo estipulado para retirar el dinero.
contract Deed{

            //Direccion del abogado.
            address public lawyer;

            //Direccion del beneficiario.
            address payable public beneficiary;

            //Establecer un tiemo estipulado.
            uint public earliest;


            //Constructor del smart contract.
            constructor(address _lawyer, address payable _beneficiary, uint fromNow)payable {
                lawyer = _lawyer;
                beneficiary = _beneficiary;
                earliest = block.timestamp + fromNow;
            }

            //Funcion para retirar el dinero con un tiempo minimo por cumplir.
            function withdraw()public {
                require(msg.sender==lawyer, "Solo puede enviar el dinero el abogado");
                require(block.timestamp>=earliest, "Es demasiado pronto para retirar el dinero");
                beneficiary.transfer(address(this).balance);
            }
}