#!/bin/bash

item="WA_Sales_Products_2012-14.csv"


echo "Soal 2a = "

awk -F ',' '{
arr[$1]+=$10;
if (max<arr[$1] && $7==2012)
{max=arr[$1];
kota=$1;
}
}
END {print kota,max}' $item

echo "soal 2b = "

awk -F "," '{
	if ($1 == "United States" && $7 == 2012) i[$4]+=$10} 
	END {
	  for (x in i) {
	    print i[x], x}}' $item | sort -nr | head -n 3

echo "soal 2c = "

awk -F "," '{
	if ($1 == "United States" && $7 == 2012 && ($4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 == "Outdoor Protection")) 
	  i[$6]+=$10} END {
	    for (x in i) {
	    
       print i[x], x}}' $item | sort -nr | head -n 3
