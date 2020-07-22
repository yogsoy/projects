WORDS="$(cat words.txt)"

while [[ 1 = 1 ]]; do
	if [ "$1" = "" ]; then
		printf "Find anagrams of: "
		read INPUT
	else
		INPUT="$1"
	fi

	echo "Generating permutations..." 1>&2

	TIME_BEFORE="$(date +%s%N)"

	PERMS=$(echo "$INPUT" | sed 's/ //g' | awk -f permute.awk | sort | uniq)

	printf "$(echo "$PERMS" | wc -l | numfmt --g) permutations generated in $(echo "scale=2; $[$(date +%s%N) - $TIME_BEFORE]/1000000000" | bc) seconds.\n" 1>&2

	echo "Checking dictionary..." 1>&2

	echo -e "$WORDS\n$PERMS" | sort | uniq -id
done
