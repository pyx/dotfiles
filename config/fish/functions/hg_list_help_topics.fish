# Helper function

function hg_list_help_topics --description 'list help topics available'
	set -l item ''
	set -l cmd ''
	set -l description ''
	# the following grep and read assuming output of 'hg help -q' as following:
	# ^list of commands:$
	# ^<Space>cmd<Tab>description$
	# ^<Space>cmd<Tab>description$
	# ^$
	# ^enabled extensions:$
	# ^<Space>cmd<Tab>description$
	# ^<Space>cmd<Tab>description$
	# ^$
	# ^additional help topics:$
	# ^<Space>topic<Tab>description$
	# ^<Space>topic<Tab>description$
	for item in (hg help -q | grep '^ ')
		echo $item | read cmd description
		echo -e "$cmd\t$description"
	end
end
