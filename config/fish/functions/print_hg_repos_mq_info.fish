# print mercurial repository mq information

function print_hg_repos_mq_info --description 'Print MQ information of Mercurial repository'
	set _mq_applied (hg qapplied ^/dev/null | tr '\n' ' ')
	if not test $_mq_applied
		return 0
	end
	# top patch commit message
	set _mq_top_patch (hg qheader ^/dev/null | head -n1)
	# elements to be displayed:
	# left arrow
	set la $CC_WHITE'<-'$CC_RESET
	# applied patches:
	set ap $CC_WHITE'Applied Patches' $CC_BROWN$_mq_applied
	# top patch
	set tp $la $CC_DARK_GRAY$_mq_top_patch
	echo -e "$ap$tp"
end
