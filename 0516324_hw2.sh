#!/bin/sh
curl_cse(){
	curl 'https://timetable.nctu.edu.tw/?r=main/get_cos_list' --data  'm_acy=107&m_sem=1&m_degree=3&m_dep_id=17&m_group=**&m_grade=**&m_class=**&m_option=**&m_crsname=**&m_teaname=**&m_cos_id=**&m_cos_code=**&m_crstime=**&m_crsoutline=**&m_costype=**' | awk '{num=split($0, arr, /["]/);}END{printf("_"); for(i=1; i<=num; i++){if(arr[i]=="cos_time"){printf("%s.", arr[i+2])}if(arr[i]=="cos_ename")printf("%s_", arr[i+2])}}' > coursetmp.txt
}
form_cse(){
	cat coursetmp.txt | awk '{count = split($0, brr, /_/)}END{for(i=0; i<=count; i++){gsub(/ /, ".", brr[i]);printf("%s\n", brr[i])}}' > course.txt
	sh 0516324_hw2_showtable.sh
}

curl_cse
form_cse
