#!/bin/sh
ls -RAl | sort -rnk5 | awk '{if(/^d/)dn+=1} {if(/^-/){fn+=1;fs+=$5;if(fn<=5)print fn ":" $5 " " $9}} END{print "Dir num: " (dn?dn:0) "\nFile num: " (fn?fn:0) "\nTotal: " (fs?fs:0)}'
