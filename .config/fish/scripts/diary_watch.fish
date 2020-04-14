#!/bin/env fish

cd ~/Documents/Wiki/Diary/

while true
    while inotifywait -e close_write diary.md
    end

    git add .
    git commit -m "automated commit"
end

