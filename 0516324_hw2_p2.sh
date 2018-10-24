#!/bin/sh

add_cse(){
a=""
i=0
cat course.txt | while read line;
do
	i=$((i+1))
	a="${a} $line"
	if [ $i -eq 132 ]; then
		tag="$(dialog --stdout --clear --begin 1 1 --no-items --title "course" --menu "Add course" 50 100 16 $a)"
		status=$?
		if [ $status -eq 0 ] ; then
			echo $tag
		elif [ $status -eq 1 ] ; then
			
		fi
	fi
done >> coursetable.txt
	course_collision
}
course_collision(){
cat coursetable.txt | awk '{num=split($0, arr)}END{
	fileccollision=0
	flagj=0
	flagi=0
	for(i=1; i<=num; i++){
	    for(j=1; j<=length(arr[i]); j++){
	    	stri=substr(arr[i], j, 1)
	    	if(stri~/[1-7]/){
		    for(k=1; k<=length(arr[i]); k++){
	    		str=substr(arr[i], j+k, 1)
	    		if(str~/[A-Z]/){
	    		    if(c[stri, str]==1){
	    			filecollision=1
	    			flagj=1
	    			flagi=1	
	    			break
	    		    }
	    		    else{
	    			c[stri, str]=1
	    			filecollision=0
	    		    }
	    		}
	    		else if(str=="-"){
	    		    for(;k<=length(arr[i]);k++){
	    			if(substr(arr[i], j+k, 1)=="."){
	    			    flagj=1
				    k=length(arr[i])
	    			    break
	    			}	
	    			else if(substr(a[i], j+k, 1)==","){
	    			    j=j+k
				    k=length(arr[i])
	    			    break
	    			}
	    		    }
	    		}
			else if(str~/[1-7]/){
				j=j+k-1
				break
			}
	    				
	    	    }
            
	        }
		if(flagj==1){
			flagj=0
			break
	    	}
	    }
	    if(flagi==1){
		flagi=0
		break
	    }
	}
    for(l=1;l<num;l++){
    	printf("%s ", arr[l])
    }
    if(filecollision==0){
    	printf("%s ", arr[num])
    }
     
}' > table_replace.txt
    if  diff -q -b -B coursetable.txt table_replace.txt ; then
	cp table_replace.txt coursetable.txt
	#cat table_replace.txt
	while read line;
	do
	    if [ $line -eq 0 ]; then
		    sh 0516324_hw2_showtable.sh
	    else
		    sh 0516324_hw2_details.sh
	    fi
	done < mode.txt
    else
	cp table_replace.txt coursetable.txt
        dialog --title "collision" --msgbox "class collision" 10 20
	add_cse
    fi
}
add_cse
