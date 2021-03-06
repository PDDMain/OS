cur=1
mode="+"

s() {
	echo "quit"
	exit 0
}

u1() {
	mode="+"
}

u2() {
	mode="*"
}

trap 's' SIGTERM
trap 'u1' USR1
trap 'u2' USR2

while true; do
	case "$mode" in
		"+")
			cur=$(echo "${cur} + 2" | bc)
		;;
		"*")
			cur=$(echo "${cur} * 2" | bc)
		;;
	esac
	echo $cur
	sleep 1
done
