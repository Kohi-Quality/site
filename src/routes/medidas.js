var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/temperatura_atual", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/umidade_atual", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

module.exports = router;