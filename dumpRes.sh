#!/bin/bash
echo $#
if [ $# -lt "4" ]; then	
	echo "dumpRes <bo host> <po port> <statement> <dump type> <dump file>"
	exit 0
fi

bo_url="http://$1:$2/cmd"

file_name=""
if [ -z "$5" ]; then
   file_name="STDOUT"
else
   file_name=$5
fi

echo "run the script : python borestful.py \"$bo_url\" \"$3\" | python bojson2file.py $4 \"$file_name\""

date1=$(date +"%s")

python borestful.py "$bo_url" "$3" | python bojson2file.py $4 "$file_name"

date2=$(date +"%s")
diff=$(($date2-$date1))
echo "$diff seconds elapsed."
