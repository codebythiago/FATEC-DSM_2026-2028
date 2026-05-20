const formCadastro = document.getElementById("form-cadastro-simples");

formCadastro.addEventListener("submit", (event) => {
  event.preventDefault();

  const nome = document.getElementById("nome");
  const email = document.getElementById("email");
  const senha = document.getElementById("senha");
  const senhaNovamente = document.getElementById("senha-novamente");

  document.querySelectorAll('.erro').forEach(e => {e.style.display = 'none'} )

  let formularioValido = true;

  if (nome.value.trim().length < 3) {
    document.getElementById("erro-nome").style.display = "block";
    formularioValido = false;
  }

  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

  if (!emailRegex.test(email.value)) {
    document.getElementById("erro-email").style.display = "block";
    formularioValido = false;
  }

  if (senha.value.length < 8) {
    document.getElementById("erro-senha").style.display = "block";
    formularioValido = false;
  }

  if (senha.value !== senhaNovamente.value) {
    document.getElementById("erro-senha-novamente").style.display = "block";
    formularioValido = false;
  }

  if (formularioValido) {
    alert("Cadastro realizado com sucesso!");
    formCadastro.submit();
  }
});