# Helper function

function __hg_complete --description 'add hg subcommand completion'
	set -l subcommand $argv[1]
	set -l is_subcom 'contains \''$subcommand'\' (commandline -poc)'
	set -e argv[1]
	complete -c hg -n "$is_subcom" $argv
end
