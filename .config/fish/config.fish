set fish_greeting

# prevent nested ranger instances
# https://wiki.archlinux.org/index.php/Ranger
function ranger
	if [ -z "$RANGER_LEVEL" ]
		/usr/bin/ranger "$argv"
	else
		exit
	end
end
