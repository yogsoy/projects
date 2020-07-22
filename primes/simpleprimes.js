var i=1;
while (true) {
	if (isPrime(i)) {
		console.log(i);
	}
	i++;
}

function isPrime(p) {
	for (j=2;j<p/2+1;j++) {
		if (p % j == 0) return false;
	}
	return true;
}
