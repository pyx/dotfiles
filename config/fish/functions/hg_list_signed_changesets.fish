# Helper function

function hg_list_signed_changesets --argument desc --description 'list signed changesets as reported by hg sigs'
	set -l cset ''
	set -l num ''
	set -l hash ''
	if not test $desc
		set desc 'Signed Changeset'
	end
	for cset in (hg sigs ^/dev/null | grep -o '[0-9][0-9]*:[a-z0-9]\{40\}')
		echo $cset | tr : ' ' | read num hash
		echo -e "$hash\t$desc: $num"
	end
end
