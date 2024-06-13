var leedModel = require("../models/leedModel");

function cadastrar(req, res) {
  var nome = req.body.nomeServer;
  var email = req.body.emailServer;
  var mensagem = req.body.mensagemServer;

  if (nome == undefined) {
    res.status(400).send("nome está undefined!");
  } else if (email == undefined) {
    res.status(400).send("email está undefined!");
  } else if (mensagem == undefined) {
    res.status(400).send("mensagem está undefined!");
  } else {

    leedModel.cadastrar(nome,email,mensagem)
      .then((resultado) => {
        res.status(201).json(resultado);
      }
      ).catch((erro) => {
        console.log(erro);
        console.log(
          "\nHouve um erro ao realizar o cadastro! Erro: ",
          erro.sqlMessage
        );
        res.status(500).json(erro.sqlMessage);
      });
  }
}

module.exports = {
  cadastrar
}