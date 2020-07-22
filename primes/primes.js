const fs = require(`fs`);
const verbose = true;
console.log(2);
var i=3;
var primes = [2];
while (true) {
	if (i % 100000 == 0) {
                fs.writeFileSync(`./primes.txt`, primes.join(`, `));
		verbose ? console.log(`saved`) : null;
        }
	if (isPrime(i)) {
		verbose ? console.log(i) : null;
		primes.push(i);
	}
	i++;
}

function isPrime(p) {
	for (j=2;j<p/2;j += 2) {
		if (p % j == 0) return false;
	}
	return true;
}
