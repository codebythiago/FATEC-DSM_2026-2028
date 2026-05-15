const inputNome = document.getElementById('inputNome');
const labelNome = document.getElementById('labelNome');

// O evento 'input' detecta qualquer mudança (digitar, colar, apagar...)
inputNome.oninput 


inputNome.addEventListener('input', () => {
  const textoOriginal = inputNome.value;
  let quantCaracteres = inputNome.value.length;


  if(textoOriginal.trim() !== "") {
    labelNome.innerHTML = textoOriginal.toUpperCase() + "<br> Quantidade de caracteres: " + quantCaracteres;
  } else {
    labelNome.innerHTML = "AGUARDANDO DIGITAÇÃO";
  }

})