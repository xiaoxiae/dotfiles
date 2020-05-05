#!/bin/env fish

cd ~/Documents/Wiki/

while true
	inotifywait -e close_write -r . --exclude .git 

	sleep 0.5

	git add .
	git commit -m "automated commit"
end

