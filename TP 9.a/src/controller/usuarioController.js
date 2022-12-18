require("rootpath")();
const express = require('express');
const app = express();

const userDb = require("../datasource/usuariosdb.js");


app.get('/', getAlluser);

app.get('/:nickname', getBynickname);

app.post('/', createUser);

app.put('/:nickname', updateUser);

app.delete('/del/:nickname', eliminarUser);

app.delete('/:nickname', eliminacionlogicaUser);

// Metododo para listar todas las personas 
function getAlluser(req, res) {
    userDb.getAlluser(function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para buscar personas por su Nombre de Usuario
function getBynickname(req, res) {
    userDb.getBynickname(req.params.nickname,function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para agregar Usuarios
function createUser(req, res) {
    userDb.createUser(req.body, function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para modificar Usuarios
function updateUser(req, res) {
    userDb.updateUser(req.params.nickname, req.body, function (result) {
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
function eliminarUser(req, res) {
    userDb.eliminarUser(req.params.nickname,  function (err, result) {
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
function eliminacionlogicaUser(req, res) {
    userDb.logdelete(req.params.idusuario, function (result) {
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