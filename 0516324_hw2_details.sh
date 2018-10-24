#!/bin/sh 

details(){
	cat coursetable.txt | awk '{num=split($0, arr)}END{
	flagi=0
	flagj=0
	for(i=1; i<=num; i++){
	    flagj=0
	    for(j=1; j<=length(arr[i]); j++){
	        dash=substr(arr[i], j, 1)
	      	if(dash=="-"){
	      	    for(k=1; k<=length(arr[i]); k++){
	       	        dot=substr(arr[i], j+k, 1)
	      	     	classroom=classroom "" dot;
	       	     	if(dot=="."){
	       	    	    class=substr(arr[i],j+k+1,length(arr[i])-j-k)
	       	    	    class=class
	       	            flagj=1
	       	    	    break
	       	    	}
	       	    	else if(dot==","){
	       	    	    for(;k<=length(arr[i]); k++){
	       	    	        if(substr(arr[i],j+k,1)=="-"){
	       	    			break
	       	     		}
	       	    	    }
	       	    	}
	       	    }
                                
	       	}
	       	if(flagj==1){
	       	    flagj==0
	       	    break
		}
	    
	    }
    	    flagj=0
    	    for(j=1; j<=length(arr[i]);j++){
	        stri=substr(arr[i], j, 1)
	      	if(stri~/[1-7]/){
	      	    for(k=1; k<=length(arr[i]); k++){
	      	        str=substr(arr[i], j+k, 1)
	      		if(str~/[A-Z]/){
	      		    c[stri,str]=class
	      		    f[stri,str]=1
	      		    count[stri, str]=int(length(class)/13)+1
	      		}
	      	        else if(str=="-"){
	      		    for(;k<=length(arr[i]);k++){
	      		        if(substr(arr[i],j+k,1)=="."){
	      			    flagj=1
	      			    k=length(arr[i])
	      			    break
	      			}
	      		        else if(substr(arr[i],j+k,1)==","){
	      			    j=j+k
	      			    k=length(arr[i])
	      			    break
	     			}
	       		    }
	    		
	    		}
	      		else if(str~/[1-7]/){
	     		    stri=str
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
	t[1]="M"
	t[2]="N"
	t[3]="A"
	t[4]="B"
	t[5]="C"
	t[6]="D"
	t[7]="X"
	t[8]="E"
	t[9]="F"
	t[10]="G"
	t[11]="H"
	t[12]="Y"
	t[13]="I"
	t[14]="J"
	t[15]="K"
	d[1]="1"
	d[2]="2"
	d[3]="3"
	d[4]="4"
	d[5]="5"
	d[6]="6"
	d[7]="7"
	printf("x  .Mon            .Tue            .Wed            .Thu            .Fri            .Sat            .Sun\n")
	for(i=1; i<=15;i++){
	    printf("%s  |", t[i])
	    for(j=1; j<=7; j++){
	        if(f[d[j],t[i]]==1){
		    cnt=0
		    for(k=1; k<=13 && k<=length(c[d[j], t[i]]);k++){
		        printf("%s", substr(c[d[j],t[i]], k, 1))
		        cnt++
		    }
		    for(k=1; k<=13-cnt; k++){
		        printf(" ")
		    }
	    	    printf("  |")
		}
	        else{
		    printf("x.             |")
		}
	    }
	    printf("\n.  |")
	    for(j=1; j<=7; j++){
	        cnt=0
		if(count[d[j],t[i]]>=2){
		    for(k=14; k<=26 && k<=length(c[d[j], t[i]]);k++){
		        cnt++
		        printf("%s", substr(c[d[j],t[i]], k, 1))
		    }
		}
		else{
		   cnt=1
		   printf(".")
		}
		for(k=1; k<=15-cnt; k++){
		   printf(" ")
		}
		printf("|")
	    }
    	    printf("\n.  |")
	    for(j=1; j<=7; j++){
	        cnt=0
		if(count[d[j],t[i]]>=3){
		    for(k=27; k<=39 && k<=length(c[d[j],t[i]]); k++){
		        cnt++
			printf("%s",substr(c[d[j],t[i]],k,1))
		    }
		}
		else{
		    cnt=1
		    printf(".")
		}
	        for(k=1;k<=15-cnt;k++){
		    printf(" ")
		}
		printf("|")
	    }
    	    printf("\n.  |")
	    for(j=1; j<=7; j++){
	        cnt=0
		if(count[d[j],t[i]]>=4){
		    for(k=40; k<=52 && k<=length(c[d[j],t[i]]);k++){
		        cnt++
			printf("%s", substr(c[d[j],t[i]],k,1))
		    }
		}
		else{
		    cnt=1
		    printf(".")
		}
	        for(k=1;k<=15-cnt;k++){
		    printf(" ")
		}
		printf("|")
	    }
    	    printf("\n.  |")
	    for(j=1;j<=7;j++){
	        cnt=0
		if(count[d[j],t[i]]>=5){
		    for(k=53; k<=65 && k<=length(c[d[j],t[i]]);k++){
		        cnt++
			printf("%s", substr(c[d[j],t[i]], k, 1))
		    }
		}
		else{
		    cnt=1
		    printf(".")
		}
	        for(k=1;k<=15-cnt;k++){
		    printf(" ")
		}
		printf("|")
	    }
    	    printf("\n")
	    printf("=  ==============  ==============  ==============  ==============  ==============  ==============  ==============\n")
    }

}' > showtable.txt
dialog  --title  "table22" --ok-label "Add course"  --extra-button --extra-label "Option" --help-button --help-label "Exit" --textbox showtable.txt 100 100
status=$?
#case $status in
#	0) sh 0516324_hw2_p2.sh;;
#	3) echo "0" > mode.txt;;
#	2);;
#esac	
if [ $status -eq 0 ]; then
	sh 0516324_hw2_p2.sh
elif [ $status -eq 3 ]; then
	echo "0" > mode.txt
	sh 0516324_hw2_showtable.sh
else
fi

}
details
