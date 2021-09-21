#!/bin/bash

if [[ -z "$1" ]]; then
	echo -e "Usage:\n\to: output\n\t\ts: speakers\n\t\th: headphones)";
fi

if [ "$1" == "o" ]; then
	if [ -z "$2" ]; then
		echo -e "Missing Parameter\n\th: headphones\n\ts: speakers";
        else
		if [ "$2" == "h" ]; then
			echo -e "Setting headphone output"
			amixer -c 0 sset 'Output Select' 'Headphone'
		elif [ "$2" == "s" ]; then
			echo -e "Setting speaker output"
			amixer -c 0 sset 'Output Select' 'Speakers'
		else
			echo -e "Unknown output type.\n\th: headphones\n\ts: speakers"
		fi
	fi
fi
