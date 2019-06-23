#!/bin/bash


################ Here is the file name it will ultimately write to
outdir='./_sections2'



for i in $(seq 1 4)
do

if [ $i -eq 1 ]
then
dir1=Research
t1='General Research'
section1='A sampling of photos from the field'
o1='1'
fi

if [ $i -eq 2 ]
then
dir1=Antarctic_1819
t1='Antarctica 2018/19'
section1='Austral summer 2018/19, field work at Hercules Dome, West Antarctica.'
o1='2'
fi

if [ $i -eq 3 ]
then
dir1=MtBaker
t1='Mt. Baker'
section1='Work on Coleman and Roosevelt Glaciers'
o1='3'
fi

if [ $i -eq 4 ]
then
dir1=Antarctic_1415
t1='Antarctica 2014/15'
section1='Austral summer 2014/15, field work at WAIS Divide, West Antarctica.'
o1='4'
fi

# ------------------------------------------------------------------------------------------------

#files=$(find ./Photo_Slideshow/"$dir1"/ -maxdepth 1 -name '*.[jJ][pP][gG]')

capfile=../Photo_Slideshow/Caption_"$dir1".txt
files=$(awk -F'[\t]' '{print $1}' < $capfile)
rows=$(wc -l < $capfile)
b1=$(expr $rows / 3)
b1=$(expr $b1)
b2=$(expr $b1 \* 2)
echo $rows
echo $b1
echo $b2
    
	
	
	
echo "---" > "$outdir"/fillfile.txt	
echo "title: $t1" >> "$outdir"/fillfile.txt	
echo "icon: fa-th" >> "$outdir"/fillfile.txt	
echo "order: $o1" >> "$outdir"/fillfile.txt
echo "---" >> "$outdir"/fillfile.txt	
echo " " >> "$outdir"/fillfile.txt	
echo "<p> $section1 </p>" >> "$outdir"/fillfile.txt	
echo "<div class=\"row\">" >> "$outdir"/fillfile.txt	
echo "<div class=\"4u 12u\$(mobile)\">" >> "$outdir"/fillfile.txt	
  
    	
counter=0
for f in $files
do
		if [ $counter -eq $b1 ]
		then
			echo "  </div>" >> "$outdir"/fillfile.txt
			echo "		<div class=\"4u 12u\$(mobile)\">" >> "$outdir"/fillfile.txt

		fi
		if [ $counter -eq $b2 ]
		then
			echo "  </div>" >> "$outdir"/fillfile.txt
			echo "		<div class=\"4u 12u\$(mobile)\">" >> "$outdir"/fillfile.txt

		fi		

		f2=$(echo $f | awk -F "/" '{print $3}');
		f3=$(echo $f | awk -F "/" '{print $4}');
		caption=$(grep -n "$f" $capfile | awk -F'[\t]' '{print $4}')
		echo $caption
		
		echo "		<div class=\"item\">" >> "$outdir"/fillfile.txt
		echo "			<a href=\"#\" class=\"image fit\"><img src=\"https://githubdatafiles.s3.amazonaws.com/Photos/$f2/$f3\" /></a>" >> "$outdir"/fillfile.txt
		echo "			<header>" >> "$outdir"/fillfile.txt
		echo "				<h3> $caption </h3>" >> "$outdir"/fillfile.txt
		echo "			</header>" >> "$outdir"/fillfile.txt
		echo "		</div>" >> "$outdir"/fillfile.txt
		counter=$((counter+1))
done

echo "</div>" >> "$outdir"/fillfile.txt
echo "</div>" >> "$outdir"/fillfile.txt

cat $outdir"/fillfile.txt"> "$outdir"/"$dir1".html

rm "$outdir"/fillfile*

done