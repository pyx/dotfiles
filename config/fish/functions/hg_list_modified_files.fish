# Helper function

function hg_list_modified_files --argument desc --description 'list modified files as reported by hg status'
	if not test $desc
		set desc 'Modified File'
	end
	hg_list_files "$desc" (hg status --no-status --modified ^/dev/null)
end
