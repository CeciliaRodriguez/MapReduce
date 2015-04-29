# MapReduce


**MapReduce** para contabilizar por rangos la cantidad de retweets, de los últimos tweets de noticias extraídos de twitter. El resultado se ordena por rangos. Debajo de cada rango de retweets y cantidad de tweets que pertenecen a ese rango, se muestra el conjunto de tweets que lo componen.

*Se ejecuta:*  ```cat tweets_noticias_35M.json | ./mapper.sh | sort | ./reducer.sh > reduce_result_noticias.txt```

*O bien:*  ```tweets_noticias_35M.json | ./mapper.sh | sort > map_result_noticias.txt```
           ```cat map_result_noticias.txt | ./reducer.sh > reduce_result_noticias.txt```

* ```cat tweets_noticias_35M.json``` Inserta al pipe el archivo a mapear y reducir en formato json
* ```./mapper.sh```                  Ejecuta la rutina de "Map"
* ```sort```                         Ordena alfabeticamente
* ```./reducer.sh```                 Ejecuta la rutina de "Reduce"
* ```> reduce_result_noticias.txt``` Manda el resultado de la rutina de MapReduce al archivo reduce_result_noticias.txt



*PARA CORRER EL MAPPER ES NECESARIO INSTALAR  **la última versión** de JQ:*

 ```git clone https://github.com/stedolan/jq.git ```
 ```cd jq```
 ```autoreconf -i ```
  ```sudo apt-get install libonig-dev ```
 ```./configure ```
 ```make ```
 ```sudo make install ```
 


En la carpeta Ejemplos se encuentran:

 * tweets_noticias_35M.json:   Archivo principal de entrada con todas las noticias extraídas de tweeter
 * map_result_noticias.txt:    Archivo resultante de aplicar el mapper al archivo principal. Mostrará cada tweet ubicado en su rango de retweets.
 * reduce_result_noticias.txt: Archivo resultante de aplicar el reducer al archivo mapeado. Tomará cada línea del mapeo y agrupara por rangos, contabilizando la cantidad de tweets ubicados en el rango. Debajo de cada rango se encontrará el detalle de los tweets que pertenecen al conjunto.





