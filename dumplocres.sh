#!/bin/bash
#echo $#
if [ $# -lt "2" ]; then	
	echo "dumpRes <statement> <dump type> <dump file>"
	exit 0
fi

bo_url="http://localhost:9090/cmd"

file_name=""
if [ -z "$3" ]; then
   if [ "$2" = "XLSX" ]; then
	echo "please assign a XLSX file name"
	exit 0
   else
   	file_name="STDOUT"
   fi
else
   file_name=$3
fi

echo "run the script : python dumpRes/borestful.py \"$bo_url\" \"$1\" | python dumpRes/bojson2file.py $2 $file_name"

date1=$(date +"%s")

python dumpRes/borestful.py "$bo_url" "$1" | python dumpRes/bojson2file.py $2 $file_name

date2=$(date +"%s")
diff=$(($date2-$date1))
echo "$diff seconds elapsed."
