#!/bin/zsh

# Script to convert frequence to lambda according to 
# v_p = frac 1 {\sqrt{\mu\epsilon}} = \lambda f
# $1 frequrncy in GHz unit
# $2 \epsilon_r default by 1
#
digits=3;

if [  -z "$1"  ]
then
	echo 'Use ' $0 'frequency \\epsilon_r'
	exit 1
elif [ $(echo "$1 <= 0" | bc) = 1 ]
then
	echo 'frequency must greater than zero.'
	exit 1
elif [ -n "$2" ] && [ $(echo "$2 <= 0" | bc) = 1 ]
then
	echo '\\epsilon_r must greater than zero.'
	exit 1
fi

freq=$1;


c=3*10^8

# lambda in free space
lambda=$(echo "scale=$digits; $c / ($freq*10^9) * 10^3 " | bc)
echo "lambda = $lambda mm"

# lambda in substrate
if [ -n "$2" ]
then
	eps_r=$2
else
	eps_r=1
fi
if [ -n "$2" ]
then
	lambda=$(echo "scale=$digits; $c / ($freq*10^9) * 10^3 / sqrt($eps_r)" | bc)
	echo "lambda in substrate = $lambda mm"
fi
