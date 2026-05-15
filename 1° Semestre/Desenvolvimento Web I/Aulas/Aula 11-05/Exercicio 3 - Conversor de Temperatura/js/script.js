const resultado = document.getElementById('resultado');
const converterBtn = document.getElementById('converter-btn');

function converterParaCelsius(unidade, valor) {
  if(unidade === 'celsius') return valor;
  if(unidade === 'fahrenheit') return (valor - 32) / 1.8;
  if(unidade === 'kelvin') return valor - 273.15
}

function converterDeCelsiusPara(unidade, valor) {
  if(unidade === 'celsius') return valor;
  if(unidade === 'fahrenheit') return valor * 1.8 + 32;
  if(unidade === 'kelvin') return valor + 273.15
}

function simboloTemperatura(unidade) {
  if(unidade === 'celsius') return "°C";
  if(unidade === 'fahrenheit') return "°F";
  if(unidade === 'kelvin') return "K";
}

function converterTemperatura(temperatura, unidade1, unidade2) {
  let celsius = converterParaCelsius(unidade1, temperatura);
  return converterDeCelsiusPara(unidade2, celsius)
}

converterBtn.addEventListener('click', () => {
  const temperatura = Number(document.getElementById('temperatura').value) || 0;
  const unidade1 = document.getElementById('unidade1').value;
  const unidade2 = document.getElementById('unidade2').value;

  let conversaoFinal = converterTemperatura(temperatura, unidade1, unidade2);

  resultado.innerHTML = `${temperatura.toFixed(2)}${simboloTemperatura(unidade1)} equivale à ${conversaoFinal.toFixed(2)}${simboloTemperatura(unidade2)}.`;
})

document.addEventListener('keydown', (event) => {
  if(event.key === "Enter") {
    converterBtn.click();
  }
})