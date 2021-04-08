#! /bin/bash
result=$((RANDOM%2))
if [ $result -eq 0 ]
then
	echo "head"
else
	echo "tail"
fi
