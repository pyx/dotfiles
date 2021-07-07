# Helper function

function hg_list_tracked_files --argument desc --description 'list tracked files as reported by hg manifest'
	set -l rev (get_rev_arg)
	if not test $desc
		set desc 'Tracked File'
	end
	hg_list_files "$desc" (hg manifest $rev 2>/dev/null)
end
