PARTS=$(sed '/^#/d;/^$/d;' < ~/Documents/testing/projects/toktik/parts)
printf "$(shuf -n 2 -r -e $PARTS | tr -d '\n')"
