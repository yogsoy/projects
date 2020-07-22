#/bin/bash

# download schedule page
curl https://gamesdonequick.com/schedule > schedule.html

# remove all html tags and leave contents
alias remtags="sed 's/<[^>]*>//g'"

# get all hosts
cat schedule.html | grep 'fa-microphone' | sed 's/<[^>]*>//g' | tail -n +2 > hosts.txt
echo 'Extracted hosts'

# get all start times
cat schedule.html | grep 'class="start-time' | sed 's/<[^>]*>//g' > start_times.txt
echo 'Extracted start times'

# get all games
cat schedule.html | grep -A 1 'class="start-time' | grep -v '<td ' | grep -v '\-\-' | sed 's/<[^>]*>//g' > games.txt
echo 'Extracted games'

# get all players
cat schedule.html | grep -A 2 'class="start' | grep -v '\-\-' | sed 's/<[^>]*>//g' | sed -n '0~3p' > players.txt
echo 'Extracted players'

# get all duration estimates
cat schedule.html | grep 'class="text-right' | sed 's/<[^>]*>//g' | sed s/\ //g > durations.txt
echo 'Extracted durations'

# get all setup times
cat schedule.html | grep 'visible-lg' | sed 's/<[^>]*>//g' | sed s/\ //g | tail -n +2 > setup_times.txt
echo 'Extracted setup times'

# get all platforms
cat schedule.html | grep -B 1 'fa-mic' | grep -v '<td><i' | grep -v '\-\-' | sed 's/<[^>]*>//g' | sed 's/^.*; //g' | tail -n +4 > platforms.txt
echo 'Extracted platforms'

# get all categories
cat schedule.html | grep -B 1 'fa-mic' | grep -v '<td><i' | grep -v '\-\-' | sed 's/<[^>]*>//g' | sed 's/ &.*$//g' | tail -n +2 > categories.txt
echo 'Extracted categories'
