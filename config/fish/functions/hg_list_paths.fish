# Helper function

function hg_list_paths --description 'list paths defined in hgrc'
	for path in (hg paths ^/dev/null)
		# in format
		# name = url
		set -l name ''
		set -l _eq_ ''
		set -l url ''
		echo $path | read name _eq_ url
		echo -e "$name\t$url"
	end
end
