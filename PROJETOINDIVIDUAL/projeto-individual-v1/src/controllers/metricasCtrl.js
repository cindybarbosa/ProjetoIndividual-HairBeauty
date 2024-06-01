var metricasModel = require("../models/metricasModel");

function cadastrar(req, res) {
    var idMetricas = req.body.idMetricasServer;
    var qntdAcertos = req.body.qntdAcertosServer;
    var qntdErros = req.body.qntdErrosServer;

    // Faça as validações dos valores
    if (idMetricas == undefined) {
        res.status(400).send("Seu id está undefined!");
    } else if (qntdAcertos== undefined) {
        res.status(400).send("Seu acertos está undefined!");
    } else if (qntdErros == undefined) {
        res.status(400).send("Seu erros está undefined!");
    } else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        metricasModel.cadastrar(idMetricas, qntdAcertos, qntdErros)
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
    metricasModel.receber().then(resultado => {
        res.json(resultado)
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

module.exports = {
    cadastrar,
    pegarDados
}