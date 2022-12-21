require("rootpath")();
const express = require('express');
const app = express();

const sedeDb = require("../datasource/sedeDB.js");


app.get('/', getAllsedes);

app.get('/:nombre', getBynombre);

app.post('/', createSede);

app.put('/:nombre', updateSede);

app.delete('/del/:nombre', eliminarSede);

app.delete('/:nombre', eliminacionlogicaSede);

// Metododo para listar todas las sedes
function getAllsedes(req, res) {
    sedeDb.getAllsedes(function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para buscar sedes por su Nombre
function getBynombre(req, res) {
    sedeDb.getBynombre(req.params.nombre,function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para agregar sedes
function createSede(req, res) {
    sedeDb.createSede(req.body, function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para modificar Sedes
function updateSede(req, res) {
    sedeDb.updateSede(req.params.nombre, req.body, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
            res.status(404).json(result);
        } else {
            res.json(result);
        }
    });
}
// Metodo par eliminar fisicmente la sede de la base de datos
function eliminarSede(req, res) {
    sedeDb.eliminarSede(req.params.nombre,  function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            if (result.detail.affectedRows == 0) {
                res.status(404).json(result);
            } else {
                res.json(result);
            }
        }
    });
}
// Metodo par eliminar sedes cambiando el estado a 0
function eliminacionlogicaSede(req, res) {
    sedeDb.eliminacionlogicaSede(req.params.idsedes, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
                res.status(404).json(result);  
        } else if (result.code == 1) {      
            res.json(result);
        }
    });
}

module.exports = app;