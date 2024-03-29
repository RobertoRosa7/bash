#!/bin/bash

declare -r STEPS=('step1', 'step2', 'step3', 'step4')
declare -r MAX_STEPS=${#STEPS[@]}
declare -r BAR_SIZE="##########"
declare -r MAX_BAR_SIZE=${#BAR_SIZE}

tput civis -- invisible

for step in "${!STEPS[@]}"; do
	perc=$(((step + 1) * 100 / MAX_STEPS))
	percBar=$((perc * MAX_BAR_SIZE / 100))

	sleep 1


	echo -ne "\\r[${BAR_SIZE:0:percBar}] $perc %"
done
echo ""
tput cnorm -- normal

