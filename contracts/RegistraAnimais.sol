// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

struct Animal {
    uint256 id; // Número de identificação 
    address proprietario; // Endereço da carteira do proprietario
    string nome; // Nome do Animal
    uint256 codPropriedade; // Código da propriedade de localização do animal
    uint256 [] histMovAnimal; // Histórico da Movimentação animal
    uint256 dataRegistro; // Data do registro do Animal
    uint256 preco; // Preço do animal para venda
}

contract RegistraAnimais {
    
    // Variáveis de controle do contrato
    uint256 public ultimoRegistro; // Armazena o código do último registro animal

    // Mapeamentos para facilitar buscas no contrato
    // Registra os animais pelo seu número de identificação
    mapping(uint256 => Animal) public animais;
    
    // Registrando um animal
    function registraAnimal(string memory _nome, uint256 _codPropriedade) public {

        ultimoRegistro++; // Gerando o número de identificação do animal
        animais[ultimoRegistro] = Animal(
            ultimoRegistro, // Salvando o número de identificação gerado
            msg.sender, // Recuperando o endereço da carteira do proprietário            
            _nome, // Salvando o Nome do Animal Registrado
            _codPropriedade, // Propriedade onde o animal esta localizado            
            new uint256[](0), // Inicializando o vetor de localização
            block.timestamp, // Resgatando a hora do bloco que o registro foi realizado
            0 // Inicialmente o animal não esta à venda
            ); 

        // Salvando a primeira localização do animal
        animais[ultimoRegistro].histMovAnimal.push(_codPropriedade);
    } 

    // Consultando histórico de moviventação
    function getHistMov(uint256 _codAnimal) public view returns (uint256[] memory) {
        // Verifica se o animal informado existe
        require(animais[_codAnimal].id != 0, unicode"Animal não encontrado");
        // Retornando o histórico de movimentação do animal
        return animais[_codAnimal].histMovAnimal;
    }

    // Transportar animal
    function movAnimal(uint256 _codAnimal, uint256 _codDestino) public {
        // Verifica se o animal informado existe
        require(animais[_codAnimal].id != 0, unicode"Animal não encontrado");        
        // Somente o proprietário pode realizar a transferência
        require(animais[_codAnimal].proprietario == msg.sender, unicode"Apenas o proprietário poder realizar a movimentação");        
        // Registrando a movimentação do animal
        animais[_codAnimal].histMovAnimal.push(_codDestino);
        // Atualiza o código da propriedade onde o animal esta localizado
        animais[_codAnimal].codPropriedade = _codDestino;
    }

    // Cadastrar oferta
    function cadOferta(uint256 _codAnimal, uint256 _valor) public {
        // Verifica se o animal informado existe
        require(animais[_codAnimal].id != 0, unicode"Animal não encontrado");
        // Somente o proprietário pode criar oferta
        require(animais[_codAnimal].proprietario == msg.sender, unicode"Apenas o proprietário pode criar oferta");

        // Registra o valor da venda
        animais[_codAnimal].preco = _valor;        
    }

    // Comprar animal
    function comprarAnimal(uint256 _codAnimal, uint256 _Destino) public payable {
        // Verifica se o animal informado existe
        require(animais[_codAnimal].id != 0, unicode"Animal não encontrado");
        // Verifica se o animal está a venda
        require(animais[_codAnimal].preco != 0, unicode"Animal não está a venda");
        // O proprietário não pode comprar o próprio animal
        require(animais[_codAnimal].proprietario != msg.sender, unicode"Você já é proprietario do animal");
        // Verifica se o valor pago é igual ao valor da venda
        require(msg.value >= animais[_codAnimal].preco, unicode"Valor pago é menor que o da oferta");

        // Atualiza o proprietário do animal
        animais[_codAnimal].proprietario = msg.sender;

        // Atualiza a localização do animal
        movAnimal(_codAnimal, _Destino);

        // Retirando a oferta de venda
        animais[_codAnimal].preco = 0;
    }

}