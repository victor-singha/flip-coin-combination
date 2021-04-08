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
declare -A occurence
declare -A percentage
occurence=([H]=0 [T]=0)
for((i=1;i<=100;i++))
do
	res=$(singlet)
	echo $res
	occurence[$res]=$((${occurence[$res]}+1))
done
echo ${occurence[@]}
percentage[H]=$((${occurence[H]}/50*100))
percentage[T]=$((${occurence[T]}/50*100))
echo ${percentage[@]}
