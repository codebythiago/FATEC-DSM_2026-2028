async function buscarTaxaConversao(moedaDe, moedaPara) {
    const url = `https://v6.exchangerate-api.com/v6/${EXCHANT_RATE_API_KEY}/pair/${moedaDe}/${moedaPara}`;
    
    const resposta = await fetch(url);
    const dados = await resposta.json();

    return dados.conversion_rate;
}

document.getElementById('form-moedas').addEventListener('submit', async (event) => {
    event.preventDefault();

    const valor = Number(document.getElementById('valor').value);
    const moedaDe = document.getElementById('moedaDe').value;
    const moedaPara = document.getElementById('moedaPara').value;

    let taxa = await buscarTaxaConversao(moedaDe, moedaPara);
    let conversao = valor * taxa;
    console.log(conversao)
})