const formMedia = document.getElementById("form-media-academica");
const divResultado = document.getElementById("resultado");
const divSituacao = document.getElementById("situacao");

formMedia.addEventListener("submit", (event) => {
  event.preventDefault();

  calcular();
});

function calcular() {
  let n1 = Number(document.getElementById("n1").value) || 0;
  let n2 = Number(document.getElementById("n2").value) || 0;
  let n3 = Number(document.getElementById("n3").value) || 0;
  let n4 = Number(document.getElementById("n4").value) || 0;

  let media = (n1 + n2 + n3 + n4) / 4;

  if (media >= 6) {
    divResultado.innerHTML = `Média: <strong>${media}</strong>`;
    divSituacao.innerHTML = `Situação: <strong>Aprovado</strong>`;
    divSituacao.style.background = "#46a84f";
  } else if (media > 3) {
    divResultado.innerHTML = `Média: <strong>${media}</strong>`;
    divSituacao.innerHTML = `Situação: <strong>Exame</strong>`;
    divSituacao.style.background = "#c0671f";
  } else {
    divResultado.innerHTML = `Média: <strong>${media}</strong>`;
    divSituacao.innerHTML = `Situação: <strong>Reprovado</strong>`;
    divSituacao.style.background = "#ff0000";
  }
}
