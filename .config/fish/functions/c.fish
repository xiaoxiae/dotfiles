function c
	eval (cd (fzf --preview='head -$LINES {}' | sed "s/\/[^\/]\+\$//"))
end
