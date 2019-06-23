#!/bin/bash

g_file='./gallery.html'

root_dir=Photo_Slideshow_Originals
final_dir=Photo_Slideshow

dir1=Research
dir2=Antarctic_1819
dir3=MtBaker
dir4=Antarctic_1415

watermark_flag=0
sizethresh=1000000
density=1000

# ------------------------------------------------------------------------------------------------

files=$(find ../"$final_dir"/"$dir1"/ -maxdepth 1 -name '*.[jJ][pP][gG]')
outfile=./"$final_dir"/CaptionInit_"$dir1".txt
echo "" > $outfile
for f in $files
do
	f1 = ${awk -F "/" '{print $2} $f}
	echo $f1 >> $outfile
done
echo "Completed $dir1" 

files=$(find ../"$final_dir"/"$dir2"/ -maxdepth 1 -name '*.[jJ][pP][gG]')
outfile=./"$final_dir"/CaptionInit_"$dir2".txt
echo "" > $outfile
for f in $files
do
	f1 = ${awk -F "/" '{print $2} $f}
	echo $f1 >> $outfile
done
echo "Completed $dir2" 

files=$(find ../"$final_dir"/"$dir3"/ -maxdepth 1 -name '*.[jJ][pP][gG]')
outfile=./"$final_dir"/CaptionInit_"$dir3".txt
echo "" > $outfile
for f in $files
do
	f1 = ${awk -F "/" '{print $2} $f}
	echo $f1 >> $outfile
done
echo "Completed $dir3" 

files=$(find ../"$final_dir"/"$dir4"/ -maxdepth 1 -name '*.[jJ][pP][gG]')
outfile=./"$final_dir"/CaptionInit_"$dir4".txt
echo "" > $outfile
for f in $files
do
	f1 = ${awk -F "/" '{print $2} $f}
	echo $f1 >> $outfile
done
echo "Completed $dir4" 


