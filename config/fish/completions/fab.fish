# Completion for fabric

complete -c fab --description 'Task in fabfile' -a '(fab --shortlist ^/dev/null)' -x
