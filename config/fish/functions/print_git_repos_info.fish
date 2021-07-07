# print git repository information

function print_git_repos_info --description 'Print Git repository information'
	set _branch (git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/")
	if not test $_branch
		# not inside a git repository
		return 0
	end
	# HEAD hash
	set _hash (git rev-parse HEAD | cut -c -12)
	# if working dir dirty
	set _wd_dirty (git diff --no-ext-diff --quiet --exit-code; or echo '*')
	# if index dirty
	set _index_dirty (git diff-index --cached --quiet HEAD --; or echo '+')

	# elements to be displayed:
	# right arrow
	set ra $CC_WHITE"->"$CC_RESET
	# left arrow
	set la $CC_WHITE"<-"$CC_RESET

	# repository type
	set rt $CC_RESET'Git' $CC_RESET'::'
	# current branch name
	set bn $CC_WHITE'Branch' $CC_LIGHT_BLUE$_branch

	# revision id
	# revision color based on if there are panding changes
	# white - normal
	set _rc $CC_WHITE
	# yellow - index is dirty
	if test $_index_dirty
		set _rc $CC_YELLOW
	end
	# red - working dir is dirty
	if test $_wd_dirty
		set _rc $CC_LIGHT_RED
	end
	set id $CC_WHITE'Rev' $_rc"$_hash$_index_dirty$_wd_dirty"

	echo -e "$rt $bn $ra $id$CC_RESET"
end
