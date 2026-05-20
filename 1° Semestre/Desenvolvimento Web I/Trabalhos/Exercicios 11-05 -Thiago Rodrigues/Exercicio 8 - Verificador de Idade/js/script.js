const verificarBtn = document.querySelector('#verificar-btn');
const formIdade = document.getElementById('form-idade');

function calcularIdade(dataNasc) {
  const dataAtual = new Date();
  const anoAtual = dataAtual.getFullYear();  
  const anoNasc = dataNasc.getFullYear();   
  const mesAtual = dataAtual.getMonth();  
  const mesNasc = dataNasc.getUTCMonth();  
  const diaAtual = dataAtual.getDate();  
  const diaNasc = dataNasc.getUTCDate();

  let idade = anoAtual - anoNasc;

  if(mesAtual > mesNasc || mesAtual === mesNasc && diaAtual >= diaNasc) {
    return idade;
  } else {
    return idade - 1;
  }
}

formIdade.addEventListener('submit', (event) => {
  event.preventDefault();

  const dataNasc = new Date(document.querySelector('#data-nasc').value);

  let idade = calcularIdade(dataNasc);

  const exibirIdade = document.getElementById('exibir-idade');
  const maiorMenorIdade = document.getElementById('maior-menor-idade');

  exibirIdade.innerHTML = `Você possui: ${idade}`;
  maiorMenorIdade.innerHTML = idade >= 18? "Você é maior de idade" : "Você é menor de idade";
});

document.addEventListener('keydown', (event) => {
  if(event.key === "Enter") {
    verificarBtn.click();
  }
})