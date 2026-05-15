import readline from 'node:readline/promises';
import {stdin as input, stdout as output} from 'node:process';

const rl = readline.createInterface({input, output});

// Ler um valor que leia um número de 1 a 5 e escreva por extenso.

let executando = true;

while (executando) {
        let num = parseInt(await rl.question("Informe um valor de 1 a 5: "));

        if(isNaN(num)) {
            console.log("Impossível de ler o valor! Digite um número entre 1 e 5!")
        }


        if (num < 0 || num > 5) {       
            console.log("Digite um valor entre 1 e 5!");
            continue;
        }

        switch (num) {
            case 1:
                console.log("Um");
                executando = false;
                break;
            case 2:
                console.log("Dois");
                executando = false;
                break;
            case 3:
                console.log("Três");
                executando = false;
                break;
            case 4:
                console.log("Quatro");
                executando = false;
                break;
            case 5:
                console.log("Cinco");
                executando = false;
                break;
        }
}

rl.close();