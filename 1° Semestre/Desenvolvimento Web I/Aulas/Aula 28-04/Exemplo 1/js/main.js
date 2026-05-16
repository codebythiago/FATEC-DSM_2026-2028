const BOTAO_SOMA = document.getElementById('btn-soma');

function calcularSoma() {
    const RESULTADO = document.querySelector('div#resultado');

    let n1 = Number(document.getElementById('n1').value);
    let n2 = Number(document.getElementById('n2').value);

    let soma = n1 + n2;

    RESULTADO.innerHTML = `Resultado: ${soma}`;
}

BOTAO_SOMA.addEventListener('click', () => {
  calcularSoma();
})