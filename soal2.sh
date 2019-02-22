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

awk -F ',' '{

arr[$4]+=$10;
if ($1=="United States" && $7==2012){
max=arr[$4];
barang=$4;

if(barang1!=0){
  if (barang1==barang){
     max1=max;
  }
  else {
     if(barang2!=0){
       if(barang2==barang){
         max2=max;
         if(max2>max1){
           barang2=barang1;
           max2=max1;
           barang1=barang;
           max1=max;
         }
       }
       else{
         if(barang3!=0){
           if(barang3==barang){
             max3=max;
             if(max3>max2){
               barang3=barang2;
               max3=max2;
               barang2=barang;
               max2=max;
             }
           }
         }
         else{
           barang3=barang;
         }
       }
     }
     else{
       barang2=barang;
    }
  }
}
else{
  barang1=barang;
}

}
}
END {print barang1,max1,barang2,max2,barang3,max3}' $item


echo "soal 2c ="

echo "Personal Accessories"

awk -F ',' '{

arr[$5]+=$10;
if ($1=="United States" && $7==2012 && $4=="Personal Accessories"){
max=arr[$5];
barang=$5;

if(barang1!=0){
  if (barang1==barang){
     max1=max;
  }
  else {
     if(barang2!=0){
       if(barang2==barang){
         max2=max;
         if(max2>max1){
           barang2=barang1;
           max2=max1;
           barang1=barang;
           max1=max;
         }
       }
       else{
         if(barang3!=0){
           if(barang3==barang){
             max3=max;
             if(max3>max2){
               barang3=barang2;
               max3=max2;
               barang2=barang;
               max2=max;
             }
           }
         }
         else{
           barang3=barang;
         }
       }
     }
     else{
       barang2=barang;
    }
  }
}
else{
  barang1=barang;
}

}
}
END {print barang1,max1,barang2,max2,barang3,max3}' $item

echo "Camping Equipment"

awk -F ',' '{

arr[$5]+=$10;
if ($1=="United States" && $7==2012 && $4=="Camping Equipment"){
max=arr[$5];
barang=$5;

if(barang1!=0){
  if (barang1==barang){
     max1=max;
  }
  else {
     if(barang2!=0){
       if(barang2==barang){
         max2=max;
         if(max2>max1){
           barang2=barang1;
           max2=max1;
           barang1=barang;
           max1=max;
         }
       }
       else{
         if(barang3!=0){
           if(barang3==barang){
             max3=max;
             if(max3>max2){
               barang3=barang2;
               max3=max2;
               barang2=barang;
               max2=max;
             }
           }
         }
         else{
           barang3=barang;
         }
       }
     }
     else{
       barang2=barang;
    }
  }
}
else{
  barang1=barang;
}

}
}
END {print barang1,max1,barang2,max2,barang3,max3}' $item

echo "Mountaineering Equipment"

awk -F ',' '{

arr[$5]+=$10;
if ($1=="United States" && $7==2012 && $4=="Mountaineering Equipment"){
max=arr[$5];
barang=$5;

if(barang1!=0){
  if (barang1==barang){
     max1=max;
  }
  else {
     if(barang2!=0){
       if(barang2==barang){
         max2=max;
         if(max2>max1){
           barang2=barang1;
           max2=max1;
           barang1=barang;
           max1=max;
         }
       }
       else{
         if(barang3!=0){
           if(barang3==barang){
             max3=max;
             if(max3>max2){
               barang3=barang2;
               max3=max2;
               barang2=barang;
               max2=max;
             }
           }
         }
         else{
           barang3=barang;
         }
       }
     }
     else{
       barang2=barang;
    }
  }
}
else{
  barang1=barang;
}

}
}
END {print barang1,max1,barang2,max2,barang3,max3}' $item
