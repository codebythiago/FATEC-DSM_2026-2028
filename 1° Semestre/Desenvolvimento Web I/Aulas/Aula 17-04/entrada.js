import readline from 'node:readline/promises';
import {stdin as input, stdout as output} from 'node:process';

const rl = readline.createInterface({input, output});

// Calculando a média e 3 notas:

const n1Input = await rl.question("Digite a primeira nota: ")
let n1 = parseFloat(n1Input);

const n2Input = await rl.question("Digite a segunda nota: ")
let n2 = parseFloat(n2Input);

let m = (n1 + n2) / 2;

console.log(media);

rl.close();