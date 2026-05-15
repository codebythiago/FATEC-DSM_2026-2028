function atualizar() {
    const nome = document.getElementById('produto').value;
    const preco = parseFloat(document.getElementById('preco').value) || 0;
    const quant = parseFloat(document.getElementById('quant').value) || 0;

    // Regra de Negócio
    const resumoTotal = preco * quant;

    // Resultado
    document.getElementById('resumoNome').innerText = nome.toUpperCase();

    // Imprimir valor com duas casas decimais
    document.getElementById('resumoTotal').innerText = resumoTotal.toFixed(2)
}