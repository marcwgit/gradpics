#!/usr/bin/python
from sys import argv
# from sys import re
script, flist, thumbsize, fullsize, widthnum, title = argv

print "script is: ", script
print "file list is: ", flist
print "thumb size is: ", thumbsize
print "full size is: ", fullsize
print "row width is: ", widthnum
print "title is: ", title

outfile = thumbsize + ".html"
infile = flist
imgsrcpre = '"><img src="' + thumbsize + '/'
rowwidth = int(widthnum)
# f = open('workfile1', 'w')
f = open(outfile, 'w')
ifile = open(infile, 'r')
#   not needed print ifile.read()

myList = [q for q in ifile.readlines()]


# myList=['GEO_7918.jpg' , 'GEO_7920.jpg' , 'GEO_7921.jpg' , 'GEO_7923.jpg' , 'GEO_7926.jpg' , 'GEO_7928.jpg' , 'GEO_7929.jpg']

## p = re.compile( './')
# top = '<html><head><title>Graduate Commencement 2014</title></head><body><table><tr><td colspan=5><H3 align="center">Graduate Commencement 2014</H3></td></tr><tr><td colspan=4></td><td><H5 align="center"><a href="http://dev.pcom.edu/pcomweb/marcwe/grad_hooding_2014/grad_hooding_2014.html"></a></H5></td></tr><tr>'

top = '<html><head><title>' + title + '</title></head><body><p align="center"><H3 align="center">' + title + '</H3></p>'
hoodselect = '<p><H4 style = "text-align:right;margin-right:100px;"><a href="thumb15.html">Graduation Images</a></H4></p><p><H5 style = "margin-left:60px;"><a href="thumb-hood10.html">Very Small</a> &nbsp;<a href="thumb-hood15.html">Small</a>  &nbsp;<a href="thumb-hood20.html">Medium</a>  &nbsp;<a href="thumb-hood30.html">Large</a></H5></p>'
commselect = '<p><H4 style = "text-align:right;margin-right:100px;"><a href="thumb-hood20.html">Hooding Images</a></H4></p><p><H5 style = "margin-left:60px;"><a href="thumb10.html">Small</a> &nbsp;<a href="thumb15.html">Medium</a>  &nbsp;<a href="thumb20.html">Large</a></H5></p>'

f.write(top)
if len(thumbsize) == 12:
    f.write(hoodselect)
else:
    f.write(commselect)

i = 0
while i < len(myList):
    print myList[i]
##   p.sub( '', myList[i])

    fil = myList[i]
    f.write ('<td><a href="' + fullsize + '/')
    f.write (fil)
#    f.write ('"><img src="thumb15/')
    f.write (imgsrcpre)
    f.write (fil)
    f.write ('" alt="')
    f.write (fil)
    f.write ('" /></a></td>')
    f.write ('\n')
#    if (i+1)%3==0: f.write ('</tr><tr>\n')
    if (i+1)%rowwidth==0: f.write ('</tr><tr>\n')
    i = i + 1
f.closed
ifile.closed
