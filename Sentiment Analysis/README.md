# MapReduce


**MapReduce** para contabilizar por países la negatividad/positividad/neutralidad respecto de un producto/empresa/concepto.

*Se ejecuta:*  ```cat tweets.json | ./mapper.sh "iphone" | sort | ./reducer.sh > reduce_result_tweets.txt```


* ```cat tweets.json```              Inserta al pipe el archivo a mapear y reducir en formato json
* ```./mapper.sh "iphone"```         Ejecuta la rutina de "Map" con el parámetro iphone
* ```sort```                         Ordena alfabeticamente
* ```./reducer.sh```                 Ejecuta la rutina de "Reduce"
* ```> reduce_result_tweets.txt``` Manda el resultado de la rutina de MapReduce al archivo reduce_result_tweets.txt



*PARA CORRER EL MAPPER ES NECESARIO INSTALAR  la última versión de JQ:*

 ```git clone https://github.com/stedolan/jq.git ```
 
 ```cd jq```
 
 ```autoreconf -i ```
 
  ```sudo apt-get install libonig-dev ```
  
 ```./configure ```
 
 ```make ```
 
 ```sudo make install ```
 


En la carpeta Ejemplos se encuentran:

 * tweets.json:                 Archivo principal de entrada con tweets
 * map_result_tweets.txt:       Archivo resultante de aplicar el mapper al archivo principal. Mostrará cada tweet ubicado de acuerdo a su país y su análisis de positividad/negatividad/neutralidad.
 * reduce_result_tweets.txt:    Archivo resultante de aplicar el reducer al archivo mapeado. Tomará cada línea del mapeo y agrupara por países y sentimientos, contabilizando la cantidad de tweets ubicados en el conjunto. 




