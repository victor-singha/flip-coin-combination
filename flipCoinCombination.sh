#! /bin/bash
function singlet(){
	result=$((RANDOM%2))
	if [ $result -eq 0 ]
	then
		echo "H"
	else
		echo "T"
	fi
}
function doublet(){
	res1=$((RANDOM%2))
	res2=$((RANDOM%2))
	if [ $res1 -eq 0 -a $res2 -eq 0 ]
	then
		echo "HH"
	elif [ $res1 -eq 0 -a $res2 -eq 1 ]
	then
		echo "HT"
	elif [ $res1 -eq 1 -a $res2 -eq 0 ]
	then
		echo "TH"
	else
		echo "TT"
	fi
}
declare -A occurence
declare -A percentage
occurence=([H]=0 [T]=0 [HH]=0 [HT]=0 [TH]=0 [TT]=0)
for((i=1;i<=100;i++))
do
	echo "Please Wait."
	res_singlet=$(singlet)
	res_doublet=$(doublet)
	occurence[$res_singlet]=$((${occurence[$res_singlet]}+1))
	occurence[$res_doublet]=$((${occurence[$res_doublet]}+1))
done
echo ${occurence[@]}
echo ${!occurence[@]}
for key in ${!occurence[@]}
do
	percentage[$key]=$((${occurence[$key]}/100*100))
done
