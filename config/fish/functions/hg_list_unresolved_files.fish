# Helper function

function hg_list_unresolved_files --argument desc --description 'list unresolved files as reported by hg resolve'
	if not test $desc
		set desc 'Unresolved File'
	end
	hg_list_files "$desc" (hg resolve --no-status --list ^/dev/null)
end
