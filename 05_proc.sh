cur=1
mode="+"
#echo $mode > num

tail -f num |
while true; do
	read line
	case $line in
		"+")
			mode="$line"
			echo "sum"
		;;
		"*")
			mode="$line"
			echo "mult"
		;;
		"QUIT")
		    	echo "quit"
	 		killall tail
			exit 0
		;;
		[0-9]*)
			case $mode in
				"+")
					cur=$(echo "${cur} + ${line}" | bc)
					echo $cur
				;;
				"*")
					cur=$(echo "${cur} * ${line}" | bc)
					echo $cur
				;;
			esac
		;;
		*)
			echo "Illegal option."
			killall tail
			exit 1
		;;		

	esac
done
