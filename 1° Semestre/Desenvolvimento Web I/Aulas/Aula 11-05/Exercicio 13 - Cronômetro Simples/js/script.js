const tempoPrincipal = document.getElementById("tempo-principal");
const tempoVolta = document.getElementById("tempo-volta");
let horas = 0;
let minutos = 0;
let segundos = 0;
let estaRodando = false;
let intervalo;

let numeroVoltas = 0;
let horasVolta = 0;
let minutosVolta = 0;
let segundosVolta = 0;
let intervaloVolta = 0;

function formatar(valor) {
  if (valor < 10) {
    return `0${valor}`;
  }
  return valor;
}

function cronometroFormatado(horas, minutos, segundos) {
  return `${formatar(horas)}:${formatar(minutos)}:${formatar(segundos)}`;
}

function atualizarDisplay() {
  let tempoAtual = cronometroFormatado(horas, minutos, segundos);
  tempoPrincipal.innerHTML = tempoAtual;

  tempoVolta.innerHTML = cronometroFormatado(
    horasVolta,
    minutosVolta,
    segundosVolta,
  );

  if (tempoAtual !== "00:00:00") {
    restaurarVoltaBtn.disabled = false;
  } else {
    restaurarVoltaBtn.disabled = true;
  }

  if (numeroVoltas > 0) {
    tempoVolta.classList.add("ativo");
  } else {
    tempoVolta.classList.remove("ativo");
  }
}

function calcularTempoPrincipal() {
  segundos++;
  if (segundos === 60) {
    minutos++;
    segundos = 0;
  }

  if (minutos === 60) {
    horas++;
    minutos = 0;
  }
  atualizarDisplay();
}

function calcularTempoVolta() {
  segundosVolta++;
  if (segundosVolta === 60) {
    minutosVolta++;
    segundosVolta = 0;
  }

  if (minutosVolta === 60) {
    horasVolta++;
    minutosVolta = 0;
  }
  atualizarDisplay();
}

function iniciar() {
  estaRodando = true;
  intervalo = setInterval(calcularTempoPrincipal, 1000);
  intervaloVolta = setInterval(calcularTempoVolta, 1000);
}

function pausar() {
  clearInterval(intervalo);
  clearInterval(intervaloVolta);
  estaRodando = false;
}

function restaurar() {
  horas = minutos = segundos = 0;
  numeroVoltas = 0;
  atualizarDisplay();
  document.querySelector("#voltas tbody");
  restaurarVoltaBtn.innerText = "Volta";
  playBtn.innerText = "Iniciar";
  document.querySelector("#voltas tbody").innerHTML = "";
}

function adicionaVolta() {
  numeroVoltas++;

  const novaVolta = `<tr>
    <td>${numeroVoltas}</td>
    <td>${cronometroFormatado(horasVolta, minutosVolta, segundosVolta)}</td>
    <td>${cronometroFormatado(horas, minutos, segundos)}</td>
  </tr>`;
  document.querySelector("#voltas tbody").innerHTML += novaVolta;

  if (numeroVoltas > 0) {
    tempoVolta.classList.add("ativo");
  } else {
    tempoVolta.classList.remove("ativo");
  }

  tempoVolta.innerText = "00:00:00";
  horasVolta = minutosVolta = segundosVolta = 0;
}

const playBtn = document.getElementById("play-btn");
const restaurarVoltaBtn = document.getElementById("restaurar-volta-btn");

playBtn.addEventListener("click", () => {
  if (!estaRodando) {
    iniciar();
    playBtn.innerText = "Pausar";
    restaurarVoltaBtn.innerText = "Volta";
  } else if (estaRodando && tempoPrincipal.innerText === "00:00:00") {
    pausar();
    playBtn.innerText = "Iniciar";
  } else {
    pausar();
    playBtn.innerText = "Retomar";
    restaurarVoltaBtn.innerText = "Restaurar";
  }
});

restaurarVoltaBtn.addEventListener("click", () => {
  if (estaRodando) {
    adicionaVolta();
  } else {
    restaurar();
  }
});
