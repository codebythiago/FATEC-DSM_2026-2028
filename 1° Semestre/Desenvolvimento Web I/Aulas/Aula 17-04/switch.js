import readline from 'node:readline/promises';
import {stdin as input, stdout as output} from 'node:process';

const rl = readline.createInterface({input, output});

// Ler um número e informar qual o curso escolhido.

let executando = true;

while (executando) {
        let num = parseInt(await rl.question("Informe o Curso: [1] DSM [2] - GE [2] - [3] ADS: "));

        if(isNaN(num)) {
            console.log("Impossível de ler o valor! Correspondente ao curso.")
            continue;
        }

        if (num != 1 && num != 2 && num != 3) {
        /* Mais profissional: if(![1,2,3].includes(num))*/  
            console.log("Digite um valor válido.");
            continue;
        }

        switch (num) {
            case 1:
                console.log("Desenvolvimento de Software Multiplataforma");
                executando = false;
                break;
            case 2:
                console.log("Gestão Empresarial");
                executando = false;
                break;
            case 3:
                console.log("Análise e Desenvolvimento de Sistemas");
                executando = false;
                break;
            default: 
                console.log("Opção Inválida.")
                break;
        }
}

rl.close();