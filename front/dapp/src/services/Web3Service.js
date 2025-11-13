import Web3 from "web3";
import ABI from "./ABI.json";

const CONTRACT_ADDRESS = "0x04895fd14b31f4d48a42b552259f23496d009f12";

export async function doLogin() {
    if(!window.ethereum) throw new Error(`Metamask não instalada!`);

    const web3 = new Web3(window.ethereum);
    const accounts = await web3.eth.requestAccounts();

    if(!accounts || !accounts.length) throw new Error(`Acesso negado à MetaMask!`);

    localStorage.setItem("wallet", accounts[0]);
    return accounts[0];
}

function getContract() {
    if(!window.ethereum) throw new Error(`Metamask não instalada!`);

    const from = localStorage.getItem("wallet");
    const web3 = new Web3(window.ethereum);
    return new web3.eth.Contract(ABI, CONTRACT_ADDRESS, { from });
}

export async function registraAnimal(_nome, _codPropriedade) {
    const contract = getContract();
    return contract.methods.registraAnimal(_nome, _codPropriedade).send();
}
