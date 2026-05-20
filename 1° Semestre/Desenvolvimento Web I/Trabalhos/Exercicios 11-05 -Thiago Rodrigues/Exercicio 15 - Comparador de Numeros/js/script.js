const compararBtn = document.querySelector("#comparar-btn");

function comparar2Numeros(num1, num2) {
  if (num1 == num2) {
    return `${num2} é igual à ${num1}`
  } else if (num1 > num2) {
    return `${num1} é maior que ${num2}`;
  } else {
    return `${num2} é maior que ${num1}`;
  }
}

document.addEventListener('keydown', (event) => {
  if(event.key === "Enter") {
    compararBtn.click();
  }
})

compararBtn.addEventListener("click", (event) => {
  event.preventDefault();

  const num1 = Number(document.querySelector("#num1").value) || 0;
  const num2 = Number(document.querySelector("#num2").value) || 0;

  const comparacao = comparar2Numeros(num1, num2);

  document.getElementById('resultado').innerText = comparacao;
});
