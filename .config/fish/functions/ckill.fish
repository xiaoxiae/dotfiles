function ckill
	ps -A h -o pid,ruser,%cpu,comm | fzf --tac | awk '{print $1}' | xargs kill -9
end
