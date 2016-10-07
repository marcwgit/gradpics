read -p "Enter title :" title
echo "Title: $title"
cd full
ls -1 >../flist.txt
#find . -maxdepth 1 \( -iname "*jpg" -o -iname "*gif" -o -iname "*.png" \) -type f > ../flist.txt
cd ../
sed  -i 's#\./##g' flist.txt
mkdir inter
cp full/* inter/.
cd inter
mogrify -resize 1800x1800\> *
#ls -1 >../flist.txt
find . -maxdepth 1 \( -iname "*jpg" -o -iname "*gif" -o -iname "*.png" \) -type f > ../flist.txt
cd ../
sed  -i 's#\./##g' flist.txt
mkdir thumb10;
echo "10 step 1"
mkdir thumb15;
mkdir thumb20;
mkdir thumb30
mkdir thumb40
mkdir thumb50
mkdir slide200
mkdir slide600
mkdir slide800
echo "50 step 1 done"
cp inter/* thumb10/.
cp inter/* thumb15/.
cp inter/* thumb20/.
cp inter/* thumb30/.
cp inter/* thumb40/.
cp inter/* thumb50/.
cp inter/* slide200/.
cp inter/* slide600/.
cp inter/* slide800/.
echo "50 step 2 done"
cd thumb10
mogrify -resize 10% *
mogrify * -gravity center -extent 180x180 *
cd ../
cd thumb15
mogrify -resize 15% *
mogrify * -gravity center -extent 270x270 *
cd ../
cd thumb20
mogrify -resize 20% *
mogrify * -gravity center -extent 360x360 *
echo "20 step 2 done"
cd ../
cd thumb30
mogrify -resize 30% *
mogrify * -gravity center -extent 540x5400 *
echo "30 step 3 done"
cd ../
cd thumb40
mogrify -resize 40% *
mogrify * -gravity center -extent 720x720 *
cd ../
cd thumb50
mogrify -resize 50% *
mogrify * -gravity center -extent 900x900 *
cd ../
cd slide200
mogrify * -resize 200x200 -background white  -gravity center -extent 600x600 -quality 75 *
cd ../
cd slide600
mogrify * -resize 600x600 -background white  -gravity center -extent 600x600 -quality 75 *
cd ../
cd slide800
mogrify * -resize 800x800 -background white  -gravity center -extent 600x600 -quality 85 *
cd ../
python picarray.py flist.txt thumb10 full 5 "$title"
echo "py 10"
python picarray.py flist.txt thumb15 full 4  "$title"
echo "py 20"
python picarray.py flist.txt thumb20 full 3  "$title"
python picarray.py flist.txt thumb30 full 3  "$title"
python picarray.py flist.txt thumb40 full 2  "$title"
python picarray.py flist.txt thumb50 full 2  "$title"
