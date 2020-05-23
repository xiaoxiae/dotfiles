function ckill
	ps -A h -o pid,ruser,%cpu,comm | fzf | awk '{print $1}' | xargs kill -9
end
