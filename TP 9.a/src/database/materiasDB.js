const mysql = require('mysql');
const config = require("../config/config.json");

//conectarnos a nuestra DB
var connection = mysql.createConnection(config.database);

connection.connect((err) => {
    if (err) {
        console.log(err);
    } else {
        console.log("DB Conectada correctamente");
    }
});
//fin de conexion db

var materiasDb = {};


materiasDb.getAllMaterias = function (funCallback) {
    connection.query("SELECT * FROM materias where estado >=1", function (err, result, fields) {
        if (err) {
            funCallback({
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            funCallback(undefined, result);
        }
    });
}

materiasDb.getBynombre = function (nombre,funCallback) {
    connection.query("SELECT * FROM materias WHERE nombre=?",nombre, function (err, result, fields) {
        if (err) {
            funCallback({
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            if(result.length>0){
                funCallback(undefined, result[0]);
            }else{
                funCallback({
                    message: "No se encontro la materia"
                });
            }
            
        }
    });
}

materiasDb.createMaterias = function (materias, funCallback) {
    var query = 'INSERT INTO materias (nombre,objetivo,plan_estudio) VALUES (?,?,?)'
    var dbParams = [materias.nombre, materias.objetivo, materias.plan_estudio];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            if(err.code == 'ER_DUP_ENTRY'){
                funCallback({
                    message: `Ya existe la materia con el nombre ${materias.nombre}`,
                    detail: err
                });
            }else{
                funCallback({
                    message: "Surgio un problema, contactese con un administrador. Gracias",
                    detail: err
                });
            }
            
            console.error(err);
        } else {
            funCallback(undefined, {
                message: `Se creo la materia ${materias.nombre}`,
                detail: result
            });
        }
    });
}

/**
 * 
 * @param {*} plan_estudio 
 * @param {*} nombre 
 * @param {*} funCallback 
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
materiasDb.updateMaterias = function (nombre, objetivo, funCallback) {
    var query = 'UPDATE materias SET nombre = ? , objetivo = ?, plan_estudio = ?'
    var dbParams = [materias.nombre, materias.objetivo, materias.plan_estudio]
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            funCallback({
                code:3,
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            if (result.affectedRows == 0) {
                funCallback({
                    code:2,
                    message: `No se encontro el usuario ${nombre}`,
                    detail: result
                });
            } else {
                funCallback({
                    code:1,
                    message: `Se modifico el usuario ${materias.nombre}`,
                    detail: result
                });
            }
        }
    });

}


materiasDb.eliminarMaterias = function(nombre,funCallback){
    var query = 'DELETE FROM materias WHERE nombre = ?'
    connection.query(query, nombre, function (err, result, fields) {
        if (err) {
            funCallback({
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            if (result.affectedRows == 0) {
                funCallback(undefined,{
                    message: `No se encontro la materia ${nombre}`,
                    detail: result
                });
            } else {
                funCallback(undefined,{
                    message: `Se elimino la materia ${nombre}`,
                    detail: result
                });
            }
        }
    });
}

/**
 *  
 * @param {*} nombre 
 * @param {*} funCallback
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
materiasDb.eliminacionlogicaMaterias = function (idmaterias, funCallback) {
    connection.query("UPDATE usuarios SET estado = 0 WHERE idmaterias = ?",idmaterias, function (err, result, fields) {
        if (err) {
            funCallback({
                code:3,
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            }); 
            console.error(err);
        } else {
            if (result.affectedRows == 0) {
                funCallback({
                    code:2,
                    message: `No se encontro el id  ${idmaterias} de la materia`,
                    detail: result
                }); 
            } else {
         //       console.error(err);
                    funCallback({
                    code:1,
                    message: `Se modifico la materia con el id ${idmaterias}`,
                    detail: result
                }); 
            }
        }
    });
}

module.exports = materiasDb;