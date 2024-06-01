var express = require("express");
var router = express.Router();

var metricasController = require("../controllers/metricasController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrarMetrica", function (req, res) {
    metricasController.cadastrar(req, res);
})

router.get("/buscarMetrica", function (req, res) {
    metricasController.pegarDados(req, res);
})

module.exports = router;