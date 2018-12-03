function note
set previousCd (pwd)
cd ~/Documents/Poznámky/
set fzfPath (fd -e md | fzf --preview='highlight -O ansi {}' )

if [ $fzfPath ]
vim $fzfPath
end
cd $previousCd
end
