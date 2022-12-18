require("rootpath")();
const express = require('express');
const app = express();

const personaDb = require("../datasource/personaDB.js");


app.get('/', getAll);

app.get('/:dni', getByDni);

app.post('/', createPersona);

app.put('/:dni', updatePersona);

app.delete('/del/:dni', eliminarPersona);

app.delete('/:idpersona', eliminacionlogicaPersona);

// Metododo para listar todas las personas 
function getAll(req, res) {
    personaDb.getAll(function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para buscar personas por su dni
function getByDni(req, res) {
    personaDb.getByDni(req.params.dni,function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para agregar personaas
function createPersona(req, res) {
    personaDb.createPersona(req.body, function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para modificar personaas
function updatePersona(req, res) {
    personaDb.updatePersona(req.params.dni, req.body, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
            res.status(404).json(result);
        } else {
            res.json(result);
        }
    });
}
// Metodo par eliminar fisicmente personas de la base de datos
function eliminarPersona(req, res) {
    personaDb.eliminarPersona(req.params.dni,  function (err, result) {
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
function eliminacionlogicaPersona(req, res) {
    personaDb.eliminacionlogicaPersona(req.params.idpersona, function (result) {
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