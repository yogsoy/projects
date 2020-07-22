#!/bin/bash

# get page
#curl https://en.wiktionary.org/wiki/$1 > input.html

# get the bit we're looking for
#cat input.html | grep -m 1 -i \<p > output.html

# clean out the html tags
#cat output.html | sed -r "s/(<[^>]*>)|(&#[0-9]*)//g"

# function

function etymology () {
	curl https://en.wiktionary.org/wiki/$1 2>/dev/null | grep -m 1 -i \<p | sed -r "s/(<[^>]*>)|(&#[0-9]*)//g"
}
