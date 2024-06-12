var database = require("../database/config");

function buscarUltimasMedidas_Alfa(limite_linhas) {

    var instrucaoSql = `SELECT temperatura, umidade FROM medida where fkSensor = 1 order by idMedida desc limit ${limite_linhas}; `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idAquario) {

    var instrucaoSql = `SELECT temperatura, umidade FROM medida WHERE fk_aquario = ${idAquario} ORDER BY id DESC LIMIT 1`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas_Alfa,
    buscarMedidasEmTempoReal
}
