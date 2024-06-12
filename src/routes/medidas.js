var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/buscarUltimasMedidas_Alfa", function (req, res) {
    medidaController.buscarUltimasMedidas_Alfa(req, res);
});

//router.get("/umidade_atual", function (req, res) {
//    medidaController.buscarMedidasEmTempoReal(req, res);
//})

module.exports = router;