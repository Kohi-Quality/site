var ValorArabica = Number(1015 / 60).toFixed(2); // valor de 1 Kg de Arábica
var ValorConilon = Number(864 / 60).toFixed(2); // valor de 1 Kg de Conilon

var Porcentagem = Number(0.2); // redução de perdas com nossos serviços

function calcular() {
    div1.style = `display: flex`;
    div1.innerHTML = ` `; // Apaga a simulação anterior
    var Produzidos = Number(inProduzido.value); // Sacas produzidas por ano
    var KgProduzidos = Produzidos * 60; // Kg produzidos por ano
    var Perdido = Number(inPerda.value); // Kg perdidos por ano
    var option = opcoes.value; // Tipo escolhido de café
    var Total = KgProduzidos - Perdido; // Quantidade inicial de Kg de café sem nossos serviços

    var TotalPerda = Perdido * Porcentagem; // Total de perdas com a redução dos nossos serviços
    var QuantidadeFinal = KgProduzidos - TotalPerda; // Quantidade final de Kg de café com nossos serviços
        
    if(option == "#") {
        div1.innerHTML = `<div style="color: red;"><b>SELECIONE UM TIPO DE CAFÉ VÁLIDO PARA A SIMULAÇÂO!</b></div>`
    } else{
        if (option == "1") { // tipo de café = Arábico
            var tipo = "Arábica";
            Total *= ValorArabica; // Aproveitamento sem nossos serviços
            QuantidadeFinal *= ValorArabica; // Novo aproveitamento
        }
        if (option == "2") { // tipo de café = Conilon
            var tipo = "Conilon";
            Total *= ValorConilon; // Aproveitamento sem nossos serviços
            QuantidadeFinal *= ValorConilon; // Novo aproveitamento
        }

        var diferenca = QuantidadeFinal - Total;

        div1.innerHTML =
        `<span>
        <h2 class="H2">Simulando:</h2>
        Ao <span style="color: red;">NÃO</span> utilizar nossos processos de controle, você tem lucro final de café tipo ${tipo} de <span style="color: red;"> ${Total.toLocaleString('pt-br' ,{ style: 'currency', currency: 'BRL' })}</span>.
        <br><br>    
        Seus lucros vão para <span style="color: green;">${QuantidadeFinal.toLocaleString('pt-br' ,{ style: 'currency', currency: 'BRL' })}</span> ao utilizar nossos serviços na Kohi Quality.
        <br><br><br>
        Gerando a diferença de <span style="color: green;">${diferenca.toLocaleString('pt-br' ,{ style: 'currency', currency: 'BRL' })}</span>
        <br>
        <span class="H2">Informações de Mercado:</span>
        <br><br>
        Peso padrão por saca: 60Kg
        <br><br>
        Preço da saca Árabica: R$1.015,00
        <br><br>
        Preço da saca Conilon: R$864,00
        <br><br>
        `;
    }
}
