function calcularConsumoMedio(distanciaPercorrida, quantLitros) {
  if (quantLitros === 0) {
    return 0;
  } else {
    return distanciaPercorrida / quantLitros;
  }
}

document
  .getElementById("form-consumo-combustivel")
  .addEventListener("submit", (event) => {
    event.preventDefault();

    const distanciaPercorrida =
      Number(document.getElementById("distancia-percorrida").value) || 0;
    const quantLitros =
      Number(document.getElementById("total-combustivel-gasto").value) || 0;

    const consumoMedio = calcularConsumoMedio(distanciaPercorrida, quantLitros);

    document.getElementById("p-distancia").innerHTML =
      `Distância Percorrida: <strong>${distanciaPercorrida.toFixed(2)} km</strong>`;
    document.getElementById("p-litros").innerHTML =
      `Quantidade de Litros usados: <strong>${quantLitros.toFixed(2)} l</strong>`;
    if(quantLitros === 0) {
      document.getElementById("p-consumo-medio").innerHTML = 'Consumo médio: <strong>Informe os litros usados</strong>';
    } else {
      document.getElementById("p-consumo-medio").innerHTML =
        `Consumo médio: <strong>${consumoMedio.toFixed(2)} km/l</strong>`;
    }
  });

document.addEventListener("keydown", (event) => {
  if (event.key === "Enter") {
    document.getElementById("calcular-btn").click();
  }
});
