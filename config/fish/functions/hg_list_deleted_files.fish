# Helper function

function hg_list_deleted_files --argument desc --description 'list deleted files as reported by hg status'
	if not test $desc
		set desc 'Deleted File'
	end
	hg_list_files "$desc" (hg status --no-status --deleted ^/dev/null)
end
