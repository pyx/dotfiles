# Helper function

function hg_list_added_files --argument desc --description 'list added files as reported by hg status'
	if not test $desc
		set desc 'Added File'
	end
	hg_list_files "$desc" (hg status --no-status --added 2>/dev/null)
end
