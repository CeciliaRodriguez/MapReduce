#!/bin/bash

jq --arg word $1 '.[] | select((.user.location != "")) |  select(.text | contains($word))  |   "[" + (.user.location | .[0:3]) + "]" + "=>" + (.text | gsub("\\[";" ") | gsub("\\]";" "))' | while read line ; do
    
    country=${line:0:5}
    length=${#line}
    rest=${line:5:length}
    length=$((length-9))
    sentiment=$(curl -s -d "txt=${line:8:length}" http://sentiment.vivekn.com/api/text/ | jq .result.sentiment | sed -e 's/^"//'  -e 's/"$//')
    separator=","
    echo $country$separator$sentiment$rest

done



 