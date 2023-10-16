# color codes:
set --global CC_RESET '\e[00m'

set --global CC_BLACK '\e[0;30m'
set --global CC_RED '\e[0;31m'
set --global CC_GREEN '\e[0;32m'
set --global CC_BROWN '\e[0;33m'
set --global CC_BLUE '\e[0;34m'
set --global CC_PURPLE '\e[0;35m'
set --global CC_CYAN '\e[0;36m'
set --global CC_LIGHT_GRAY '\e[0;37m'

set --global CC_DARK_GRAY '\e[1;30m'
set --global CC_LIGHT_RED '\e[1;31m'
set --global CC_LIGHT_GREEN '\e[1;32m'
set --global CC_YELLOW '\e[1;33m'
set --global CC_LIGHT_BLUE '\e[1;34m'
set --global CC_LIGHT_PURPLE '\e[1;35m'
set --global CC_LIGHT_CYAN '\e[1;36m'
set --global CC_WHITE '\e[1;37m'

# prompt color settings:
set --global prompt_color_cwd $CC_LIGHT_BLUE
set --global prompt_color_hostname $CC_YELLOW
set --global prompt_color_login $CC_WHITE
set --global prompt_color_username $CC_LIGHT_GREEN
set --global prompt_color_banner_message $CC_LIGHT_PURPLE

# prompt sign:
set --global prompt_sign '><> '

# show banner
set --global prompt_show_banner 1
# show repository information
set --global prompt_show_repos_info 1

# prompt function:
function fish_prompt --description 'Customized prompt'
	emit print_prompt_header
	if test $VIRTUAL_ENV
		set_color white --background blue
		echo -n '['(basename "$VIRTUAL_ENV")']'
		set_color normal
	end
	set_color red
	echo "$prompt_sign"
end

# event-handlers:
function __on_init_prompt_header --on-event print_prompt_header
	set --global __ph_login $prompt_color_login'Login'
	set --global __ph_user $prompt_color_username(whoami)
	set --global __ph_at $CC_RESET'at'
	set --global __ph_host $prompt_color_hostname(hostname|cut -d . -f 1)
	set --global __ph_bind $prompt_color_login'>>='
	# prompt banner:
	set_prompt_banner '>>>' '-' '<<<'
	set --global prompt_banner_message 'Gentoo Linux'
	# disable default virtualenv prompt
	set --global VIRTUAL_ENV_DISABLE_PROMPT 1
	# execute once
	functions --erase __on_init_prompt_header
end

function on_print_prompt_header --on-event print_prompt_header
	# print a carriage return, make sure that following messages will be
	# printed at the beginning of the line.
	echo -ne '\r'
	if test $prompt_show_banner = 1
		print_prompt_banner
	end
	if test $prompt_show_repos_info = 1
		print_git_repos_info
		print_hg_repos_info
	end
	set cwd $prompt_color_cwd(prompt_pwd)
	echo -e "$__ph_login $__ph_user $__ph_at $__ph_host $__ph_bind $cwd"
end

# opam configuration
source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# load local config
if test -f ~/.local_config.fish
	. ~/.local_config.fish
end
