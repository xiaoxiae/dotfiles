function c
	eval (cd (pwd | fd -a -I . | fzf | sed "s/\/[^\/]\+\$//"))
end
