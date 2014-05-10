# helper functions for virtualenv - fish version

# change those to your liking
# root of projects
#VIRTUALENV_PROJECTS=~/projects
# root of virtualenvs
#VIRTUALENVS_DIR=~/.virtualenvs

# default environment variables
if not set -q VIRTUALENVS_DIR
	set --global VIRTUALENVS_DIR ~/.virtualenvs
end
if not set -q VIRTUALENV_PROJECTS
	set --global VIRTUALENV_PROJECTS ~/projects
end

# create directory if not exist
function __create_directory_if_not_exist
	for d in $argv
		if not test -d $d
			mkdir "$d"; and echo "[.] directory [$d] created."
		end
	end
end

# create a virtualenv
function mkvirtualenv --description 'Create new virtualenv'
	if not test (count $argv) -gt 0
		echo '[!] please specified the name of virtualenv you want to create.'
		return 1
	end
	set _ven $argv[1]
	if not test -d "$VIRTUALENVS_DIR/$_ven"
		set argv[1] "$VIRTUALENVS_DIR/$_ven"
		virtualenv $argv
		if test $status = 0
			echo "[.] virtualenv [$_ven] created."
		else
			echo "[!] failed to create virtualenv [$_ven]."
			if test -d "$argv[1]"
				rmvirtualenv "$_ven"
			end
			return 1
		end
	else
		echo "[!] virtualenv [$_ven] already exist."
	end
	echo "    type \"workon $_ven\" to activate this virtualenv."
end

# delete a virtualenv
function rmvirtualenv --description 'Delete specified virtualenv'
	if not test (count $argv) = 1
		echo '[!] please specified which virtualenv you want to delete.'
		return 1
	end
	set _ven $argv[1]
	if not test -d "$VIRTUALENVS_DIR/$_ven"
		echo "[!] virtualenv [$_ven] does not exist."
		return 1
	end
	rm -rf "$VIRTUALENVS_DIR/$_ven"; and echo "[!] virtualenv [$_ven] deleted."
	if test -d "$VIRTUALENV_PROJECTS/$_ven"
		echo "    project directory [$VIRTUALENV_PROJECTS/$_ven] will not be deleted, do it yourself if you like."
	end
end

# list all virtualenv
function  lsvirtualenv --description 'List available virtualenvs'
	if test -d "$VIRTUALENVS_DIR"
		command ls -u "$VIRTUALENVS_DIR"
	end
end

# work on specified virtualenv
function workon --description 'Activate virtualenv'
	if not test (count $argv) = 1
		echo '[!] please specified which virtualenv you want to work on.'
		return 1
	end
	set _ven $argv[1]
	if not test -d "$VIRTUALENVS_DIR/$_ven"
		echo "[!] virtualenv [$_ven] does not exist."
		echo "    type \"mkvirtualenv $_ven\" to create it."
		return 1
	else
		. "$VIRTUALENVS_DIR/$_ven/bin/activate.fish"
		echo "[.] virtualenv [$_ven] activated."
		# update the access time, for lsvirtualenv
		touch -a "$VIRTUALENVS_DIR/$_ven"
		__create_directory_if_not_exist "$VIRTUALENV_PROJECTS" "$VIRTUALENV_PROJECTS/$_ven"
		cd "$VIRTUALENV_PROJECTS/$_ven"
	end
end

# command completion for rmvirtualenv and workon
complete --command rmvirtualenv --no-files --arguments "(lsvirtualenv)" --description "Python VirtualEnv"
complete --command workon --no-files --arguments "(lsvirtualenv)" --description "Python VirtualEnv"

# Enable pip download cache
set -xg PIP_DOWNLOAD_CACHE ~/.pip-download-cache
