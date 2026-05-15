import readline from 'node:readline/promises';
import {stdin as input, stdout as output} from 'node:process';

const rl = readline.createInterface({input, output});

// Fazer um programa que leia a idade de uma pessoa e informe se esta pode dirigir. A condição para ter habilitação é possuir 18 anos ou mais.

console.log("Vamos ver se você pode dirigir!")

let idade = parseFloat(await rl.question("Digite sua idade: "));

if (idade >= 18) {
    console.log("Você pode dirigir!")
} else {
    console.log("Você NÃO pode dirigir")
}

rl.close();