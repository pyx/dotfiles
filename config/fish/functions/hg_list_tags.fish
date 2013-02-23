# Helper function

function hg_list_tags --argument desc --description 'list tags'
	set -l tag ''
	if not test $desc
		set desc 'Tag'
	end
	for tag in (hg tags --quiet ^/dev/null)
		echo -e "$tag\t$desc"
	end
end
