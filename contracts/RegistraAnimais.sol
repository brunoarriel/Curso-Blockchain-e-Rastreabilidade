// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

struct Animal {
    uint256 id; // Número de identificação 
    address proprietario; // Endereço da carteira do proprietario
    string nome; // Nome do Animal
    uint256 codPropriedade; // Código da propriedade de localização do animal
}

contract RegistraAnimais {
    
    // Variáveis de controle do contrato
    uint256 public ultimoRegistro; // Armazena o código do último registro animal

    // Mapeamentos para facilitar buscas no contrato
    // Registra os animais pelo seu número de identificação
    mapping(uint256 => Animal) public animais;  
    

}