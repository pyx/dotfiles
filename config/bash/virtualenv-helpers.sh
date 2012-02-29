# helper functions for virtualenv

# change those to your liking
# root of projects
#VIRTUALENV_PROJECTS=~/projects
# root of virtualenvs
#VIRTUALENVS_DIR=~/.virtualenvs

# the following two functions have long names
# because they are not for public consumption

# check if two require ENV VARs exist
function create_default_values_if_require_env_vars_not_exist() {
  if [ -z "$VIRTUALENVS_DIR" ]; then
    VIRTUALENVS_DIR=~/.virtualenvs
    export VIRTUALENVS_DIR
  fi
  if [ -z "$VIRTUALENV_PROJECTS" ]; then
    VIRTUALENV_PROJECTS=~/projects
    export VIRTUALENV_PROJECTS
  fi
}

# create a directory if not exist
function create_directory_only_if_not_exist() {
  if [ ! -d "$1" ]; then
    mkdir "$1"
    echo "[.] directory [$1] created."
  fi
}

# create a new virtualenv
function mkvirtualenv() {
  if [ -z "$1" ]; then
    echo "[!] name of virtualenv cannot be empty"
    return 1
  fi
  create_default_values_if_require_env_vars_not_exist
  if [ -d "$VIRTUALENVS_DIR/$1" ]; then
    echo "[!] virtualenv with name [$1] already exist."
  else
    virtualenv --no-site-packages "$VIRTUALENVS_DIR/$1"
    if [ "$?" -ne "0" ]; then
      echo "[!] failed to create virtualenv [$1]."
      if [ -d "$VIRTUALENVS_DIR/$1" ]; then
	rmvirtualenv "$1"
      fi
      return 1
    else
      echo "[.] virtualenv [$1] created."
    fi
  fi
  echo "    type \"workon $1\" to activate this virtualenv."
}

# delete a virtualenv
function rmvirtualenv() {
  if [ -z "$1" ]; then
    echo "[!] name of virtualenv cannot be empty"
    return 1
  fi
  create_default_values_if_require_env_vars_not_exist
  if [ -d "$VIRTUALENVS_DIR/$1" ]; then
    rm -rf "$VIRTUALENVS_DIR/$1"
    echo "[!] virtualenv with name [$1] deleted."
  else
    echo "[!] virtualenv with name [$1] does not exist."
  fi
  if [ -d "$VIRTUALENV_PROJECTS/$1" ]; then
    echo "    project directory [$VIRTUALENV_PROJECTS/$1] will not be deleted, do it yourself if you like."
  fi
}

# list all virtualenv
function lsvirtualenv() {
  create_default_values_if_require_env_vars_not_exist
  # list virtualenvs sorted by access time
  if [ -d "$VIRTUALENVS_DIR" ]; then
    ls -u "$VIRTUALENVS_DIR"
  fi
}

# work on virtualenv
function workon() {
  if [ -z "$1" ]; then
    echo "[!] name of virtualenv cannot be empty"
    return 1
  fi
  create_default_values_if_require_env_vars_not_exist
  if [ ! -d "$VIRTUALENVS_DIR/$1" ]; then
    echo "[!] virtualenv with name [$1] does not exist."
    echo "    type \"mkvirtualenv $1\" to create it."
  else
    source "$VIRTUALENVS_DIR/$1/bin/activate"
    echo "[.] virtualenv with name [$1] activated."
    # update the access time, for lsvirtualenv
    touch -a "$VIRTUALENVS_DIR/$1"
    create_directory_only_if_not_exist "$VIRTUALENV_PROJECTS"
    create_directory_only_if_not_exist "$VIRTUALENV_PROJECTS/$1"
    cd "$VIRTUALENV_PROJECTS/$1"
  fi
}
