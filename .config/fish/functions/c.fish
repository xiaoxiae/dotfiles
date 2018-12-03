function c
	eval (cd (pwd | fd -a . | fzf | sed "s/\/[^\/]\+\$//"))
end
