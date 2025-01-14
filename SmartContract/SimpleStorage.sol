// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.26;

// Smart contract simple almacenamiento de datos.
contract SimpleStorage{

    //String fijo.
    string public data="Hola Mundo";

    //funcion para cambiar el string "data".
    function setdata(string memory _data)public{
        data = _data;
    }

    //funcion para obtener el string de data
    function getdata()view public returns(string memory){
        return data;
    }
}