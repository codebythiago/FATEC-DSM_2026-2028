function calcularIdade(dataNascimento) {
    const hoje = new Date();
    const nascimento = new Date(dataNascimento);
    let idade = hoje.getFullYear() - nascimento.getFullYear();
    const mes = hoje.getMonth() - nascimento.getMonth();

    if (mes < 0 || mes === 0 && hoje.getDate() < nascimento.getDate()) {
        idade--;

    }
    return idade;
}

let idade = calcularIdade('2007-10-18');

document.getElementById('idade').textContent = idade;