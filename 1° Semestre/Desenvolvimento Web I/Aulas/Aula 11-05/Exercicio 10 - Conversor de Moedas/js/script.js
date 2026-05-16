async function buscarTaxaConversao(moedaDe, moedaPara) {
    const url = `https://v6.exchangerate-api.com/v6/${EXCHANT_RATE_API_KEY}/pair/${moedaDe}/${moedaPara}`;
    
    const resposta = await fetch(url);
    const dados = await resposta.json();

    return dados.conversion_rate;
}

function simboloMoeda(moeda) {
    if(moeda === 'BRL') return "R&#36;";
    if(moeda === 'USD') return "&#36;";
    if(moeda === 'EUR') return "&euro;";
    if(moeda === 'GBP') return "&pound;";
    if(moeda === 'JPY') return "&yen;";
    if(moeda === 'CNY') return "&#20803;";
}

document.getElementById('form-moedas').addEventListener('submit', async (event) => {
    event.preventDefault();

    const valor = Number(document.getElementById('valor').value);
    const moedaDe = document.getElementById('moedaDe').value;
    const moedaPara = document.getElementById('moedaPara').value;
    const simboloMoedaDe = simboloMoeda(moedaDe);
    const simboloMoedaPara = simboloMoeda(moedaPara);

    let taxa = await buscarTaxaConversao(moedaDe, moedaPara);
    let conversao = valor * taxa;

    document.getElementById('resultado').innerHTML = `${simboloMoedaDe} ${valor.toFixed(2)} equivale à ${simboloMoedaPara} ${conversao.toFixed(2)}`;    
})

document.addEventListener('keydown', (event) => {
    document.getElementById('converter-btn').click();
})