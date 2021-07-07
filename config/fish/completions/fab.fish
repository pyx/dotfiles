# Completion for fabric

complete -c fab --description 'Task in fabfile' -a '(fab --shortlist 2>/dev/null)' -x
