var metricasModel = require("../models/metricasM");

function cadastrar(req, res) {
    var fkUsuario = req.body.fkUsuarioServer;
    var fkQuiz = req.body.fkQuizServer;
    var qntdAcertos = req.body.qntdAcertosServer;
    var qntdErros = req.body.qntdErrosServer;

    // Faça as validações dos valores
    if (fkUsuario == undefined) {
        res.status(400).send("Sua fkUsuario está undefined!");
    } else if (fkQuiz == undefined) {
        res.status(400).send("Sua fkQuiz está undefined!");
    } else if (qntdAcertos == undefined) {
        res.status(400).send("Seu acertos está undefined!");
    } else if (qntdErros == undefined) {
        res.status(400).send("Seu erros está undefined!");
    } else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        metricasModel.cadastrar(fkUsuario, fkQuiz, qntdAcertos, qntdErros)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o armazenamento das metricas! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function pegarDados(req, res) {
    var fkUsuario = req.params.fkUsuario;

    if (fkUsuario == undefined) {
        res.status(400).send("Sua fkUsuario está undefined!");
    } else {

        metricasModel.receber(fkUsuario)
            .then(resultado => {
                res.json(resultado[0])
            }).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o armazenamento das metricas! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    cadastrar,
    pegarDados
}