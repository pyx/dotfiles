# Helper function

function hg_file_path_relative_to_cwd --description 'print file path in hg repository relative to current directory'
	set -l filename ''
	set -l cwd (realpath .)
	set -l repo_root (realpath (hg root 2>/dev/null) 2>/dev/null)
	for filename in $argv
		/usr/bin/realpath --relative-to=$cwd $repo_root/$filename
	end 2>/dev/null
end
