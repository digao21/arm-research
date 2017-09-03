#/bin/bash
 
if [ $# -ne 1 ]
then
	echo "USAGE: `basename $0` OUTPUT_FILE"
	exit 1
fi
	 
myOutFile=$1
cpuFile=/sys/devices/platform/APMC0D29:00/hwmon/hwmon0/power1_input
ioFile=/sys/devices/platform/APMC0D29:00/hwmon/hwmon0/power2_input
	 
measuresPerSecond=4
delay=`echo "1 / $measuresPerSecond" | bc -l`
	 
echo "timestamp, cpu_power_uW, io_power_uW" > $myOutFile
	 
while true
do
	echo "`date +%s.%N`, `cat $cpuFile`, `cat $ioFile`" >> $myOutFile
	sleep ${delay}s
done
		 
exit 0
