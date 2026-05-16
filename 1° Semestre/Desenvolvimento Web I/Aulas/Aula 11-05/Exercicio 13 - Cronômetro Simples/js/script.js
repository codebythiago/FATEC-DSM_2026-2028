const displayCronometro = document.getElementById("display-cronometro");
let horas = 0;
let minutos = 0;
let segundos = 0;
let estaRodando = false;
let intervalo;

function atualizarDisplay() {
  displayCronometro.innerHTML = `${horas < 10 ? 0 : ""}${horas}:${minutos < 10 ? 0 : ""}${minutos}:${segundos < 10 ? 0 : ""}${segundos}`;
}

function iniciar() {
  if (!estaRodando) {
    estaRodando = true;
    intervalo = setInterval(function () {
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
    }, 1000);
  }
}

function pausar() {
  clearInterval(intervalo);
  estaRodando = false;
}

function restaurar() {
  if (!estaRodando) {
    horas = 0;
    minutos = 0;
    segundos = 0;
    atualizarDisplay();
  }
}

const playBtn = document.getElementById("play-btn");
const restaurarBtn = document.getElementById("restaurar-volta-btn");

playBtn.addEventListener("click", () => {
  if (estaRodando) {
    pausar();
    displayCronometro.innerText === "00:00:00"
      ? (playBtn.innerHTML = "Iniciar")
      : (playBtn.innerHTML = "Retomar");
    if (
      document.getElementById("display-cronometro").innerHTML !== "00:00:00" &&
      !estaRodando
    ) {
      restaurarBtn.disabled = false;
      restaurarBtn.innerHTML = "Restaurar";
    }
  } else {
    iniciar();
    playBtn.innerHTML = "Pausar";
    if (
      document.getElementById("display-cronometro").innerHTML !== "00:00:00" &&
      estaRodando
    ) {
      restaurarBtn.innerHTML = "Volta";
    }
  }
});

displayCronometro.addEventListener('change', () => {
  if(displayCronometro.innerHTML === "00:00:00") {
    restaurarBtn.disabled = true;
  } else {
    restaurarBtn.disabled = false;
  }
})

restaurarBtn.addEventListener('click', () => {
  if (estaRodando) {
    // Script de adicionar volta
  } else {
    restaurar();
    restaurarBtn.disabled = true;
    restaurarBtn.innerHTML = 'Volta';
  }
});
