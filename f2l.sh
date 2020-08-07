#!/bin/zsh

# Script to convert frequence to lambda according to 
# v_p = frac 1 {\sqrt{\mu\epsilon}} = \lambda f
# $1 frequrncy in GHz unit
# $2 \epsilon_r default by 1

if [  -z "$1"  ]
then
	echo 'Use ' $0 'frequency \\epsilon_r'
	exit 1
elif [ $1 -le 0 ]
then
	echo 'frequency must greater than zero.'
elif [ -n "$2" ] && [ $2 -le 0 ]
then
	echo '\\epsilon_r must greater than zero.'
fi

freq=$1;


c=3*10^8

# lambda in free space
lambda=$(echo "scale=4; $c / ($freq*10^9) * 10^3 " | bc)
echo "lambda = $lambda mm"

# lambda in substrate
if [ -n "$2" ] && [ $2 -gt 0 ]
then
	eps_r=$2
else
	eps_r=1
fi
if [ -n "$2" ]
then
	lambda=$(echo "scale=4; $c / ($freq*10^9) * 10^3 / sqrt($eps_r)" | bc)
	echo "lambda in substrate = $lambda mm"
fi
