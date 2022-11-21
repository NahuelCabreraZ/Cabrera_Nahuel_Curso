'use strict';
const fs = require('fs');
fs.readFile('personas.json', (err, data) => {
if (err) throw err;
console.log(JSON.stringify(data));
// En este caso, en el stringify hay un error de referencia en el parametro data 
console.log(data);
//aca tira los datos puros del buffer sin conversion
});