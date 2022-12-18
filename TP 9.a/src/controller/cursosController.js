require("rootpath")();
const express = require('express');
const app = express();

const userDb = require("../datasource/cursosDB.js");


app.get('/', getAllcursos);

app.get('/:nombre', getBynombre);

app.post('/', createCurso);

app.put('/:nombre', updateCurso);

app.delete('/del/:nombre', eliminarCurso);

app.delete('/:nombre', eliminacionLogicaCurso);

// Metododo para listar todas las personas 
function getAllcursos(req, res) {
    userDb.getAllcursos(function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para buscar cusos por su Nombre
function getBynombre(req, res) {
    userDb.getBynombre(req.params.nombre,function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para agregar Cursos
function createCurso(req, res) {
    userDb.createCurso(req.body, function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para modificar Cursos
function updateCurso(req, res) {
    userDb.updateCurso(req.params.nombre, req.body, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
            res.status(404).json(result);
        } else {
            res.json(result);
        }
    });
}
// Metodo par eliminar fisicmente cursos de la base de datos
function eliminarCurso(req, res) {
    userDb.eliminarCurso(req.params.nombre,  function (err, result) {
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
// Metodo par eliminar personas cambiando el estado a 0
function eliminacionLogicaCurso(req, res) {
    userDb.eliminacionLogicaCurso(req.params.idcursos, function (result) {
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