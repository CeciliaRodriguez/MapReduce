#!/bin/bash

jq  '.[] | if (.retweet_count < 51) 
                then  "[000-050]" + "=>" + (.text | gsub("\\[";" ") | gsub("\\]";" ")) 
                elif (.retweet_count < 151) then "[051-150]" + "=>" + (.text | gsub("\\[";" ") | gsub("\\]";" ")) 
                elif (.retweet_count < 451) then "[151-450]" + "=>" + (.text | gsub("\\[";" ") | gsub("\\]";" ")) 
                else "[>450]" + "=>" + (.text | gsub("\\[";" ") | gsub("\\]";" "))    end '
