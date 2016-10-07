# /usr/bin/perl  -p -i -e 's#\./##g' flist.txt
sed  -i 's#\./##g' flist.txt
cd full
find . -maxdepth 1 \( -iname "*jpg" -o -iname "*gif" -o -iname "*.png" \) -type f > ../flist.txt
cd ../
python picarray.py flist.txt thumb10 5
