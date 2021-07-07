# Helper function

function hg_list_bookmarks --argument desc --description 'list bookmarks'
	set -l bookmark ''
	if not test $desc
		set desc 'Bookmark'
	end
	for bookmark in (hg bookmarks --quiet 2>/dev/null)
		echo -e "$bookmark\t$desc"
	end
end
