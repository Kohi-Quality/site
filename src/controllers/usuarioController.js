var usuarioModel = require("../models/usuarioModel");
// var aquarioModel = require("../models/aquarioModel");

function autenticar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {

        usuarioModel.autenticar(email, senha)
            .then(
                function (resultadoAutenticar) {
                    console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String

                    if (resultadoAutenticar.length == 1) {
                        console.log(resultadoAutenticar);

                        // aquarioModel.buscarAquariosPorEmpresa(resultadoAutenticar[0].empresaId)

                        // aquarioModel.buscarAquariosPorEmpresa(resultadoAutenticar[0].empresaId)
                        // .then((resultadoAquarios) => {
                        // if (resultadoAquarios.length > 0) {
                        res.json({
                            idUsuario: resultadoAutenticar[0].idUsuario,
                            email: resultadoAutenticar[0].email,
                            nomeCompleto: resultadoAutenticar[0].nomeCompleto,
                            senha: resultadoAutenticar[0].senha,
                            // aquarios: resultadoAquarios
                        });
                    }
                    // } else {
                    // res.status(204).json({ aquarios: [] });
                    // }
                    // })
                    // } else if (resultadoAutenticar.length == 0) {
                    // res.status(403).send("Email e/ou senha inválido(s)");
                    // } else {
                    // res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    // }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}

function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nomeCompleto = req.body.nomeCompletoServer
    var cpf = req.body.cpfServer
    var logradouro = req.body.logradouroServer
    var numeroTelefone = req.body.numeroTelefoneServer
    var email = req.body.emailServer
    var senha = req.body.senhaServer
    var logradouro = req.body.logradouroServer
    var numero = req.body.numeroServer
    var complemento = req.body.complementoServer
    var bairro = req.body.bairroServer
    var estado = req.body.estadoServer

    if (nomeCompleto == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está undefined!");
    } else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrar(nomeCompleto,cpf,logradouro,numeroTelefone,email,senha,logradouro,numero,complemento,bairro,estado)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    autenticar,
    cadastrar
}