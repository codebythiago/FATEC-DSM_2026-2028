import readline from 'node:readline/promises';
import {stdin as input, stdout as output} from 'node:process';

const rl = readline.createInterface({input, output});

// Calcular a área de 3 triângulos com laço de repetição: (B*H/2)

let i = 1;

while(i <= 3) {
    let base = parseFloat(await rl.question(`Digite o valor da base do ${i}° triângulo: `));

    if(isNaN(base)) {
        console.log("O valor digitado não é um número!")
        continue;
    }

    let altura = parseFloat(await rl.question(`Digite o valor da altura do ${i}° triângulo: `))

    if(isNaN(altura)) {
        console.log("O valor digitado não é um número!")
        continue;
    }

    let area = (base * altura)/2;

    console.log(`O valor de um triângulo de base ${base} e altura ${altura} é: ${area}`);

    i++;
}

rl.close();