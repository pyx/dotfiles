# Helper function.

function commandline_replace --argument replacement origin all --description 'Replace text in current commandline'
	if not test $origin
		return 1
	end
	if not test $replacement
		return 1
	end
	if test $all
		set all 'g'
	end
	commandline -r (commandline -pc | sed "s/\<$replacement\>/$origin/$all")
end
