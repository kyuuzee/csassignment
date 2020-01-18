#!/bin/bash
set -f

# LIST are the list of characters to try
LIST1="A B C"
LIST2="a b c"
LIST3="@ # $ ="
LIST4="e 0 1 2"
LIST5="* _ ? %"

hash=`cat hashtest.txt`

pass=`echo $hash | cut -d "$" -f4| cut -d ";" -f1`

salt=`echo $hash | cut -d "$" -f3| cut -d ";" -f1`


for i in $LIST1
  do
   for j in $LIST2
    do
	for k in $LIST3
	 do
	      for l in $LIST4
	       do
		    for m in $LIST5
		     do
	   echo -n "$i$j$k$l$m "
	   
  test=`mkpasswd -m md5 $i$j$k$l$m -s $salt | cut -d "$" -f4`
		echo ""

		if [ $test == $pass ] ; then
			echo "Extrated salt value is: $salt"
			echo "Password is: $i$j$k$l$m"
			exit
		fi
		     done
		   done
	   done
	done
done
