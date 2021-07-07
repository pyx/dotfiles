# Helper function

function hg_list_all_changesets --description 'list all revisions, bookmarks, branches and tags'
	hg_list_branches
	hg_list_revs
	if hg root &>/dev/null
		echo -e "null\tNull Revision"
	end
end
