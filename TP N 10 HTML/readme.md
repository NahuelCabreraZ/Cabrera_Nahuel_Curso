## TRABAJO PRACTICO NUMERO 10

# PUNTO A:
La tarea de DOCTYPE html es explicar de qué trata Document Type Definition (DTD) y cómo debe renderizarse la web. El DTD indica qué lenguaje de código se utiliza en la página o en el documento HTML. Esto se aplica, por ejemplo, a los archivos HTML, XHTML, SVG, MathML o XML.  
# PUNTO B:
B.1 <head> : El elemento HTML <head> provee información general (metadatos) acerca del documento, incluyendo su título y enlaces a scripts y hojas de estilos.  
B.2 <title> : El elemento <title> HTML define el título del documento que se muestra en un browser la barra de título o la pestaña de una página. Solo contiene texto; las etiquetas dentro del elemento se ignoran.  
B.3 <meta> : Las etiquetas meta o meta tags encabezan un documento HTML y suministran información codificada a navegadores y motores de búsqueda sobre una página web.
B.4 <Style> : La etiqueta de HTML style permite crear hojas de estilo para todo un documento. El objetivo de la tag style es, por un lado, definir con precisión el aspecto de los distintos elementos de una web y, por tanto, hacerlos uniformes.  
B.5 <body> : El elemento <body> de HTML representa el contenido de un documento HTML. Solo puede haber un elemento <body> en un documento.
B.6 <h1,h2,h3,h4,h5,h6> : Titulos del contenido de distintas jerarquías, del 1 al 6.  
B.7 <a> : tag anchor sirve para referenciar a otros documentos o a URLs.  
B.8 <strong> : se utiliza cuando se quiere enmarcar o poner énfasis en una cadena de texto.  
B.9 <br> : Break. Salto de línea.  
B.10 <ul> : unorderer list. Crea una lista desordenada.  
B.11 <li> : list item. Crea una lista de ítems.  
B.12 <p> : párrafos.  
B.13 <span> : Las etiquetas span generalmente envuelven secciones de texto con fines de estilo o para agregar atributos a una sección de texto sin crear una nueva línea de contenido.  
B.14 <table> : representa datos en dos o mas dimensiones. Columnas y/o filas.  
B.15 <tr> : define una fila de celdas en una tabla. Estas pueden ser una mezcla de elementos <td> y <th>.  
B.16 <td> : El elemento td representa a una celda de datos de una tabla ( table ). En HTML , las tablas están formadas por un conjunto de filas donde cada una contiene a un número de celdas. Por lo tanto, este elemento se encuentra habitualmente dentro de un elemento de fila ( tr ).  
B.17 <img> : El elemento img representa a una imagen, lo cual es un recurso externo que puede ser incrustado en el cuerpo de un documento.  
  
# PUNTO C:
Un script puede ir tanto en el head como en el body, pero si el script va en el head, será leído o cargado primero que el resto de los elementos y etiquetas HTML, por ende lo mejor es ponerlo antes del cierre de la etiqueta body, para que la página cargue completamente y luego cargue el script por último, a fin de que primero se le muestre todas las opciones al usuario para que éste luego interactúe. Usarlo en el head hará que primero cargue el script y luego el resto del contenido, por lo cual puede generar tiempos de carga más lentos de funciones en los cuales el usuario no utilizará.  
