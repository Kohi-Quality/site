var ValorArabica = Number(1015 / 60).toFixed(2); // valor de 1 Kg de Arábica
var ValorConilon = Number(864 / 60).toFixed(2); // valor de 1 Kg de Conilon

var Porcentagem = Number(0.2); // redução de perdas com nossos serviços

function calcular() {
    div1.style = `display: flex`;
    div1.innerHTML = ` `; // Apaga a simulação anterior
    var Produzidos = Number(inProduzido.value); // Sacas produzidas por ano
    var KgProduzidos = Produzidos * 60; // Kg produzidos por ano
    var Perdido = Number(inPerda.value); // Kg perdidos por ano
    var option = Number(opcoes.value); // Tipo escolhido de café
    var Total = KgProduzidos - Perdido; // Quantidade inicial de Kg de café sem nossos serviços

    var TotalPerda = Perdido * Porcentagem; // Total de perdas com a redução dos nossos serviços
    var QuantidadeFinal = KgProduzidos - TotalPerda; // Quantidade final de Kg de café com nossos serviços

    if (option == 1) { // tipo de café = Arábico
        Total *= ValorArabica; // Aproveitamento sem nossos serviços
        QuantidadeFinal *= ValorArabica; // Novo aproveitamento
    }
    if (option == 2) { // tipo de café = Conilon
        Total *= ValorConilon; // Aproveitamento sem nossos serviços
        QuantidadeFinal *= ValorConilon; // Novo aproveitamento
    }
    div1.innerHTML =
    `<span class="H2">Simulando:</span>
    Ao não utilizar nossos processos de controle, você tem lucro final de café tipo Arábico de R$${Total.toFixed(2).replace(".", ",")}
    <br><br>
    Seus lucros vão para R$${QuantidadeFinal.toFixed(2).replace(".", ",")} ao utilizar nossos serviços na Kohi Quality
    <br><br><br>
    <span class="H2">Como Funciona?</span>
    Com nossos serviços de controle de qualidade no processo de armazenamento, há uma diminuição percentual de 20% da quantidade de quilos perdidos, totalizando um aumento de 25-30% de lucro para sua empresa.
    <br><br><br>
    <span class="H2">Informações de Mercado</span>
    Peso padrão por saca: 60Kg
    <br><br>
    Preço da saca Árabica: R$1.015,00
    <br><br>
    Preço da saca Conilon: R$864,00
    <br><br>
    <span class="update">Valores atualizados em 20/03/2024</span>`;
}
