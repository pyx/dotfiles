# Helper function

function hg_list_files --description 'list file with path relative to current working directory'
	set -l filename ''
	set -l description $argv[1]
	if not test $description
		return 1
	end
	set -e argv[1]
	for filename in (hg_file_path_relative_to_cwd $argv)
		echo -e "$filename\t$description"
	end
end
