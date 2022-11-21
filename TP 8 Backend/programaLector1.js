const fs = require('fs');
let rawdata = fs.readFileSync('./personas.json');
console.log(JSON.stringify(rawdata));
//Cuando se usa stringify convierte un objeto o valor de JavaScript en una cadena JSON, reemplazando opcionalmente valores si se especifica una función de reemplazo

//El método JSON.parse() analiza una cadena de texto (string) como JSON, transformando opcionalmente el valor producido por el análisis.
