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

function triplet(){
	res1=$((RANDOM%2))
	res2=$((RANDOM%2))
	res3=$((RANDOM%2))
	if [ $res1 -eq 0 -a $res2 -eq 0 -a $res3 -eq 0 ]
	then
		echo "HHH"
	elif [ $res1 -eq 0 -a $res2 -eq 0 -a $res3 -eq 1 ]
	then
		echo "HHT"
	elif [ $res1 -eq 0 -a $res2 -eq 1 -a $res3 -eq 0 ]
	then
		echo "HTH"
	elif [ $res1 -eq 0 -a $res2 -eq 1 -a $res3 -eq 1 ]
	then
		echo "HTT"
	elif [ $res1 -eq 1 -a $res2 -eq 0 -a $res3 -eq 0 ]
	then
		echo "THH"
	elif [ $res1 -eq 1 -a $res2 -eq 0 -a $res3 -eq 1 ]
	then
		echo "THT"
	elif [ $res1 -eq 1 -a $res2 -eq 1 -a $res3 -eq 0 ]
	then
		echo "TTH"
	else
		echo "TTT"
	fi
}

declare -A occurence
declare -A percentage
occurence=([H]=0 [T]=0 [HH]=0 [HT]=0 [TH]=0 [TT]=0 [HHH]=0 [HHT]=0 [HTH]=0 [HTT]=0 [THH]=0 [THT]=0 [TTH]=0 [TTT]=0)
flips=100
for((flip=1;flip<=flips;flip++))
do
	echo "Please Wait."
	res_singlet=$(singlet)
	res_doublet=$(doublet)
	res_triplet=$(triplet)
	occurence[$res_singlet]=$((${occurence[$res_singlet]}+1))
	occurence[$res_doublet]=$((${occurence[$res_doublet]}+1))
	occurence[$res_triplet]=$((${occurence[$res_triplet]}+1))
done
echo "----------------"
index=0
declare -a array
for key in ${!occurence[@]}
do
	percentage[$key]=$((${occurence[$key]}/flips*100))
	echo $key ":" ${occurence[$key]}"/"$flips
	array[$index]=${occurence[$key]}
	index=$((index+1))
done
n=${#array[@]}
temp=0
for ((i=0;i<$n;i++))
do
	for ((j=1;j<$((n-i));j++))
	do
		if [ ${array[$((j-1))]} -gt ${array[$j]} ]
		then
			temp=${array[$((j-1))]}
			array[$((j-1))]=${array[$j]}
			array[$j]=$temp
		fi
	done
done
#echo "SORTED ARRAY: "${array[@]}
largest=${array[$((n-1))]}
smallest=${array[0]}
for k in ${!occurence[@]}
do
	if [ ${occurence[$k]} -eq $smallest ]
	then
		echo "Lowest Combination: "$k "Count: "${occurence[$k]}
	fi
	if [ ${occurence[$k]} -eq $largest ]
	then
		echo "Winning Combination: "$k "Count: "${occurence[$k]}
	fi
done
