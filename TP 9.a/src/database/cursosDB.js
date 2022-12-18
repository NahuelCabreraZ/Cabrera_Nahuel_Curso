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

var cursosDB = {};


cursosDB.getAllcursos = function (funCallback) {
    connection.query("SELECT * FROM cursos where estado >=1", function (err, result, fields) {
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

cursosDB.getBynombre = function (nombre,funCallback) {
    connection.query("SELECT * FROM cursos WHERE nombre=?",nombre, function (err, result, fields) {
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
                    message: "No se encontro el curso"
                });
            }
            
        }
    });
}

cursosDB.createCurso = function (cursos, funCallback) {
    var query = 'INSERT INTO cursos (nombre,descripcion) VALUES (?,?)'
    var dbParams = [cursos.nombre, cursos.descripcion];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            if(err.code == 'ER_DUP_ENTRY'){
                funCallback({
                    message: `Ya existe el curso ${cursos.nombre}`,
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
                message: `Se creo el curso ${cursos.nombre}`,
                detail: result
            });
        }
    });
}

/**
 * 
 * @param {*} nombre 
 * @param {*} descripcion 
 * @param {*} funCallback 
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
cursosDB.updateCurso = function (nombre, descripcion, funCallback) {
    var query = 'UPDATE cursos SET nombre = ? , descripcion = ?'
    var dbParams = [cursos.nombre, cursos.descripcion];
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
                    message: `No se encontro el curso ${nombre}`,
                    detail: result
                });
            } else {
                funCallback({
                    code:1,
                    message: `Se modifico el curso ${cursos.nombre}`,
                    detail: result
                });
            }
        }
    });

}


cursosDB.eliminarCurso = function(nombre,funCallback){
    var query = 'DELETE FROM cursos WHERE nombre = ?'
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
                    message: `No se encontro el curso ${cursos.nombre}`,
                    detail: result
                });
            } else {
                funCallback(undefined,{
                    message: `Se elimino el curso ${cursos.nombre}`,
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
cursosDB.eliminacionlogicaUser = function (idcursos, funCallback) {
    connection.query("UPDATE cursos SET estado = 0 WHERE idcursos = ?",idcursos, function (err, result, fields) {
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
                    message: `No se encontro el nombre  ${idcursos} del curso`,
                    detail: result
                }); 
            } else {
         //       console.error(err);
                    funCallback({
                    code:1,
                    message: `Se modifico curso con el id ${idcursos}`,
                    detail: result
                }); 
            }
        }
    });
}

module.exports = cursosDB;