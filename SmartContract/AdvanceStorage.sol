// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.26;

//Smart contract de almacenamiento avanzado.
contract AdvanceStorage{
    //Array de los numeros/ids
    uint [] public ids;

    //funcion añadir numeros/ids 
    function add(uint _id) public{
        ids.push(_id);
    }

    //funcion obtener el numero o id, indicando la posicion del numero.
    function get(uint _position) view public returns(uint){
        return ids[_position];
    }

    //obtener todos los numeros o ids introducidos.
    function getAll()view public returns(uint[] memory){
        return ids;
    }

    //obtener cuantos numeros o ids hay introducidos.
    function length()view public returns(uint){
        return ids.length;
    }
}