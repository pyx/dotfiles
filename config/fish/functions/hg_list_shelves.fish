# Helper function

function hg_list_shelves --description 'list current shelves'
	for line in (hg shelve --list ^/dev/null)
		echo $line | read -l name desc
		echo -e "$name\t$desc"
	end
end
