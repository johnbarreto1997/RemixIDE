// SPDX-License-Identifier: GPL 3.0
pragma solidity ^0.8.26;

//Aplicacion CRUD - CREATE / READ / UPDATE and DELETE 
contract CRUD{

        //Estructura de un usuario
        struct User{
            uint id;
            string name;
        }
        
        //Lista de los usuarios 
        User[] users;

        //Proximo id del usuario
        uint nextId;

        //Funcion para crear un usuario
        function create(string memory _name)public{
            users.push(User(nextId, _name));
            nextId++;
        }

        //Funcion para buscar el id del usuario.
        function find(uint id)view internal returns(uint){
            for(uint i=0; i< users.length ; i++){
                if(users[i].id == id){
                    return i;
                }
            }
            revert('EL USUSARIO NO EXISTE');
        }

        //Funcion para obtener los datos de un usuario con el id 
        function read(uint _id) view public returns(uint, string memory){
            uint i= find(_id);
            return(users[i].id, users[i].name);
        }


        //funcion de actualizar 
        function update(uint _id, string memory _name)public {
            uint i= find(_id);
            users[i].name = _name;
        }


        //Funcion de eliminar 
        function destroy(uint _id)public {
            uint i= find(_id);
            delete users[i];
        } 

}