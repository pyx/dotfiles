# shortcut function - gv
function gv --description 'Start GVim as remote server or send file to remote server'
	if test (count $argv) = 0
		gvim
	else
		gvim --remote-silent $argv
	end
end
