function parOuImpar(numero) {
  if (numero % 2 === 0)
    return "par"
  else
    return "ímpar"
}

document.getElementById('form-par-impar').addEventListener('submit', (event) => {
  event.preventDefault();

  const valorNum = Number(document.getElementById('valor-num').value);

  document.getElementById('resultado').innerHTML = `${valorNum} é <strong>${parOuImpar(valorNum)}</strong>`;
})