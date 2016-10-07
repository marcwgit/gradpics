#1/bin/bash
for i in 100 97 95
do
    for k in 50 40 30 20 15 10
    do
        mkdir mwthumb-hood$k-$i
        cp inter-hood/* mwthumb-hood$k-$i/.
        mogrify -resize $k% mwthumb-hood$k-$i
        if test $i !=100
        then
            mogrify -quality $i$ mwthumb-hood$k-$i/*
        fi
    done

done
