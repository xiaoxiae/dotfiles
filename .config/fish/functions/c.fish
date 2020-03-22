function c
	if test -z $argv
		set selected_path (fd -a -I | fzf);
	else
		set selected_path (fd -a -I . $argv | fzf);
	end

	if test -n "$selected_path"
		if test -d "$selected_path"
			cd $selected_path
		else
			cd (echo $selected_path | sed "s/\/[^\/]\+\$//")
		end
	end
end
