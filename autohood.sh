read -p "Enter title :" title
echo "Title: $title"
cd full-hood
ls -1 >../flist.txt
#find . -maxdepth 1 \( -iname "*jpg" -o -iname "*gif" -o -iname "*.png" \) -type f > ../flist.txt
cd ../
sed  -i 's#\./##g' flist.txt
mkdir inter-hood
cp full-hood/* inter-hood/.
cd inter-hood

# control large size images
mogrify -resize 1800x1800\> *

mogrify  -crop 100x50%+0+0  +repage * #--cut off bottom half
mogrify  -gravity Center -crop 50x100%+0+0  +repage *  #--cut off 1/4 of each side
cd ../
mkdir thumb-hood10
echo "10 step 1 done"
mkdir thumb-hood15
mkdir thumb-hood20
mkdir thumb-hood30
mkdir thumb-hood40
mkdir thumb-hood50
echo "50 step 1 done"
cp inter-hood/* thumb-hood10/.
cp inter-hood/* thumb-hood15/.
cp inter-hood/* thumb-hood20/.
cp inter-hood/* thumb-hood30/.
cp inter-hood/* thumb-hood40/.
cp inter-hood/* thumb-hood50/.
echo "50 step 2 done"
cd thumb-hood10
mogrify -resize 10% *
cd ../
cd thumb-hood15
mogrify -resize 15% *
cd ../
cd thumb-hood20
mogrify -resize 20% *
echo "20 step 2 done"
cd ../
cd thumb-hood30
mogrify -resize 30% *
echo "30 step 3 done"
cd ../
cd thumb-hood40
mogrify -resize 40% *
cd ../
cd thumb-hood50
mogrify -resize 50% *
cd ../
python picarray.py flist.txt thumb-hood10 full-hood 5 "$title"
echo "py 10"
python picarray.py flist.txt thumb-hood15 full-hood 4  "$title"
echo "py 20"
python picarray.py flist.txt thumb-hood20 full-hood 3  "$title"
python picarray.py flist.txt thumb-hood30 full-hood 3  "$title"
python picarray.py flist.txt thumb-hood40 full-hood 2  "$title"
python picarray.py flist.txt thumb-hood50 full-hood 2  "$title"
