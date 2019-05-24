#!/bin/bash
for i in *''*
do 
	name_tmp="${i// /_}"
	name_tmp=$(echo "$name_tmp" | sed 's/(\|)//g')
	name_tmp=$(echo "$name_tmp" | sed 's/jpeg/jpg/g')
	mv "$i" "$name_tmp" 2> /dev/null
done
