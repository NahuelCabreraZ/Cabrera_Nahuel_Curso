let jsonData = require('./personas.json');
console.log(JSON.stringify(jsonData));
// Arroja los datos del json, todos juntos como un array de strings.
console.log(JSON.parse(jsonData));
//tira un error donde no encuentra el jsonData