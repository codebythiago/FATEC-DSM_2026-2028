// taxas fixas em relação ao REAL (BRL)
const taxas = {
    BRL: 1,
    USD: 5.06,
    EUR: 5.87,
    GBP: 6.78,
    JPY: 0.032,
    CNY: 0.74
};

function buscarTaxaConversao(moedaDe, moedaPara) {
    const taxaBase = taxas[moedaDe];
    const taxaDestino = taxas[moedaPara];

    return taxaBase / taxaDestino;
}

function simboloMoeda(moeda) {
    if (moeda === 'BRL') return "R$";
    if (moeda === 'USD') return "$";
    if (moeda === 'EUR') return "€";
    if (moeda === 'GBP') return "£";
    if (moeda === 'JPY') return "¥";
    if (moeda === 'CNY') return "元";
}

document.getElementById('form-moedas').addEventListener('submit', (event) => {
    event.preventDefault();

    const valor = Number(document.getElementById('valor').value);
    const moedaDe = document.getElementById('moedaDe').value;
    const moedaPara = document.getElementById('moedaPara').value;

    const simboloMoedaDe = simboloMoeda(moedaDe);
    const simboloMoedaPara = simboloMoeda(moedaPara);

    const taxa = buscarTaxaConversao(moedaDe, moedaPara);
    const conversao = valor * taxa;

    document.getElementById('resultado').innerHTML =
        `<p><b>${simboloMoedaDe} ${valor.toFixed(2)}</b> equivale à <b>${simboloMoedaPara} ${conversao.toFixed(2)}</b></p>`;
});