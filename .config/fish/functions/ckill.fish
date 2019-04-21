function ckill
	ps -A | fzf | awk '{print $1}' | xargs kill -9
end
