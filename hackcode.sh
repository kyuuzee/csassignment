#!/bin/bash

set -f

LIST1="A B C D E F G H I J K L M N O P Q R S T U V W X Y Z"
LIST2="A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z ~ ! @ # $ % ^ & * ( ) _ - + = [ ] { } \ | ; : ' < > . , / ? 0 1 2 3 4 5 6 7 8 9"
LIST3="A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z ~ ! @ # $ % ^ & * ( ) _ - + = [ ] { } \ | ; : ' < > . , / ? 0 1 2 3 4 5 6 7 8 9"
LIST4="A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z ~ ! @ # $ % ^ & * ( ) _ - + = [ ] { } \ | ; : ' < > . , / ? 0 1 2 3 4 5 6 7 8 9"
LIST5="~ @ # $ % ^ * _ + - = { } [ ] ? ; :"

hash=`cat hackcode.txt`

pass=`echo $hash | cut -d "$" -f7 | cut -d ";" -f1`

salt=`echo $hash | cut -d "$" -f6 | cut -d ";" -f1`

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
	   echo -n "$i$j$k$l$m"
	   
  test=`mkpasswd -m sha-256 $i$j$k$l$m -s $salt | cut -d "$" -f4`
		echo ""

		if [ $test == $pass ]; then
			echo "Extracted salt value is: $salt"
			echo "Password is: $i$j$k$l$m"
			exit
		fi
		     done
		done
	   done
	done
done
