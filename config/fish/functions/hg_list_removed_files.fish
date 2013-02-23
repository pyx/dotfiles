# Helper function

function hg_list_removed_files --argument desc --description 'list removed files as reported by hg status'
	if not test $desc
		set desc 'Removed File'
	end
	hg_list_files "$desc" (hg status --no-status --removed ^/dev/null)
end
