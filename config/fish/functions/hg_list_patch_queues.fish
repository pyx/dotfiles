# Helper function

function hg_list_patch_queues --argument desc --description 'list available patch queues'
	set -l queue ''
	if not test $desc
		set desc 'Patch Queue'
	end
	for queue in (hg qqueue --active 2>/dev/null)
		echo -e "$queue\t$desc (active)"
	end
	for queue in (hg qqueue --list --quiet 2>/dev/null)
		echo -e "$queue\t$desc"
	end
end
