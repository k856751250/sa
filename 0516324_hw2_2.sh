#!/bin/sh

if [ ! -f "mode.txt" ]; then
	echo "0" > mode.txt
fi
if [ ! -f "course.txt" ]; then
	sh 0516324_hw2.sh
else
	while read line;
	do
		echo $line
		if [ $line -eq 0 ]; then
			sh 0516324_hw2_showtable.sh
		else
			sh 0516324_hw2_details.sh
		fi
	done < mode.txt
fi

