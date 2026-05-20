const calcularBtn = document.getElementById('calcular-btn');
const textoConta = document.getElementById('res-valor-conta');
const textoGorjeta = document.getElementById('res-valor-gorjeta');
const textoTotal = document.getElementById('res-total');

function calcularGorjeta(conta, porcentagemGorjeta) {
  return conta * porcentagemGorjeta / 100;
}

calcularBtn.addEventListener('click', () => {
  let valorConta = Number(document.getElementById('valor-conta').value) || 0;
  let porcentagemGorjeta = Number(document.getElementById('valor-gorjeta').value) || 0;

  let valorGorjeta = calcularGorjeta(valorConta, porcentagemGorjeta)

  textoConta.innerHTML = "R$ " + valorConta.toFixed(2);
  textoGorjeta.innerHTML = "R$ " + valorGorjeta.toFixed(2);
  textoTotal.innerHTML = "R$ " + (valorConta + valorGorjeta).toFixed(2);
})

document.addEventListener('keydown', (event) => {
  if(event.key === "Enter") {
    calcularBtn.click();
  }
})