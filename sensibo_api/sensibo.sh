if [ "$1" = "-k" -o "$1" = "--key" ]
then
	shift
	API_KEY="$1"
else
	API_KEY=""
fi

echo "Loading…"

DEVICES=$(curl -X GET "https://home.sensibo.com/api/v2/users/me/pods?fields=id,room&apiKey=$API_KEY" 2>/dev/null)
DEVICE_IDS=($(echo $DEVICES | egrep -o '"id": ".{8}"' | sed "s/\"id\": \"//g;s/\"//g"))
DEVICE_NAMES=$(echo $DEVICES | egrep -o '"name": "[a-zA-Z0-9 ]*"' | sed 's/"name": "//g;s/"//g' | awk '{printf("(%1d) %s\n", NR, $0)}' )


echo -e "Which device?\n$DEVICE_NAMES"
printf ": "
read SELECTION

SELECTION=$(expr $SELECTION - 1)
SELECTED_ID=${DEVICE_IDS[$SELECTION]}

echo "Device ID: $SELECTED_ID"

echo "Turn on or off?"
printf "on/off: "
read STATE

if [ $STATE = "on" ]
then
	curl -X POST "https://home.sensibo.com/api/v2/pods/$SELECTED_ID/acStates?apiKey=$API_KEY" -d '{"acState":{"on":true}}' &>/dev/null
else
	curl -X POST "https://home.sensibo.com/api/v2/pods/$SELECTED_ID/acStates?apiKey=$API_KEY" -d '{"acState":{"on":false}}' &>/dev/null
fi
