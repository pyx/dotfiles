# Helper function.

function __hg_subcommand_alias --argument alias command --description 'Set up hg subcommand alias'
	if not test $command
		return 1
	end
	if not test $alias
		return 1
	end
	complete -c hg -n '__fish_use_subcommand' -x -a $alias --description "Alias of $command"
	__hg_complete $alias -a "(commandline_replace '$alias' '$command')" -x
end
