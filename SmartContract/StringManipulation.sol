// SPDX-License-Identifier: GPL - 3.0
pragma solidity ^0.8.26;

//Smart contract para manipular un string.
contract String{
    //Funcion para obtener el largo del string.
    function length(string memory _string) pure public returns (uint){
        //Para btener el largo de un string debemos transformar el string en bytes.
        bytes memory _string_bytes = bytes(_string);
        return _string_bytes.length;
    }

    //Funcion para concatenar dos strings.
    function concatenante(string memory _str1, string memory _str2) pure public returns(string memory){
        //Para concatenar dos strings con solidity actualmente solo es posible si lo pasamos a bytes.
        bytes memory str1_bytes = bytes(_str1);
        bytes memory str2_bytes = bytes(_str2);
        //Creamos un nuevo string de los dos strings que hemos pasado a bytes.
        string memory str = new string(str1_bytes.length + str2_bytes.length);
        //Volvemos a pasar el nuevo string a bytes.
        bytes memory str_bytes = bytes(str);
        //Hacemos un loop de todos los bytes del string 1 y 2 para luego copiarlo en el output del stri8ng que hemos llamado str_bytes.
        uint j=0;
        for(uint i=0; i<str1_bytes.length;i++){
            str_bytes[j] = str1_bytes[i];
            j++;
        }
        for(uint i=0; i<str2_bytes.length;i++){
            str_bytes[j] = str2_bytes[i];
            j++;
        }

        return string(str_bytes);
    }
}