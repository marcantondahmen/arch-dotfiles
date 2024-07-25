#!/usr/bin/env bash

# Taken from https://github.com/ericmurphyxyz/rofi-wifi-menu

# Get a list of available wifi connections and morph it into a nice-looking list
networks=$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed 's/  */ /g' | sed -E "s/WPA*.?\S/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d")

connected=$(nmcli --fields WIFI g)
if [[ "$connected" =~ "enabled" ]]; then
	toggle="󰖪  Disable Wi-Fi"
elif [[ "$connected" =~ "disabled" ]]; then
	toggle="󰖩  Enable Wi-Fi"
fi

connectNew() {
	fullSelection="$1"
	id="$2"

	if [[ "$fullSelection" =~ "" ]]; then
		password=$(rofi -dmenu -p "Password: ")
	fi

	successMessage="You are now connected to the Wi-Fi network \"$id\"."
	nmcli device wifi connect "$id" password "$password" | grep "successfully" && notify-send "Connection Established" "$successMessage"
}

# Use rofi to select wifi network
selected=$(echo -e "$toggle\n$networks" | uniq -u | rofi -dmenu -i -selected-row 1 -p "Wi-Fi SSID: ")
# Get name of connection
read -r selectedId <<<"${selected:3}"

if [ "$selected" = "" ]; then
	exit
elif [ "$selected" = "󰖩  Enable Wi-Fi" ]; then
	nmcli radio wifi on
elif [ "$selected" = "󰖪  Disable Wi-Fi" ]; then
	nmcli radio wifi off
else
	# Get saved connections
	savedConnections=$(nmcli -g NAME connection)
	if [[ $(echo "$savedConnections" | grep -w "$selectedId") = "$selectedId" ]]; then
		success=$(nmcli connection up id "$selectedId" | grep "successfully")

		if [[ -z $success ]]; then
			connectNew "$selected" "$selectedId"
		fi

	else
		connectNew "$selected" "$selectedId"
	fi
fi
