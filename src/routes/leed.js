var express = require("express");
var router = express.Router();

var leedController = require("../controllers/leedController");

router.post("/cadastrar", function (req, res) {
  leedController.cadastrar(req, res);
})

module.exports = router;