# Calidad del Dato
La calidad del dato confiabiliza el análisis, pues si se usan datos que no cumplan con esto, se puede llegar a conclusiones erróneas.

## Causas de la mala calidad de los datos

Dentro de las causas comunes de este problema se encuentra la carga manual, la carga de datos externos que no han sido cuidadosamente depurados, problemas de carga al interior de los sistemas transaccionales, implementación de nuevos sistemas de en la organización

## Criterios de la calidad del dato

### Actualización

- Al momento de actualizar los datos se debe dejar referenciadas la fecha de la misma. 

### Complejitud

- Los datos deben estar completos. Elemental, pero no suele pasar a menudo. El ejemplo más común de esto se ve en la información de contacto, pues suelen presentarse con frecuencia campos vacios. 

### Fiabilidad

- La fuente de los datos debe ser apropiada, confiable. 
- La trazabilidad es importante, debido a que esta permite conocer toda la historia de que tienen los datos (procedencia, transformaciones).

### Consistencia

Se refiere a la uniformidad de la representación de los datos
- __Interna__: se refiere a los caracteresy de los que se guarda en los campos.

- __Externa__: se refiere a las claves primarias y foráneas y su uso a lo largo del MER para establecer las relaciones entre las tablas.

### Accesibilidad

- Los datos deben ser accesibles con bajo nivel de esfuerzo. 
- Tener buenas prácticas al momento de guardar los archivos o al momento de la creación de las tablas ser consistente con el uso del plural o singular y el uso de las mayúsculas o minúsculas.

### Hechos / Dimensiones
Estas son 2 tipos diferentes de tablas, aunque a simplevista parezcan tablas iguales. La realidad es que en las tablas de _Hecho_ se almacenan las relaciones existentes entre las _Dimencionales_. En estas últimas, se almacena la identidad y caracteristicas de los objetos que componen al modelo. 

__Ejemplo:__

__Tabla Dimencional:__
- Producto.
- Cliente. 
- Empleado.

__Tabla de Hecho:__
- Venta.

## Preparación de los datos
En la preparación de los datos se pueden generar conjuntos de datos mas pequeños que el original. En este sentido es importante la agrupación en «temas» o «familias» de datos.
El objetivo es generar «información de calidad» desestimando la información accesoria o redundante.

* La etapa de preparación de datos llega a insumir el 90% del trabajo de una tarea de análisis de datos.
* Sin la preparación de datos no es posible realizar análisis veraces.

### Metodología para la preparación de los datos
En la etapa de la preparación de datos se procede a la integración, limpieza, transformación, modelado y reportes.

Las técnicas de preparación son obligatorias para la incorporación de nuevos datos a nuestras bases, las mismas son: 
* Integración
* Limpieza del ruido
* Transformación
* Imputación de valores faltantes.
#### Integración de los datos
Todos los datos recopilados se recolectan y agrupan con el fin de establecerlos en un formato tabular. 

#### Limpieza de los datos
Aquí lo que se hace es ceparar los datos que son importantes para el modelo y el negocio de aquellos que no lo son. 

#### Normalización
Se hace la búsqueda de los datos que hacen referencia a la misma cosa pero que tienen notaciones distintas entre si y establecer un estandar para cada caso en el que sea necesaria la normalización. 

#### Imputación de valores faltantes
Se refiere a identificar los valores faltantes presentes en los datos, con el fin de someterlos a un proceso de reconstrucción.

#### Transformación de datos

Se refiere a la serie de transformaciones a la que son sometidos los datos para que puedan ser ingestados dentro de la base de datos. 

#### Modelado de datos

Realización del MER con la información depurada. 

#### Reportes y visualización

Una vez realizado el MER, se pueden realizar las visualizaciónes de las interacciones entre los datos. 


#### Claves subrogadas

Es un identificador único que se asigna a cada registro de una tabla. Se puede obtener a partir de la combinación de varios campos presentes en la tabla.

## Recomendaciones generales
- Lo simple es mejor.
- Evitar los detalles superfluos.
- Crear variables adicionales antes destruir las originales.
- Analizar antes que destruir.
- Verificar varibles derivadas y recodificadas.