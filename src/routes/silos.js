var express = require("express");
var router = express.Router();

var siloController = require("../controllers/siloController");

router.get("/:empresaId", function (req, res) {
  siloController.buscarSilosPorEmpresa(req, res);
});

router.post("/cadastrar", function (req, res) {
  siloController.cadastrar(req, res);
})

module.exports = router;