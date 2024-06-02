var express = require("express");
var router = express.Router();

var metricasController = require("../controllers/metricasCtrl");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    metricasController.cadastrar(req, res);
})

router.get("/buscar/:fkUsuario", function (req, res) {
    metricasController.pegarDados(req, res);
})

module.exports = router;