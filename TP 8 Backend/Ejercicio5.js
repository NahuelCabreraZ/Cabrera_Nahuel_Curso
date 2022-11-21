const fs = require('fs');
const rawdata = fs.readFileSync('./departamentos.json', "utf8");
var departamentos = JSON.parse(rawdata);

function getDepto(arreglo){

    for(let i = 0; i < arreglo["Tecnologia"].length; i++){
        console.log(arreglo["Tecnologia"][i]["nombre"]+" "+ arreglo["Tecnologia"][i]["puesto"])
        }
    }

getDepto(departamentos);