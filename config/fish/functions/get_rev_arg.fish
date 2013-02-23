# Helper function.
# used by other hg completion functions

function get_rev_arg --description 'get -r/--rev option in current commandline'
	filter_rev_arg (commandline -po)
end
