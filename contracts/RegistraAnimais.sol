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

    // Registro de movimentação do animal
    uint256[][] public movAnimal;

    // Texa para abertura de um leilão
    uint256  txLeilao = 100;

    function registraAnimal(string memory _nome, uint256 _codPropriedade) public {

        ultimoRegistro++; // Gerando o número de identificação do animal
        animais[ultimoRegistro] = Animal(
            ultimoRegistro, // Salvando o número de identificação gerado
            msg.sender, // Recuperando o endereço da carteira do proprietário            
            _nome, // Salvando o Nome do Animal Registrado
            _codPropriedade); // Salvando o codPropriedade
    } 

    

}