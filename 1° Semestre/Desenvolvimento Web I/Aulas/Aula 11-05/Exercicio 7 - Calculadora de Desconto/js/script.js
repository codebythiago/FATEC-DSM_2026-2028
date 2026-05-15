const calcularBtn = document.getElementById('calcular-btn');
const textoProduto = document.getElementById('res-valor-produto');
const textoDesconto = document.getElementById('res-valor-desconto');
const textoTotal = document.getElementById('res-total');

function calcularGorjeta(produto, porcentagemDesconto) {
  return produto * porcentagemDesconto / 100;
}

calcularBtn.addEventListener('click', () => {
  let valorProduto = Number(document.getElementById('valor-produto').value) || 0;
  let porcentagemDesconto = Number(document.getElementById('valor-desconto').value) || 0;

  let valorDesconto = calcularGorjeta(valorProduto, porcentagemDesconto)

  textoProduto.innerHTML = `Valor do Produto: R$ ${valorProduto.toFixed(2)}`
  textoDesconto.innerHTML = `Valor do Desconto: R$ ${valorDesconto.toFixed(2)}`
  textoTotal.innerHTML = `Valor Total: R$ ${(valorProduto - valorDesconto).toFixed(2)}`
})

document.addEventListener('keydown', (event) => {
  if(event.key === "Enter") {
    calcularBtn.click();
  }
})