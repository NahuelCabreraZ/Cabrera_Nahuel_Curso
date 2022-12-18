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

var usuariosDb = {};


usuariosDb.getAlluser = function (funCallback) {
    connection.query("SELECT * FROM personas where estado >=1", function (err, result, fields) {
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

usuariosDb.getBynickname = function (nickname,funCallback) {
    connection.query("SELECT * FROM usuarios WHERE nickname=?",nickname, function (err, result, fields) {
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
                    message: "No se encontro la persona"
                });
            }
            
        }
    });
}

usuariosDb.createUser = function (usuarios, funCallback) {
    var query = 'INSERT INTO usuarios (nickname,email,password) VALUES (?,?,?)'
    var dbParams = [usuarios.nickname, usuarios.email, usuarios.password];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            if(err.code == 'ER_DUP_ENTRY'){
                funCallback({
                    message: `Ya existe la persona con el nombre de usuario ${usuarios.nickname}`,
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
                message: `Se creo el usuario ${usuarios.nickname}`,
                detail: result
            });
        }
    });
}

/**
 * 
 * @param {*} dni 
 * @param {*} persona 
 * @param {*} funCallback 
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
usuariosDb.updateUser = function (nickname, usuarios, funCallback) {
    var query = 'UPDATE usuarios SET nickname = ? , email = ?, password = ?'
    var dbParams = [usuarios.nickname, usuarios.email, usuarios.password]
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
                    message: `No se encontro el usuario ${nickname}`,
                    detail: result
                });
            } else {
                funCallback({
                    code:1,
                    message: `Se modifico el usuario ${usuarios.nickname}`,
                    detail: result
                });
            }
        }
    });

}


usuariosDb.eliminarUser = function(nickname,funCallback){
    var query = 'DELETE FROM usuarios WHERE nickname = ?'
    connection.query(query, dni, function (err, result, fields) {
        if (err) {
            funCallback({
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            if (result.affectedRows == 0) {
                funCallback(undefined,{
                    message: `No se encontro el usuario ${nickname}`,
                    detail: result
                });
            } else {
                funCallback(undefined,{
                    message: `Se elimino el usuario ${nickname}`,
                    detail: result
                });
            }
        }
    });
}

/**
 *  
 * @param {*} idpersona 
 * @param {*} funCallback
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
usuariosDb.eliminacionlogicaUser = function (idusuarios, funCallback) {
    connection.query("UPDATE usuarios SET estado = 0 WHERE idusuarios = ?",idusuarios, function (err, result, fields) {
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
                    message: `No se encontro el id  ${idusuarios} del usuario`,
                    detail: result
                }); 
            } else {
         //       console.error(err);
                    funCallback({
                    code:1,
                    message: `Se modifico el usuario con el id ${idusuarios}`,
                    detail: result
                }); 
            }
        }
    });
}

module.exports = usuariosDb;