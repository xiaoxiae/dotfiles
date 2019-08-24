function c
	set selected_path (pwd | fd -a -I . | fzf);

	if test -d "$selected_path"
		cd $selected_path
	else
		cd (echo $selected_path | sed "s/\/[^\/]\+\$//")
	end
end
