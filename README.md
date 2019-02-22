# SoalShift_modul1_B04
Pengerjaan Soal Shift Modul 1 Sisop 2019

# Soal Shift Modul 1

## Kelompok B4

### **Nomor 1**

#### Soal
```
Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi  
oleh seseorang menggunakan bash script, file yang dimaksud adalah nature.zip. Karena  
terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul  
14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari.
Hint: Base64, Hexdump
```

#### Pemahaman Soal 1
Di dalam soal ini kita diminta untuk mendekripsi data berupa gambar yang diencode dengan base64.


#### Jawaban
```bash
if [[  ! -e  "$HOME/sisop/modul1/nomor1/nature"  ]];
then 
   unzip -o $HOME/sisop/modul1/nomor1/nature.zip -d $HOME/sisop/modul1/nomor1/
fi

source=$HOME/sisop/modul1/nomor1/nature/*

if [[  ! -d  "$HOME/sisop/modul1/nomor1/naturedecrypt"  ]];
then 
   mkdir "$HOME/sisop/modul1/nomor1/naturedecrypt"
fi

target=$HOME/sisop/modul1/nomor1/naturedecrypt

ite=0
for image in $source
do
  base64 -d $image | xxd -r >> $target/"Decrypted"$ite.jpg
  let ite++
done
```

#### Crontab
```bash
14 14 14 2 5 /bin/bash /home/aeris/sisop/modul1/nomor1/nomor1.sh
```
14 14 14 2 5 maksudnya script yang dipilih akan dijalankan pada jam 14:14 pada Tanggal 14 dan pada Hari Jumat pada bulan February  
/bin/bash untuk memberitahu agar script yang dipilih dijalankan menggunakan bash  
/home/aeris/sisop/modul1/nomor1/nomor1.sh direktori tempat script yang akan dijalankan

#### Penjelasan
```bash
if [[  ! -e  "$HOME/sisop/modul1/nomor1/nature"  ]];
then 
   unzip -o $HOME/sisop/modul1/nomor1/nature.zip -d $HOME/sisop/modul1/nomor1/
fi
```
Berguna untuk mengecek apakah nature.zip sudah diextract atau belum, jika belum maka akan melakukan extract
```bash
source=$HOME/sisop/modul1/nomor1/nature/*
```
Variabel "source" yang akan menyimpan semua file yang ada dalam folder "nature"
```bash
if [[  ! -d  "$HOME/sisop/modul1/nomor1/naturedecrypt"  ]];
then 
   mkdir "$HOME/sisop/modul1/nomor1/naturedecrypt"
fi
```
Berguna untuk mengecek apakah ada folder "naturedecrypt", jika belum maka akan membuat folder "naturedecrypt"
```bash
target=$HOME/sisop/modul1/nomor1/naturedecrypt
```
Variabel "target" yang dibuat sebagai directory untuk menyimpan gambar yang telah didekripsi
```bash
ite=0
```
Variabel "ite" yang berguna untuk iterasi
```bash
for image in $source
```
Variabel "image" yang diproses
```bash
base64 -d $image | xxd -r >> $target/"Decrypted"$ite.jpg
```
Proses dekripsi menggunakan base64, dan hexdump  
-d (decode) untuk melakukan dekoding dan -r (revert) koversi hexdump ke binary  


```bash
let ite++
Variabel "ite" diincrement sampai semua file yang ada di folder "nature" terbaca
```


### **Nomor 2**

#### Soal 2
```
Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta
untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv.
Laporan yang diminta berupa:

a. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun
2012.
b. Tentukan tiga product line yang memberikan penjualan(quantity)
terbanyak pada soal poin a.
c. Tentukan tiga product yang memberikan penjualan(quantity)
terbanyak berdasarkan tiga product line yang didapatkan pada soal
poin b.
```
### Pemahaman Soal 2a
Didalam soal ini, Kita diminta untuk mencari nilai data yang diinginkan dalam sebuah file csv. 
Dalam soal a, Kita diminta untuk melakukan pencarian negara yang paling banyak melakukan penjualan (quantity) dalam tahun 2012.
Untuk mendapatkan data tersebut kita menggunakan awk. Pada awk ditambahkan ‘, ‘ agar setiap kolom tidak diprint seterusnya dan membuat tidak bsa dilakukannya komputasi. 
Berikut Script untuk menyelesaikan nya.

### Jawaban 2a

```bash
awk -F ',' '{
arr[$1]+=$10;
if (max<arr[$1] && $7==2012)
{max=arr[$1];
kota=$1;
}
}
END {print kota,max}' $item
```

### Penjelasan
```bash
awk -F ','

```
Berguna untuk memberitahukan separator yakni tanda koma
```bash
arr[$1]+=$10;

```
Dikarenakan soal meminta mencari nilai terbesar maka digunakan array untuk menyimpan.nilai $10 dan $1 ..$x adalah nilai dari row dalam kolom ke x

```bash
if (max<arr[$1] && $7==2012)
{max=arr[$1];
kota=$1;
}

``` 
Berguna untuk memilah data-data yang harus tahun 2012 dan menginput nama kota serta array,ketika ada array yang lebih besar valuenya maka akan menjadi array max

```bash
END {print kota,max}' $item

```
Agar ketika dalam proses tidak diprinting terus menerus maka digunakan end untuk melakukan print disaat semua data selesai terbaca.item adalah nama file csv yang diperiksa

### Pemahaman soal 2b

Dalam soal b kita diminta untuk menemukan jenis produk yang paling banyak dijual berdasarkan data no 1 yakni tahun 2012 dan dari negara USA. Digunakan if else dalam if untuk menemukan tiga jenis barang terbanyak. Berikut Script yang digunakan.

### Jawaban

```bash
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

```
### Penjelasan 2b
```bash
awk -F ',' '{

arr[$4]+=$10;
if ($1=="United States" && $7==2012){
max=arr[$4];
barang=$4;

```
Dalam permulaan jawaban soal 2b dan 2a mirip yang berbeda adalah terdapat pengecualian baru di ifnya yakni negara yang didapat dari soal 2a. kemudian kolom yang dipilih yakni kolom 4.

```bash
if(barang1!=0){
  if (barang1==barang){
     max1=max;
  }
  else {
  ...
  else{
  barang1=barang;
}     
```
Untuk if nya kita mengisi barang pertama dahulu. jika barang pertama diisi oleh barang dengan nama array sama maka nilai max nya akan bertambah. bila tidak masuk ke barang peringkat 1 baru.

```bash
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

```
ketika barang 1 tidak kosong namun,sudah bukan barang yang sama lagi maka dimasukan ke peringkat kedua kemudian dicek kembali apakah barang merupakan barang yang sama bila sama maka nilai nya ditambah.dan bila lebih besar dari barang 1 maka peringkat mereka diubah.

```bash
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

```
Sama seperti barang peringkat 2. Program melakukan cek jika bila barang 3 bertambah nilainya.jika quantity max dalam barang peringkat 2 lebih rendah dari barang ketiga maka posisi mereka ditukar

```bash
END {print barang1,max1,barang2,max2,barang3,max3}' $item

```
untuk printing nya maka tetap diakhir namun memiliki 6 output yakni ketiga nama barang tertinggi dan jumlahnya. item adalah nama file csv yang diperiksa

#Pemahaman soal 2c
```
Dalam soal c kita diminta untuk menemukan kembali  3 data produk terbanyak dalam hasil soal b. Sehingga terdapat 9 keluaran. Berdasarkan soal b. 3 jenis barang yang terbanyak adalah perconal accesories, camping Equipment dan mountaineering Equipment. Untuk mencarikan nya tidak jauh berbeda dengan soal b namun memakai 3 awk dengan ketentuan barang nya dri jenis barang yang diinginkan. Berikut Script yang digunakan

```

#Jawaban soal 2c

```bash
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


```
#Penjelasan 2c

Jawaban soal 2c dan 2b hampir sama yang membedakannya adalah dalam soal c menggunakan 3 kali awk dari soal b dan memiliki pengecualian if tersendiri

```bash
if ($1=="United States" && $7==2012 && $4=="Personal Accessories"){
max=arr[$5];
barang=$5;

```
pada awk pertama ,terdapat pengecualian dalam kolom ke 4 yakni jenis barang merupakan Personal Accesories yang merupakan hasil jawaban soal 2b. kemudian untukk array yang dipakai adalah kolom ke 5 yakni barang.

```bash
if ($1=="United States" && $7==2012 && $4=="Camping Equipment"){
max=arr[$5];
barang=$5;
```

Pada awk kedua pengecualiannya adalah camping equipment

```bash
if ($1=="United States" && $7==2012 && $4=="Mountaineering Equipment"){
max=arr[$5];
barang=$5;
```

Pada awk ketiga pengecualianya adalah Mountaineering equipment

### **Nomor 3**

### Soal

```
Buatlah sebuah script bash yang dapat menghasilkan password secara acak
sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password
acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama
sebagai berikut:

a. Jika tidak ditemukan file password1.txt maka password acak tersebut
disimpan pada file bernama password1.txt
b. Jika file password1.txt sudah ada maka password acak baru akan
disimpan pada file bernama password2.txt dan begitu seterusnya.
c. Urutan nama file tidak boleh ada yang terlewatkan meski filenya
dihapus.
d. Password yang dihasilkan tidak boleh sama.
```
### Pemahaman Soal 3

```
Dalam soal ini kita diminta untuk membuat sebuah paswword yang memiliki aturan regex kumpulan karakter huruf dan angka (huruf boleh capital maupun tidak) kemudian disimpan disebuah file bernama paswword’ke-’.txt, untuk Script ini untuk menggunakan urandom yang telah didapat dalam bin kemudian beri pipline regex dan fold untuk membatasi karakter nya menjadi 12 sesuai soal yang diminta. Agar tidak terjadi pelompatan ketika salah satu file dihapus maka menggunakan if dalam while untuk mengecek file satu persatu apakah ada atau tidak. Berikut Script yang digunakan. 

```

### Jawaban

```bash
#!bin/bash

benar=1
i=1

while [ $benar != 0 ]
do

if [ ! -f /home/phiton2/sisop1/password$i.txt ];
then
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1 > /home/phiton2/sisop1/password$i.txt
benar=0
else
let i=i+1
fi

done

```

### Penjelasan

```bash
#!bin/bash
```
memberitahu pada sistem untuk penggunaan bash script
```bash
benar=1
i=1
```
Inisiasi untuk melakukan looping,benar menjadi flag pemberhentian loop

```bash
while [ $benar != 0 ]
do

if [ ! -f /home/phiton2/sisop1/password$i.txt ];
then
```
Untuk melakukan loop dan melakukan pengecekan apakah ada file yang bernama passsword'ke'i.bla tidak ada maka lanjut untuk pembuatan kita sudah menyelesaikan soal 3a dan 3c .

```bash
then
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1 > /home/phiton2/sisop1/password$i.txt
benar=0

```
Kita menggunakan urandom untuk menciptakan password yang tidak sama untuk menjawab soal 3d.jumlahnya diatur dengan fold kemudian tr -dc untuk memberikan aturan regex pada password. head untuk menampilkan line pertama. kemudian aturan tersebut dimasukan kesebuah file password'ke'.txt.bila sudah loop diberhentikan

```bash
else
let i=i+1
fi

done
```
Agar nantinya ketika dicek sudah ada file password ke 1 kah atau ke 2 maka nilai i ditambahkan,dalam ini untuk menjawab soal 3c.fi sebagai penutup if dan done sebagai penutup while.

### **Nomor 4**

### Soal


Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal-bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai berikut:
   - Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14.
   - Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya. 
   - setelah huruf z akan kembali ke huruf a
   - Backup file syslog setiap jam.
   - dan buatkan juga bash script untuk dekripsinya.

### Pemahaman Soal 4
Inti pada soal ini adalah menggeser huruf sesuai dengan jam yang ada pada sistem kita, dan script itu dijalankan setiap jam. Kemudian setelah dienkripsi juga diharuskan untuk membuat kode untuk dekripsinya

#### Jawaban
#### Kode untuk enkripsi
```bash
#!bin/bash

chr() {
  printf "\\$(printf '%03o' "$1")"
}

jam=`date +%H`

fileName=`date '+%H:%M %d-%m-%Y'`

sysFile=`cat /var/log/syslog`

key1=`expr $jam + 98`
key2=`expr $jam + 97`

up=`chr $key1`
down=`chr $key2`

sysSave=`printf "$sysFile" | tr b-zaB-ZA $up-za-$down${up^^}-ZA-${down^^}`

printf "$sysSave" > "$fileName".txt
```
#### Kode untuk dekripsi
```bash
#!/bin/bash

chr() {
  printf "\\$(printf '%03o' "$1")"
}

sysFile=`cat "$1$2"`
jam=`echo "$1" | awk -F: '{print $1}'`

key1=`expr $jam + 98`
key2=`expr $jam + 97`

up=`chr $key1`
down=`chr $key2`

sysSave=`printf "$sysFile" | tr $up-za-$down${up^^}-ZA-${down^^} b-zaB-ZA`

printf "$sysSave"
```

#### Crontab
```bash
@hourly /bin/bash /home/aeris/sisop/modul1/nomor4/nomor4.sh
```
Melakukan back up setiap jam dengan keyword hourly

### Penjelasan
#### Enkripsi
```bash
chr() {
  printf "\\$(printf '%03o' "$1")"
}
```
Fungsi untuk mengubah ASCII menjadi Huruf
```bash
jam=`date +%H`

fileName=`date '+%H:%M %d-%m-%Y'`
```
Variabel 'jam' yang menyimpan nilai jam pada saat ini dan Variabel fileName digunakan sebagai FileName pada saat menyimpan file
```bash
sysFile=`cat /var/log/syslog`
```
Variabel sysFile mengambil data yang ada pada syslog
```bash
key1=`expr $jam + 98`
key2=`expr $jam + 97`
```
Variabel key1 dan key2 berperan sebagai batas atas(huruf b) dan batas bawah(huruf a) pada saat translate
```bash
up=`chr $key1`
down=`chr $key2`
```
Variabel up dan down berperan sebagai tempat menyimpan key1 dan key2 yang telah diubah menjadi Huruf(sebelumnya berupa ASCII)
```bash
sysSave=`printf "$sysFile" | tr b-zaB-ZA $up-za-$down${up^^}-ZA-${down^^}`
```
Setiap huruf dalam sysFile akan dibaca kemudian dan dalam pembacaan file tersebut akan terjadi pergantian huruf sesuai dengan format translate di atas (b-zaB-ZA) diganti dengan hasil dari up dan down sesuai dengan format juga
```bash
printf "$sysSave" > "$fileName".txt
```
Hasil akhir akan disimpan ke dalam file dengan nama fileName.txt

#### Dekripsi
Penjelasan antara enkripsi dan dekripsi sebenarnya sama hanya ada beberapa perbedaan kecil yaitu pada
```bash
sysFile=`cat "$1$2"`
jam=`echo "$1" | awk -F: '{print $1}'`
```
Pembacaan file dibaca dari parameter dan Variabel jam diambil dari nama file
```bash
sysSave=`printf "$sysFile" | tr $up-za-$down${up^^}-ZA-${down^^} b-zaB-ZA`
```
Batas atas dan Batas bawah dibalik, format pada translate dibalik
```bash
printf "$sysSave"
```
Hasil yang langsung ditampilkan di layar


### **Nomor 5**

### Soal


Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi kriteria berikut:

   - Tidak mengandung string “sudo”, tetapi mengandung string “cron”, serta buatlah pencarian stringnya tidak bersifat case sensitive, sehingga huruf kapital atau tidak, tidak menjadi masalah.
   - Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13.
   - Masukkan record tadi ke dalam file logs yang berada pada direktori /home/[user]/modul1.
   - Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst.

### Pemahaman Soal 5
Inti pada soal ini adalah mengambil data dari syslog yang tidak mengandung kata 'sudo' tetapi mengandung kata 'cron' dan mempunyai jumlah field pada baris kurang daari 13. Setelah itu data tersebut disimpan pada direktori /home/[user]/modul1. Dan script yang telah kita buat dijalankan setiap 6 menit dari menit ke 2 hingga 30.

#### Jawaban
```bash
#!/bin/bash

if [[  ! -d  "$HOME/modul1"  ]];
then 
   mkdir "$HOME/modul1"
fi

awk 'tolower($0) ~ /cron/ && tolower($0) !~ /sudo/ && NF < 13 {print $0}' /var/log/syslog >> $HOME/modul1/logno5.txt

```

#### Crontab
```bash
2-30/6 * * * *   /bin/bash /home/aeris/sisop/modul1/nomor5/nomor5.sh
```
Menjalankan scipt setiap 6 menit dari menit ke 2 hingga 30

#### Penjelasan
```bash
if [[  ! -d  "$HOME/modul1"  ]];
then 
   mkdir "$HOME/modul1"
fi
```
Mengecek apakah folder modul1 pada direktori /home/[user]/modul1 sudah ada atau belum, jika belum maka akan membuat direktori
```bash
awk 'tolower($0) ~ /cron/ && tolower($0) !~ /sudo/ && NF < 13 {print $0}' /var/log/syslog >> $HOME/modul1/logno5.txt
```
Karena tidak case sensitive maka semua yang dibaca dibuat menjadi huruf kecil terlebih dahulu, kemudian jika memenuhi syarat di atas makan akan disimpan pada direktori yang telah ditentukan

