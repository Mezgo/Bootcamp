![HenryLogo](https://d31uz8lwfmyn8g.cloudfront.net/Assets/logo-henry-white-lg.png)

## Redes Neuronales

El modelo de neuronas artificiales inspirado en el comportamiento biológico de las neuronas y en cómo se organizan formando la estructura del cerebro, publicado por McCulloch y Pitts en 1943, se considera el primer trabajo en el campo de la Inteligencia Artificial.

En una neurona, podemos reconocer diferentes partes:
* El cuerpo central, llamado soma, que contiene el núcleo celular.
* Una prolongación del soma, el axón. 
* Una ramificación terminal, dendritas.
* Una zona de conexión entre una neurona y otra, conocida como sinapsis.

<img src="../_src/assets/redes_neuronales1.jpg" height="400"><br>

Trece años más tarde, en 1956, se acuñaría el propio término “Inteligencia Artificial” por John McCarthy, Marvin Minsky y Claude Shannon en una conferencia en Darthmounth.
En 1958 Frank Rosenblatt diseña la primera red neuronal artificial, el Perceptrón.

Modelo neuronal con n entradas, que consta de
* Un conjunto de entradas x1,…xn
* Los pesos sinápticos w1,…wn, correspondientes a cada entrada
* Una función de agregación, Σ
* Una función de activación, f
* Una salida:<br>
<img src="../_src/assets/redes_neuronales2.jpg" height="100"><br>
<img src="../_src/assets/redes_neuronales3.jpg" height="400"><br>

Si por ejemplo, se quisiera determinar si va a llover o no, y sabemos que esto depende esencialmente de la diferencia de temperatura entre el aire cercano a la superficie y el aire en la altura, que debe ser más frío; y por otra parte, también depende de la humedad, con lo que, si se dan ambas variables llueve. 

Las dos variables son:
x₁ : Diferencia de temperatura.
x₂ : Humedad

Teniendo en cuenta que cada una es binaria, es decir si hay la diferencia de temperatura necesaria o no, y si hay la suficiente humedad, entonces se puede armar la tabla:

<img src="../_src/assets/redes_neuronales4.jpg" height="200"><br>

Convirtiendo los “Sí” y “No” en “1” y “0” respectivamente nos queda el siguiente esquema:<br>

<img src="../_src/assets/redes_neuronales5.jpg" height="200"><br>

Se pueden ver las 2 entradas, más un valor de sesgo ó “bias”, con su entrada que siempre vale 1.  
Por otra parte, también están los pesos sinápticos, es decir, los ponderadores (w1, w2 y w3).

El siguiente paso, es encontrar los valores de w1, w2 y w3 que separen correctamente las clases:

<img src="../_src/assets/redes_neuronales6.jpg" height="200"><br>

La recta <b>x₂ = -4/5 x₁ + 6/5</b> logra separar correctamente las clases. Notar que cuando x₁ y x₂ tienen el valor 1, la sumatoria es 3, es decir, mayor a 0, ante cualquier otra combinación de valores de x₁ y x₂ el resultado es menor a 0.
Entonces, una neurona artificial, en su núcleo, es un problema de <b>Regresión Lineal</b>.

Por analogía, podemos ver que esta gráfica, corresponde a la tabla de verdad de las compuertas lógicas <b>AND</b><br>
<img src="../_src/assets/redes_neuronales7.jpg" height="200"><br>
Así mismo, se podría presentar un problema, cuya solución corresponda con la compuerta lógica <b>OR</b><br>
<img src="../_src/assets/redes_neuronales8.jpg" height="200"><br>
Pero que pasa con la compuerta lógica <b>XOR</b>, mediante la gráfica, se puede ver que no es posible separar las clases con una sola recta.<br>
<img src="../_src/assets/redes_neuronales9.jpg" height="200"><br>
Este problema existe desde que se formuló la neurona artificial, y dio origen a las redes neuronales, ya que, con dos neuronas, sí es posible resolverlo:<br>
<img src="../_src/assets/redes_neuronales10.jpg" height="300"><br>

* Agregar capas a la red, permite obtener <b>conocimiento jerarquizado</b>.
* Siguiendo el ejemplo, de si va a llover o no, podemos querer predecir información más compleja, como por ejemplo si podremos aprender más sobre Machine Learning, agregando dos entradas más:
  * Voy a leer el material sobre el tema que tengo disponible.
  * Me voy a quedar mirando tele.<br>

<img src="../_src/assets/redes_neuronales11.jpg" height="300"><br>

* Notar que ahora, es una red de 3 neuronas, con 13 w

A través del algebra matricial, este proceso se puede representar como el <b>producto escalar</b>:<br>

<img src="../_src/assets/redes_neuronales12.jpg" height="300"><br>

Sin embargo, lo que implementa la función de agregación, es una función lineal. Lo que hace que una neurona artificial no sea sólo una función lineal es la <b>función de activación</b>, que consiste en, dado un valor umbral, arrojar una salida 0 ó 1:

Para nuestro ejemplo, la función de activación puede definirse:

<img src="../_src/assets/redes_neuronales13.jpg" height="100"><br>
<img src="../_src/assets/redes_neuronales14.jpg" height="300"><br>

## Deep Learning

Las neuronas se agrupan en capas, la primera capa (de entrada) tiene tantas neuronas como variables de entrada tiene el planteo del problema, mientras que la ultima capa tantas neuronas como salidas haya, si es binaria, puede ser sólo una neurona. Las capas que están entre la capa de entrada y la de salida, se llaman capas ocultas.
Cada neurona tiene sus propios pesos/parámetros. En aplicaciones comunes suelen ser desde miles a millones de parámetros para toda la red.
Esa obtención de conocimiento jerarquizado, es lo que da nombre al <b>Aprendizaje Profundo ó Deep Learning</b>, y requiere de encontrar esos pesos W de manera eficiente, bajo la condición de realizar correctamente una tarea objetivo.<br>
<img src="../_src/assets/redes_neuronales15.jpg" height="400"><br>

### Aprendizaje de Redes Neuronales

Es un problema de Regresión Lineal, por ese motivo buscamos entonces Y = mX + b que mejor ajuste a los datos
* m: pendiente
* b: ordenada al origen

1) Es necesario definir cuál es el mejor ajuste a los datos.
2) Se puede probar con distintos valores de m y b, y quedarse con el que mejor ajusta.<br>
<img src="../_src/assets/redes_neuronales16.jpg" height="300"><br>
<img src="../_src/assets/redes_neuronales17.jpg" height="300"><br>

Con un modelo paramétrico (y = mx + b, m y b parámetros), se puede hacer una búsqueda por fuerza bruta para encontrar el m y b.
Y guiar la búsqueda con una función de costo.
Muy similar a GridSearch, pero en este caso es para buscar los parámetros del modelo, no sus hiperparámetros. Ejemplo de hiperparámetro: grado del polinomio. 
Esta clase de problemas se conocen como problemas de <b>optimización</b>:<br>
<img src="../_src/assets/redes_neuronales18.jpg" height="300"><br>

## Descenso por Gradiente

Computacionalmente, es muy costosa la búsqueda de esos parámetros ya que crece con las dimensiones. Entonces, ¿cuáles son las opciones?

Formas analíticas (fórmulas matemáticas) que calculen exactamente el mínimo de la función de costo y a qué parámetros corresponde ese mínimo. Pocos casos pueden resolverse así.
Ejemplo: cuadrados mínimos para la regresión lineal.<br>
<img src="../_src/assets/redes_neuronales19.jpg" height="100"><br>

Mezclar los dos mundos, es decir, combinar la búsqueda en un espacio de parámetros con una guía que nos diga dónde buscar.
<b>Descenso por Gradiente</b> consiste en buscar un mínimo global mediante iteraciones en las cuales se va descendiendo en la función de costo J( θ0, θ1):<br>
<img src="../_src/assets/redes_neuronales20.jpg" height="300"><br>

Se quiere explorar el mínimo de la función de costo, pero sin hacerlo de forma exhaustiva

Pasos
1) Calculamos el costo para ciertos valores al azar de los parámetros.
2) Repetimos este paso hasta converger al mínimo
  1) Nos fijamos la dirección de decrecimiento en ese punto. Técnicamente, <b>derivamos o calculamos el gradiente</b>.
  2) Nos movemos según el <b>ratio de aprendizaje</b> (es el tamaño de la flecha)
  3) <b>Actualizamos los valores de los parámetros</b>.
<img src="../_src/assets/redes_neuronales21.jpg" height="300"><br>

* <b>Es necesario definir una función de costo/pérdida</b>. La función de costo depende del problema (clasificación, regresión, etc).
* La función de costo es una <b>función de los parámetros de la red</b>.
* Los mejores parámetros de la red son aquellos que <b>minimicen la función de costo</b>.
* Como explorar todo ese espacio de parámetros exhaustivamente (similar a Grid Search) es imposible, se utiliza una técnica que lo haga eficientemente. Esa técnica es Descenso por Gradiente.
* <b>Reescalar garantiza la convergencia del algoritmo de Descenso por Gradiente</b> en el entrenamiento.

Enlaces recomendados:
* [Regresión Lineal y Mínimos cuadrados ordinarios] (https://www.youtube.com/watch?v=w2RJ1D6kz-o)
* [¿Qué es el descenso por Gradiente?] (https://www.youtube.com/watch?v=A6FiCDoz8_4)
* [¿Qué es el descenso por Gradiente (2)?] (https://www.youtube.com/watch?v=-_A_AAxqzCg)
* http://www.benfrederickson.com/numerical-optimization/
* https://www.desmos.com/calculator/l0puzw0zvm

## Fordward Propagation

* Cada valor w, afecta a la siguiente capa, y por ende, a todo el resto de la red neuronal, por tal motivo tiene parte de la responsabilidad en la función de Costo final.
* Esa función de Costo o de pérdida, determina cuán lejos está el resultado de la red contra el resultado esperado.
* El Descenso por gradiente calcula la derivada/gradiente del costo y con eso actualiza los parámetros. Este proceso lo va a hacer muchas veces hasta llegar al mínimo.
* En cada una de esas iteraciones, tiene que calcular el costo. <b>El costo depende de las instancias de entrenamiento y de los parámetros que tengamos hasta ese momento</b>.
* Calcular el costo con las instancias de entrenamiento es lo que se conoce como <b>Forward propagation</b>.</b>.
<img src="../_src/assets/redes_neuronales22.jpg" height="300"><br>

## Back Propagation

Con el costo calculado, se actualizan los valores de los parámetros ponderadores de las entradas, los w, que se inicializan con valores aleatorios.
	1) Se deriva el costo con respecto a la función de activación ó predicción.
	2) Se deriva la predicción con respecto a la función de agregación.
	3) Se deriva la función de agregación, con respecto a los parámetros w.
	4) Se actualizan los parámetros.

* Para derivar la composición de funciones J(Y(f(X))) se utiliza la denominada <b>regla de la cadena</b>.
* Así, se propaga esa derivada hacia atrás, hasta llegar a los parámetros w iniciales, pasando capa tras capa por toda la red.</b>.<br>
<img src="../_src/assets/redes_neuronales23.jpg" height="300"><br>

* Entonces, con los datos de entrenamiento, la red ajusta sus parámetros, para adaptarse a la salida esperada.
* Se llama <b>epoch ó ciclo</b>, al proceso completo desde un input de entrada, hasta la consecución de la función de coste, y posterior aplicación del algoritmo de Backpropagation de todos los ejemplos de entrenamiento.
* El <b>tamaño de lote ó batch size</b> es el número de ejemplos de entrenamiento en un ciclo. Cuanto mayor sea el tamaño del lote, más espacio de memoria se necesitará.<br>
<img src="../_src/assets/redes_neuronales24.jpg" height="500"><br>

Enlace recomendado:
* [Un lego a la vez] (https://medium.com/latinxinai/un-lego-a-la-vez-explicando-la-matem%C3%A1tica-de-como-las-redes-neuronales-aprenden-ae582ab91da6)
* [Backpropagation] (https://www.youtube.com/watch?v=eNIqz_noix8)
* [Las Matemáticas de Backpropagation] (https://www.youtube.com/watch?v=M5QHwkkHgAA)
* [Aprendizaje profundo] (https://www.youtube.com/watch?v=aircAruvnKk)
* [Descenso de Gradiente] (https://www.youtube.com/watch?v=IHZwWFHWa-w)
* [Playground Tensorflow] (https://playground.tensorflow.org)

## Función de Costo – Entropía Cruzada

* Define una función de pérdida entre una etiqueta (y) y la probabilidad de pertenecer o no a esa etiqueta.
* Pérdida para una instancia, caso binario: etiquetas y = 0 y 1.<br>
<img src="../_src/assets/redes_neuronales25.jpg" height="200"><br>
* Pérdida para una instancia<br>
<img src="../_src/assets/redes_neuronales26.jpg" height="50"><br>
* Costo para todas las instancias<br>
<img src="../_src/assets/redes_neuronales27.jpg" height="50"><br>
* Costo para todas las instancias, caso 1D<br>
<img src="../_src/assets/redes_neuronales28.jpg" height="50"><br>

## Funciones de Activación

* Sigmoide / Logística:<br>
<img src="../_src/assets/redes_neuronales29.jpg" height="200"><br>
* Identidad: f(x) = x<br>
<img src="../_src/assets/redes_neuronales30.jpg" height="200"><br>
* Escalón: f(x) = 0 si x; 1 si x>=0<br>
<img src="../_src/assets/redes_neuronales31.jpg" height="200"><br>
* Tangente Hiperbólica: f(x)=tanh(x)<0<br>
<img src="../_src/assets/redes_neuronales32.jpg" height="200"><br>
* ReLU (Rectified Linear Units):   f(x) = 0 si x<0; x si x>=0
  * En problemas de clasificación, lo más común es encontrar ReLU en las capas interiores y Sigmoide en la salida.<br>
<img src="../_src/assets/redes_neuronales33.jpg" height="250"><br>

## Perceptrón

* Esta unidad neural, cuyo modelo se diseñó en 1958, se denominó Perceptrón.
* No era sólo una función lineal, debido a que contaba con una función de activación.
* La función de activación, devuelve probabilidades, que están entre 0 y 1.<br>

<img src="../_src/assets/perceptron_multicapa1.jpg" height="200"><br>

## Perceptrón Multicapa

* La limitación con el perceptrón, es que sólo encuentra fronteras lineales, y como hemos visto, ampliar la red resuelve ese problema.
* Multiclase: La cantidad de neuronas en la capa de salida tiene que ser igual a la cantidad de clases buscadas.<br>

<img src="../_src/assets/perceptron_multicapa2.jpg" height="200"><br>

## Regularización

El problema fundamental de es la tensión existente entre optimización y generalización, donde <b>la optimización se considera respecto al proceso de ajustar un modelo para conseguir el mejor rendimiento posible sobre los datos de entrenamiento</b> (es donde se concentra la parte de aprendizaje en el Aprendizaje Automático), y <b>la generalización es respecto a lo bien que el modelo entrenado se comporta sobre datos que no ha visto anteriormente</b>. 
El objetivo es conseguir una buena generalización, pero es precisamente la parte que no podemos controlar, ya que solo podemos ajustar el modelo en función los datos de entrenamiento. Lo ideal sería poder conseguir una mayor, y lo más variada posible, cantidad de datos de entrenamiento, así, como cualquier proceso de aprendizaje, automático o natural: un modelo entrenado con más datos tendrá más herramientas para extrapolar su aprendizaje a situaciones nuevas.
Como no siempre se pueden conseguir más datos, lo que hacemos es limitar la capacidad de aprendizaje del modelo, para prevenir el sobreajuste.
El conjunto de técnicas utilizadas para tal fin, se conoce como Regularización.

### Data Augmentation

Cuando trabajamos con imágenes, hay algunas formas de incrementar el tamaño del conjunto de entrenamiento por medio de operaciones básicas: traslación, rotación, escalado, volteado, etc.<br>

<img src="../_src/assets/regularizacion.jpg" height="200"><br>

### Parada temprana (early stopping)

Estrategia basada en validación cruzada, cuando observamos que el rendimiento en validación comienza a empeorar, paramos el entrenamiento del modelo.

### L1 (Lasso)

Coste es proporcional al valor absoluto de los pesos (matemáticamente, la norma L1 de los pesos). Suele dar como resultado que muchos pesos tomen el valor 0, por lo que a veces se identifica con un procedimiento de compresión de la red neuronal.

### L2 (Ridge)

Coste es proporcional al cuadrado de los valores de los pesos (matemáticamente, la norma L2 de los pesos). En el contexto de las redes neuronales, a esta norma también se le llama weight decay, ya que fuerza a que los pesos tiendan a 0.

### Dropout

Funciona como una capa que “apaga” neuronas de la capa anterior al azar. Al hacerlo, obliga a que ninguna se aprenda “de memoria” una muestra, sino que tengan que aprender entre todas.<br>

<img src="../_src/assets/regularizacion2.jpg" height="200"><br>

## Redes Neuronales - Librerías

Con Python es posible programar desde cero y diseñar por completo una arquitectura de red neuronal. Sin embargo, también es posible implementar librerías que ya traen resuelto gran parte del código ocultando diferentes niveles de detalle dicha arquitectura.<br>

<img src="../_src/assets/redes_neuronales34.jpg" height="200"><br>

## Redes Neuronales Recurrentes

Las Redes Neuronales Recurrentes ó RNN, además de tener conexiones con la capa anterior, las tienen con la misma capa. Con lo que combina la memoria de cada neurona con el input de la capa anterior al retroalimentarse. <br>

<img src="../_src/assets/redes_recurrentes1.jpg" height="200"><br>

* Procesa Secuencias de datos.
* Cada elemento está correlacionado con el siguiente.
* El tamaño de los datos de entrada es variable. <br>

<img src="../_src/assets/redes_recurrentes2.jpg" height="200"><br>

Hay numerosas variantes de asombrosa complejidad: <b>LSTM</b> se utilizan para reconocimiento de voz, texto manuscrito y patrones.

* Agrega celda de estado.
* Compuertas “forget” y “update”
* Compuerta de salida<br>

<img src="../_src/assets/redes_recurrentes3.jpg" height="200"><br>

Enlaces sugeridos:
* https://experiments.withgoogle.com/ai/ai-duet/view/
* [Redes Transformers] (https://www.youtube.com/watch?v=Wp8NocXW_C4&feature=youtu.be)

## Redes Neuronales Convolucionales

* La Red Neuronal Convolucional ó CNN es el tipo de red neuronal más utilizada para el reconocimiento y procesamiento de imágenes.
* Inspiradas en los procesos biológicos, en los que el patrón de conectividad entre neuronas se asemeja a la organización de la corteza visual de los seres vivos.
* Son una variante del Perceptrón Multicapa y usan relativamente poco preprocesamiento en comparación con otros algoritmos de clasificación de imágenes. 
* Procesa la información mediante filtros y tiene la capacidad de calcular automáticamente los pesos de los filtros.
* La forma en que se guarda una imagen, consiste básicamente en una matríz de valores que van de 0 a 255, e indican el valor del color para cada posición en el plano 2D, además están los canales, correspondientes a los valores RGB, así que esta matriz tiene 3 dimensiones.
* Al analizar esa información, lo que queda como entrada para una red neuronal, es el array respectivo.<br>

<img src="../_src/assets/redes_convolucionales1.jpg" height="400"><br>

* En lugar de las capas completamente conectadas, la CNN aplica lo que se denomina capa convolucional, su funcionamiento es mucho más performante y de naturaleza muy diferente.
* Su principal característica está en reconocer los bordes de la imagen, tanto verticales como horizontales.<br>

<img src="../_src/assets/redes_convolucionales2.jpg" height="200"><br>

¿Cómo funciona? Tenemos el ejemplo de una matriz de 6x6 a la cual, se le aplica una operación de convolución, que consistirá en un filtro, otra matriz más chica, en este caso de 3x3. El resultado será una matriz de 4x4:<br>

<img src="../_src/assets/redes_convolucionales3.jpg" height="200"><br>
<img src="../_src/assets/redes_convolucionales4.jpg" height="200"><br>
<img src="../_src/assets/redes_convolucionales5.jpg" height="200"><br>
<img src="../_src/assets/redes_convolucionales6.jpg" height="200"><br>

* Si en la matriz original, hay sectores donde es muy marcada la diferencia numérica de los pixeles, significa que son zonas diferenciadas de la imagen.
* De esta forma queda claro el sentido de la transición de claro a oscuro y viceversa:<br>

<img src="../_src/assets/redes_convolucionales7.jpg" height="200"><br>
<img src="../_src/assets/redes_convolucionales8.jpg" height="200"><br>

* Los filtros pueden aplicarse también de manera horizontal, el resultado siempre va a ser una matriz donde queden identificados los limites en la imagen, es decir los bordes:<br>

<img src="../_src/assets/redes_convolucionales9.jpg" height="200"><br>

* Surgen dos inconvenientes, la imagen se hace más pequeña y además, hay pixeles que son repasados menos veces por el filtro, aquellos ubicados en los bordes. 
* Para resolverlo, se agranda la matriz agregando 1 o 2 pixeles más, quedando entonces para el ejemplo, una matriz de 8x8.
* Por otra parte, la matriz de filtros, usualmente es impar, es decir, 3x3, 5x5 o 7x7.
* Una variante es cambiar el <b>salto ó strided convolution</b> a 2 en lugar de 1.
* Si la imagen es RGB, entonces en realidad tendremos 3 canales, así que el proceso de convolución es además sobre una tercer dimensión:<br>

<img src="../_src/assets/redes_convolucionales10.jpg" height="250"><br>

* Para crear una capa de la red neuronal convolucional, se aplica un <b>sesgo</b> y una función de activación <b>ReLU</b>:<br>

<img src="../_src/assets/redes_convolucionales11.jpg" height="250"><br>

* La capa de <b>agrupación máxima ó max pooling</b> es un nuevo tipo de filtro, que se queda con el valor máximo.
* A veces, esta capa cuenta junto con la capa de convolución como una única capa, debido a que solo tiene hiperparámetros,  y no tiene parámetros que ajustar, o sea que no se practica propagación hacia atrás.<br>

<img src="../_src/assets/redes_convolucionales12.jpg" height="250"><br>

En una CNN entonces, se encuentran los 3 tipos de capas:
1) Convolucional (CONV)
2) Pool para agrupar (Pool)
3) Totalmente conectada (FC: Fully conected)

A medida que la red neuronal se hace más profunda, disminuye el tamaño de la matriz original, aumentando el número de canales:<br>

<img src="../_src/assets/redes_convolucionales13.jpg" height="250"><br>

AlexNet es una red con 60 millones de parámetros.<br>

<img src="../_src/assets/redes_convolucionales14.jpg" height="250"><br>

VGG-16 es un ejemplo de red con 138 millones de parámetros.<br>

<img src="../_src/assets/redes_convolucionales15.jpg" height="250"><br>

Neural Style Transfer

<img src="../_src/assets/redes_convolucionales16.jpg" height="250"><br>



## Homework