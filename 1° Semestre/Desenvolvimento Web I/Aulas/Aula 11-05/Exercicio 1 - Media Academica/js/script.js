const formMedia = document.getElementById("form-media-academica");
const resultadoContainer = document.getElementById('resultado')
const divMedia = document.getElementById("media");
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
    divMedia.innerHTML = `<b>Média</b>: ${media}`;
    divSituacao.innerHTML = `<b>Situação</b>: Aprovado`;
    resultadoContainer.style.background = "#40d64f62";
    resultadoContainer.style.borderColor = "#40d64f";
  } else if (media > 3) {
    divMedia.innerHTML = `<b>Média</b>: ${media}`;
    divSituacao.innerHTML = `<b>Situação</b>: Exame`;
    resultadoContainer.style.background = "#ff8d3062";
    resultadoContainer.style.borderColor = "#ff8d30";
  } else {
    divMedia.innerHTML = `<b>Média</b>: ${media}</strong>`;
    divSituacao.innerHTML = `<b>Situação</b>: Reprovado`;
    resultadoContainer.style.background = "#ff000062";
    resultadoContainer.style.borderColor = "#ff0000";
  }
}
