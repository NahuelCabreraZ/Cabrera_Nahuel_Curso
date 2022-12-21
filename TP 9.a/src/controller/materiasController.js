require("rootpath")();
const express = require('express');
const app = express();

const materiasDb = require("../datasource/materiasDB.js");


app.get('/', getAllMaterias);

app.get('/:nombre', getBynombre);

app.post('/', createMaterias);

app.put('/:nombre', updateMaterias);

app.delete('/del/:nombre', eliminarMaterias);

app.delete('/:nombre', eliminacionlogicaMaterias);

// Metododo para listar todas las personas 
function getAllMaterias(req, res) {
    materiasDb.getAllMaterias(function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para buscar personas por su Nombre de Usuario
function getBynombre(req, res) {
    materiasDb.getBynombre(req.params.nombre,function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para agregar Usuarios
function createMaterias(req, res) {
    materiasDb.createMaterias(req.body, function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para modificar Materias
function updateMaterias(req, res) {
    materiasDb.updateMaterias(req.params.nombre, req.body, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
            res.status(404).json(result);
        } else {
            res.json(result);
        }
    });
}
// Metodo par eliminar fisicmente la materia de la base de datos
function eliminarMaterias(req, res) {
    materiasDb.eliminarMaterias(req.params.nombre,  function (err, result) {
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
// Metodo par eliminar materias cambiando el estado a 0
function eliminacionlogicaMaterias(req, res) {
    materiasDb.eliminacionlogicaMaterias(req.params.idmaterias, function (result) {
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