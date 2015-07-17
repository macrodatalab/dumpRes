# dumpRes 
python codes and a shell script to dump bigobject data by a query statement

##System requirements
Python 2.7.6

Packages : requests, openpyxl

    pip install requests, openpyxl

## How to use

    dumpRes <bo host> <po port> <statement> <dump type> <dump file>
  
For example, when a bigobject run on localhost:9090, you can dump the "sales" table as follows:

    sh dumpRes.sh localhost 9090 "select * from sales" CSV dump.csv
    sh dumpRes.sh localhost 9090 "select * from sales" XLSX dump.xlsx
  
You can use the CSV dump type without a dump file name, the result will be printed directly.

    sh dumpRes.sh localhost 9090 "select * from sales limit 10" CSV

Note that, admin statements such as "show tables", "desc sales", and so on will not be stored into a file. 


