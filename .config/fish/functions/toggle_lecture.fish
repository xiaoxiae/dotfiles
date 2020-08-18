function toggle_lecture
	# toggle terminal profile 
	mv ~/.terminal_profile ~/.terminal_profile_
	mv ~/.terminal_profile_lecture ~/.terminal_profile
	mv ~/.terminal_profile_ ~/.terminal_profile_lecture
end
