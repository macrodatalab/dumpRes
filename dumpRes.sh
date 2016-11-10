#!/bin/bash
#echo $#
if [ $# -lt "5" ]; then	
	echo "dumpRes <bo host> <po port> <workspace> <statement> <dump type> <dump file>"
	exit 0
fi

bo_url="http://$1:$2/cmd"

file_name=""
if [ -z "$6" ]; then
   if [ "$5" = "XLSX" ]; then
	echo "please assign a XLSX file name"
	exit 0
   else
   	file_name="STDOUT"
   fi
else
   file_name=$6
fi

echo "run the script : python dumpRes/borestful.py \"$bo_url\" \"$4\" \"$3\" | python dumpRes/bojson2file.py $5 $file_name"

date1=$(date +"%s")

python dumpRes/borestful.py "$bo_url" "$4" "$3" | python dumpRes/bojson2file.py $5 $file_name

date2=$(date +"%s")
diff=$(($date2-$date1))
echo "$diff seconds elapsed."
