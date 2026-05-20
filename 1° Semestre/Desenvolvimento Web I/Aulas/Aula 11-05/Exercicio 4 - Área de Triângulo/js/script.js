
/* Primeiramente, qual o fluxo?
  
1. O usuário digita os dois valores e escolhe o tipo de unidade da base, altura e área do triângulo.
2. Após o usuário clicar no botão "Calcular Área" ou a tecla "Enter" do teclado, é realizado o cálculo da seguinte forma:
3. Ambas as unidades são convertidas para metros (base e altura)
4. A área é calculada em m²
5. A área em m² é convertida para o tipo de unidade da area que o usuário escolheu
*/

const unidades = {
  mm: 0.001,
  cm: 0.01,
  dm: 0.1,
  m: 1,
  dam: 10,
  hm: 100,
  km: 1000
}

// 3. Ambas as unidades são convertidas para metros (base e altura)
function converterParaMetros(unidade, valor) {
  return valor * unidades[unidade]
}

function converterAreaFinal(unidade, areaEmMetros2) {
  return areaEmMetros2 / Math.pow(unidades[unidade], 2)
}

const calcularBtn = document.getElementById('calcular-btn');
const resultadoUnidadeArea = document.getElementById('res-unidade-area');

function calcularAreaTriangulo(base, altura) {
  return base * altura / 2;
}

calcularBtn.addEventListener('click', function () {
  const base = Number(document.getElementById('base').value) || 0;
  const altura = Number(document.getElementById('altura').value) || 0;
  const tipoUnidadeBase = document.getElementById('unidade-base').value;
  const tipoUnidadeAltura = document.getElementById('unidade-altura').value;
  const tipoUnidadeArea = document.getElementById('unidade-area').value;

  // Converter para metros
  const baseMetros = converterParaMetros(tipoUnidadeBase, base);
  const alturaMetros = converterParaMetros(tipoUnidadeAltura, altura);
  const areaEmMetros2 = calcularAreaTriangulo(baseMetros, alturaMetros);

  // Converter para unidade de área escolhida
  const areaFinal = converterAreaFinal(tipoUnidadeArea, areaEmMetros2);

  resultadoUnidadeArea.innerHTML = `${areaFinal.toFixed(2)} ${tipoUnidadeArea}<sup>2</sup>`
})

document.addEventListener('keydown', (event) => {
  if(event.key === 'Enter') {
    calcularBtn.click();
  }
});