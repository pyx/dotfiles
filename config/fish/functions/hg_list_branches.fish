# Helper function

function hg_list_branches --argument desc --description 'list branches'
	set -l branch ''
	if not test $desc
		set desc 'Named Branch'
	end
	for branch in (hg branches --quiet ^/dev/null)
		echo -e "$branch\t$desc"
	end
end
