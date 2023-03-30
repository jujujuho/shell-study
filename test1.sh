#!/bin/bash

PS3="ENTER NUMER ="
	
list=(Add Sub Exit)

select cal in ${list[*]}
do


	case $cal in
			Add) read -p "First number= " num1
				read -p "Second num: " num2
					echo "$num1 + $num2 = $(($num1 + $num2))";;

			Sub) read -p "First Number = " num1
				read -p "Second num: " num2
					echo "$num1 - $num2 = $(($num1 - $num2))";;
			Exit) break;;
	esac
	REPLY=
done
