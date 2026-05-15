document.getElementById('meuFormulario').addEventListener('submit', (event) => {
    // Impede o envio real do formulário para validar primeiro
    event.preventDefault();

    // Reset das mensagens de Erro
    document.querySelectorAll('.erro').forEach(e => e.style.display = 'none');

    let formValido = true;

    // Validação do nome
    const nome = document.getElementById('nome').value;

    if(nome.trim() === "") {
        document.getElementById('erro-nome').style.display = 'block';
        formValido = false;
    }

    // Validação do Email
    const email = document.getElementById('email').value;
    const regexEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if(!regexEmail.test(email)) {
        document.getElementById('erro-email').style.display = 'block';
        formValido = false;
    }

    // Validação da Senha
    const senha = document.getElementById('senha').value;
    
    if(senha.length < 6) {
        document.getElementById('erro-senha').style.display = 'block';
        formValido = false;
    }

    // Se tudo estiver validado
    if(formValido) {
        document.getElementById('mensagem-sucesso').style.display = 'block';
        
        // Limpa o formulário
        this.reset(); 
    }
});