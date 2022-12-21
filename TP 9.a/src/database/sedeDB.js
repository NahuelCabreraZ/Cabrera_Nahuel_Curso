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

var sedesDb = {};


sedesDb.getAllsedes = function (funCallback) {
    connection.query("SELECT * FROM sedes where estado >=1", function (err, result, fields) {
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

sedesDb.getBynombre = function (nombre,funCallback) {
    connection.query("SELECT * FROM sedes WHERE nombre=?",nombre, function (err, result, fields) {
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
                    message: "No se encontro la sede"
                });
            }
            
        }
    });
}

sedesDb.createSede = function (sedes, funCallback) {
    var query = 'INSERT INTO sedes (nombre,direccion,localidad,cod_postal,telcontacto1,telcontacto2) VALUES (?,?,?,?,?,?)'
    var dbParams = [sedes.nombre, sedes.direccion, sedes.localidad, sedes.cod_postal, sedes.telcontacto1, sedes.telcontacto2];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            if(err.code == 'ER_DUP_ENTRY'){
                funCallback({
                    message: `Ya existe la Sede con el nombre ${sedes.nombre}`,
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
                message: `Se creo la sede ${sedes.nombre}`,
                detail: result
            });
        }
    });
}

/**
 * 
 * @param {*} direccion 
 * @param {*} nombre 
 * @param {*} funCallback 
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
sedesDb.updateSede = function (nombre, direccion, funCallback) {
    var query = 'UPDATE sedes SET nombre = ? , direccion = ?, localidad = ?, cod_postal = ?, telcontacto1 = ?, telcontacto2 = ?'
    var dbParams = [sedes.nombre, sedes.direccion, sedes.localidad, sedes.cod_postal, sedes.telcontacto1, sedes.telcontacto2]
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
                    message: `No se encontro la sede ${nombre}`,
                    detail: result
                });
            } else {
                funCallback({
                    code:1,
                    message: `Se modifico la sede ${sedes.nombre}`,
                    detail: result
                });
            }
        }
    });

}


sedesDb.eliminarSede = function(nombre,funCallback){
    var query = 'DELETE FROM sedes WHERE nombre = ?'
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
                    message: `No se encontro la sede ${nombre}`,
                    detail: result
                });
            } else {
                funCallback(undefined,{
                    message: `Se elimino la sede ${nombre}`,
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
sedesDb.eliminacionlogicaSede = function (idsedes, funCallback) {
    connection.query("UPDATE sedes SET estado = 0 WHERE idsedes = ?",idsedes, function (err, result, fields) {
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
                    message: `No se encontro el id  ${idsedes} de la Sede`,
                    detail: result
                }); 
            } else {
         //       console.error(err);
                    funCallback({
                    code:1,
                    message: `Se modifico la Sede con el id ${idsedes}`,
                    detail: result
                }); 
            }
        }
    });
}

module.exports = sedesDb;