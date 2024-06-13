var database = require("../database/config");

function cadastrar(nome, email,mensagem) {
  
  var instrucaoSql = `
  INSERT INTO leads(nome,email, mensagem) VALUES ('${nome}','${email}', '${mensagem}')
  `;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

module.exports = {
  cadastrar
}
