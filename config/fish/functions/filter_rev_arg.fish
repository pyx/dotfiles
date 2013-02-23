# Helper function.

function filter_rev_arg --description 'print -r/--rev option in arguments if exists'
	set -l found ''
	set -l a ''
	for a in $argv
		if test $found
			echo "$found"
			echo "$a"
			return 0
		end
		switch $a
			case '-r' '--rev'
				set found $a
				continue
			case '-r*' '--rev=*'
				echo "$a"
				return 0
		end
	end
end
