const fs = require(`fs`);

var start_times = fs.readFileSync(`start_times.txt`,`utf8`).split(`\n`);
var games = fs.readFileSync(`games.txt`,`utf8`).split(`\n`);
var platforms = fs.readFileSync(`platforms.txt`,`utf8`).split(`\n`);
var categories = fs.readFileSync(`categories.txt`,`utf8`).split(`\n`);
var durations = fs.readFileSync(`durations.txt`,`utf8`).split(`\n`);
var players = fs.readFileSync(`players.txt`,`utf8`).split(`\n`);
var setup_times = fs.readFileSync(`setup_times.txt`,`utf8`).split(`\n`);
var hosts = fs.readFileSync(`hosts.txt`,`utf8`).split(`\n`);
console.log(`Loaded Data`);

var csv = `Start Time,Game,Players,Duration\n`;

//console.log(games)

// start time, game, duration, and players are 134 long
//console.log(start_times.length,games.length,platforms.length,categories.length,durations.length,players.length,setup_times.length,hosts.length)

for (var item = 0; item < games.length -1; item++) {
	//console.log(item);
	var line = `"`+start_times[item].replace(`T`,` `).replace(`Z`,``).slice(0,-3)+`","`+games[item]+`","`+players[item]+`","`+durations[item]+`"\n`;
	//console.log(item + `: ` + line.slice(0,-1));
	csv += line;
}
console.log(`Created CSV`);

fs.writeFileSync(`schedule.csv`,csv);
console.log(`Written CSV`);

console.log(`Done!`);
