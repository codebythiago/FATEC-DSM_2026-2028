const gerarBtn = document.getElementById("gerar-btn");

function criaTabuada(numero) {
  let tabuada = "";

  for (let i = 0; i <= 10; i++) {
    tabuada += `<li>${numero} &times; ${i} = ${numero * i}</li>`;
  }

  return tabuada;
}

gerarBtn.addEventListener("click", function () {
  const numeroDigitado = Number(document.getElementById("numero").value) || 1;
  const tabuadaContainer = document.getElementById("tabuada");

  const tabuada = criaTabuada(numeroDigitado);

  tabuadaContainer.innerHTML = tabuada;
});

document.addEventListener("keydown", (event) => {
  if (event.key === "Enter") gerarBtn.click();
});
