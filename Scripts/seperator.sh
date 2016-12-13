a=$(seq -s, 715 -50 1)
for i in $(echo $a | sed "s/,/ /g"); do
	START_ID=$(($i-49))
	if [ $START_ID -lt 0 ]
	then
	  START_ID=1
	fi
	bash Scripts/station201501_201610_par.sh $START_ID $i &
done
wait


