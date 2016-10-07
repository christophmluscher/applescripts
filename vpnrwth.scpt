tell application "System Events"
	tell current location of network preferences
		set VPNservice to service "VPNRWTH"
		if VPNservice exists then
			if current configuration of VPNservice is not connected then
				connect VPNservice
				repeat while (current configuration of VPNservice is not connected)
					delay 1
				end repeat
				display notification "is ON" with title "VPN RWTH"
			else if current configuration of VPNservice is connected then
				disconnect VPNservice
				display notification "is OFF" with title "VPN RWTH"
			end if
		end if
	end tell
end tell
