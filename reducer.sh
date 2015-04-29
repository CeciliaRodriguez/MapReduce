#!/bin/bash

cp /dev/stdin STDIN


sed 's/.*\[\([^]]*\)\].*/\1/' STDIN | perl -ne 'print "RANGE: [$_"' | sed "s/$/\]/" | uniq -c | while read line ; do
    
    printf "*************************\n"
    
    echo "COUNT:"$line
    
    range=$(echo $line | cut -d "[" -f2)
   
    if [[ ${range:0:1} == "0" ]] && [[ ${range:1:1} == "0" ]]; then
        echo $(awk '/\"\[000\-050\]/' STDIN | sed -n "s/.*\=>\([^']*\)\".*/\1/p" | awk '{ print "\""$0"\""}' | paste -sd "," -)
    fi
    
    if [[ ${range:0:1} == "5" ]] && [[ ${range:1:1} == "5" ]]; then
        echo $(awk '/\"\[051\-150\]/' STDIN | sed -n "s/.*\=>\([^']*\)\".*/\1/p" | awk '{ print "\""$0"\""}' | paste -sd "," -)
    fi
    
    if [[ ${range:0:1} == "1" ]]; then
        echo $(awk '/\"\[151\-450\]/' STDIN | sed -n "s/.*\=>\([^']*\)\".*/\1/p" | awk '{ print "\""$0"\""}' | paste -sd "," -)
    fi
    
    if [[ ${range:0:1} == ">" ]]; then
        echo $(awk '/\"\[>450\]/' STDIN | sed -n "s/.*\=>\([^']*\)\".*/\1/p" | awk '{ print "\""$0"\""}' | paste -sd "," -)
    fi
    
 
    printf "*************************\n\n"
    
done

rm STDIN

