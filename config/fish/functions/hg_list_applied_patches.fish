# Helper function

function hg_list_applied_patches --argument desc --description 'list applied patches'
	set -l patch ''
	if not test $desc
		set desc 'Applied Patch'
	end
	for patch in (hg qapplied ^/dev/null)
		echo -e "$patch\t$desc"
	end
end
