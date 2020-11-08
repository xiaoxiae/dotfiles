set fish_greeting

# prevent nested ranger instances
# https://wiki.archlinux.org/index.php/Ranger
function r
	if [ -z "$RANGER_LEVEL" ]
		/usr/bin/ranger "$argv"
	else
		exit
	end
end

set BROWSER /usr/bin/qutebrowser
set EDITOR /usr/bin/vim

fish_ssh_agent

# for neomutt
export ESCDELAY=0
