set airPortDevice to do shell script "networksetup -listallhardwareports | awk '{if($3==\"Wi-Fi\"){getline;print}}' | awk '{print $2}'"
set airPortPower to do shell script "networksetup -getairportpower " & airPortDevice & " | awk '{print $4}'"

if airPortPower is equal to "on" then
	toggleWifi(airPortDevice, "off")
	statusWifi(airPortDevice, "off")
else if airPortPower is equal to "off" then
	toggleWifi(airPortDevice, "on")
	statusWifi(airPortDevice, "on")
end if

on toggleWifi(device, value)
	do shell script "networksetup -setairportpower " & device & " " & value
end toggleWifi

on statusWifi(device, value)
	display notification device & " is " & value with title "Wi-Fi"
end statusWifi

