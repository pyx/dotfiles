# print mercurial repository information

function print_hg_repos_info --description 'Print Mercurial repository information'
	set _rev_id (hg id -in ^/dev/null)
	if not test $_rev_id
		# not inside a mercurial repository
		return 0
	end
	# branch
	set _branch (hg id -b ^/dev/null)
	# tags
	set _tags (hg id -t ^/dev/null)
	# bookmarks
	set _bookmarks (hg id -B ^/dev/null)
	# phase
	set _phase (hg phase . ^/dev/null | cut -d ' ' -f 2)

	# elements to be displayed:
	# right arrow
	set ra $CC_WHITE"->"$CC_RESET
	# left arrow
	set la $CC_WHITE"<-"$CC_RESET

	# repository type
	set rt $CC_DARK_GRAY'Mercurial' $CC_RESET'::'
	# current branch name
	set bn $CC_WHITE'Branch' $CC_LIGHT_BLUE$_branch
	# set color based on phase status
	switch $_phase
		case public
			set _pc $CC_WHITE
		case draft
			set _pc $CC_BROWN
		case secret
			set _pc $CC_DARK_GRAY
		case '*'
			set _pc $CC_RESET
	end
	# set color red if there are panding changes
	switch $_rev_id
		case '*+*'
			set _ic $CC_LIGHT_RED
		case '*'
			set _ic $CC_YELLOW
	end
	# revision id
	set id $CC_WHITE'ID' $_pc$_phase $_ic$_rev_id
	# tags
	if test $_tags
		set tg ' '$la $CC_LIGHT_PURPLE$_tags
	else
		set tg ''
	end
	# bookmarks
	if test $_bookmarks
		set bm ' '$la $CC_LIGHT_GREEN$_bookmarks
	else
		set bm ''
	end

	echo -e "$rt $bn $ra $id$tg$bm$CC_RESET"
end
