const textoImc = document.getElementById("valor-imc");

document.addEventListener("keydown", (event) => {
  if (event.key == "Enter") {
    document.getElementById("submit-btn").click();
  }
});

function classicacaoImc(IMC) {
  if (IMC < 18.5) {
    let classificacao = {
      nomeImc: "Abaixo do peso",
      textoImc: "Seu peso está abaixo do recomendado",
      corImc: "#e49f1f",
    };
    return classificacao;
  } else if (18.5 <= IMC && IMC < 25) {
    let classificacao = {
      nomeImc: "Peso normal",
      textoImc: "Parabéns! Seu peso está dentro do adequado.",
      corImc: "#1f85e4",
    };
    return classificacao;
  } else if (25 <= IMC && IMC < 30) {
    let classificacao = {
      nomeImc: "Sobrepeso",
      textoImc: "Atenção! Seu peso está acima do recomendado.",
      corImc: "#e4e11f",
    };
    return classificacao;
  } else if (30 <= IMC && IMC < 35) {
    let classificacao = {
      nomeImc: "Obesidade Grau I",
      textoImc: "Procure acompanhamento médico e nutricional.",
      corImc: "#e4b61f",
    };
    return classificacao;
  } else if (35 <= IMC && IMC < 40) {
    let classificacao = {
      nomeImc: "Obesidade Grau II",
      textoImc: "Maior risco para saúde, recomenda-se avaliação médica.",
      corImc: "#e46e1f",
    };
    return classificacao;
  } else {
    let classificacao = {
      nomeImc: "Obesidade Grave/Grave III",
      textoImc: "Risco muito grave para saúde, acompanhamento urgente necessário.",
      corImc: "#e4261f",
    };
    return classificacao;
  }
}

document.getElementById("form-imc").addEventListener("submit", (event) => {
  event.preventDefault();

  let classificacao = document.querySelector('input[name="idade"]:checked');
  let peso = Number(document.getElementById("peso").value) || 0;
  let altura = Number(document.getElementById("altura").value) || 0;

  let IMC = peso / (altura * altura);

  if (peso === 0 || altura === 0) {
    IMC = 0;
  }

  let resultado = classicacaoImc(IMC);

  if(classificacao.id == 'crianca') {
    resultado.textoImc = "Para crianças e adolescentes, é necessário usar curvas de crescimento da OMS. Procure um pediatra para avaliação adequada.";
  }

  textoImc.innerHTML = `O seu IMC é ${IMC.toFixed(2)}`;

  document.getElementById('nome-imc').innerHTML = resultado.nomeImc;
  document.getElementById('texto-imc').innerHTML = resultado.textoImc;
  document.getElementById('resultado').style.borderColor = resultado.corImc;
});
