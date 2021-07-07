# Helper function

function hg_list_unknown_files --argument desc --description 'list unknown files as reported by hg status'
	if not test $desc
		set desc 'Unknown File'
	end
	hg_list_files "$desc" (hg status --no-status --unknown 2>/dev/null)
end
