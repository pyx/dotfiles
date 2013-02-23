# Helper function

function hg_list_revs --argument rev template --description 'list revision numbers'
	if not test $rev
		set rev 'all()'
	end
	if not test $template
		set template '{node}\t{rev}\n{rev}\t{node|short} in {phase}\n{bookmarks % \'{bookmark}\tBookmark at {node|short}:{rev}\n\'}{tags % \'{tag}\tTag on {node|short}:{rev}\n\'}'
	end
	hg log --rev $rev --template $template ^/dev/null
end
