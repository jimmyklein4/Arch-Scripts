#!/bin/bash
# For when you have two batteries in your computer
# Combines most entries for both batteries into one so you can get a more accurate readout 
# Make sure to create the folder ~/.BATT_TOTAL

while true
do
paste /sys/class/power_supply/BAT0/uevent /sys/class/power_supply/BAT1/uevent | awk '{split($0,a,"="); split(a[2],b," "); (a[3] == "Charging" || b[1] == "Charging") ? $5 = "Charging" : $5 = (a[3] + b[1])/2; print a[1] "=" $5}' > .BAT_TOTAL/uevent
paste /sys/class/power_supply/BAT0/energy_full_design /sys/class/power_supply/BAT1/energy_full_design | awk '{split($0,a," "); print a[1]+a[2]}' > .BAT_TOTAL/energy_full_design
paste /sys/class/power_supply/BAT0/energy_now /sys/class/power_supply/BAT1/energy_now | awk '{split($0,a," "); print a[1]+a[2]}' > .BAT_TOTAL/energy_now
paste /sys/class/power_supply/BAT0/energy_now /sys/class/power_supply/BAT1/energy_now | awk '{split($0,a," "); print a[1]+a[2]}' > .BAT_TOTAL/energy_now
paste /sys/class/power_supply/BAT0/energy_full /sys/class/power_supply/BAT1/energy_full | awk '{split($0,a," "); print a[1]+a[2]}' > .BAT_TOTAL/energy_full
paste /sys/class/power_supply/BAT0/power_now /sys/class/power_supply/BAT1/power_now | awk '{split($0,a," "); print a[1]+a[2]}' > .BAT_TOTAL/power_now
paste /sys/class/power_supply/BAT1/status > .BAT_TOTAL/status

sleep 20
done 
