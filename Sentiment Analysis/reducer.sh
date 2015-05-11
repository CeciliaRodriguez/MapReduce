#!/bin/bash

cp /dev/stdin STDIN

sed 's/.*\[\([^]]*\)\].*/\1/' STDIN | perl -ne 'print "[$_"' | sed "s/$/\]/" | uniq -c | while read line ; do

    length=${#line}
    count=${line:0:1}
    country=${line:3:3}
    sentiment=${line:7:length-8}
    
    echo "COUNT:"$count"    COUNTRY:"$country"    SENTIMENT:"$sentiment
   
done

rm STDIN

