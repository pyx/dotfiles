# Helper function

function hg_list_unapplied_patches --argument desc --description 'list unapplied patches'
	set -l patch ''
	if not test $desc
		set desc 'Unapplied Patch'
	end
	for patch in (hg qunapplied ^/dev/null)
		echo -e "$patch\t$desc"
	end
end
