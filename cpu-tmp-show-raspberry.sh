#!/bin/bash

#       Show raspberry cpu tempreture

PATH=/home/pi/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games:/home/pi/bin/sys-tool

export PATH

#watch -n 1 cat /sys/class/thermal/thermal_zone0/temp
# Default reflesh every 1 second

watch -n 1 /opt/vc/bin/vcgencmd measure_temp
