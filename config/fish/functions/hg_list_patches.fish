# Helper function

function hg_list_patches --argument desc --description 'list patches'
	set -l patch ''
	if not test $desc
		set desc 'Mercurial Queue Patch'
	end
	for patch in (hg qseries 2>/dev/null)
		echo -e "$patch\t$desc"
	end
end
