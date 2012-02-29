# This is the gentoo default
#export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '

CC_RESET='[00m'

CC_BLACK='[0;30m'
CC_RED='[0;31m'
CC_GREEN='[0;32m'
CC_BROWN='[0;33m'
CC_BLUE='[0;34m'
CC_PURPLE='[0;35m'
CC_CYAN='[0;36m'
CC_LIGHT_GRAY='[0;37m'

CC_DARK_GRAY='[1;30m'
CC_LIGHT_RED='[1;31m'
CC_LIGHT_GREEN='[1;32m'
CC_YELLOW='[1;33m'
CC_LIGHT_BLUE='[1;34m'
CC_LIGHT_PURPLE='[1;35m'
CC_LIGHT_CYAN='[1;36m'
CC_WHITE='[1;37m'

function header()
{
  begin_str=">>>"
  end_str=">>>"
  banner="Gentoo Linux"
  length=$(($(tput cols) - ${#begin_str} - ${#end_str} - ${#banner} - 2))
  half=$(($length / 2))
  printf -v line '%*s' "$half"
  printf %b "\e${CC_LIGHT_RED}${begin_str}\e${CC_WHITE}${line// /-}[\e${CC_LIGHT_PURPLE}${banner}\e${CC_WHITE}]${line// /-}\e${CC_LIGHT_RED}${end_str}\e${CC_RESET}"
}

function get_hg_rev_id()
{
  hg id -in 2> /dev/null
}

function get_hg_rev_branches()
{
  hg id -b 2> /dev/null
}

function get_hg_rev_tags()
{
  hg id -t 2> /dev/null
}

function get_hg_rev_bookmarks()
{
  hg id -B 2> /dev/null
}

function get_hg_rev_phase()
{
  hg phase . 2> /dev/null | cut -d ' ' -f 2
}

function get_git_repos_branch()
{
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/"
}

function repos_info()
{
  HG_REV_ID="$(get_hg_rev_id)"
  if [ "${HG_REV_ID}" ]
  then
    HG_BANNER="\e${CC_WHITE}\e${CC_DARK_GRAY}Mercurial\e${CC_WHITE} ::"

    HG_REV_BRANCHES="\e${CC_WHITE}Branch \e${CC_LIGHT_BLUE}$(get_hg_rev_branches)"

    HG_REV_PHASE="$(get_hg_rev_phase)"
    case ${HG_REV_PHASE} in
      "public") HG_REV_PHASE_COLOR=${CC_WHITE};;
      "draft")  HG_REV_PHASE_COLOR=${CC_BROWN};;
      "secret") HG_REV_PHASE_COLOR=${CC_DARK_GRAY};;
      *)        HG_REV_PHASE_COLOR=${CC_LIGHT_GRAY};;
    esac
    HG_REV_PHASE="\e${HG_REV_PHASE_COLOR}$(get_hg_rev_phase)"

    case ${HG_REV_ID} in
      *+*) HG_REV_ID_COLOR=${CC_LIGHT_RED};;
      *)   HG_REV_ID_COLOR=${CC_YELLOW};;
    esac
    HG_REV_ID="\e${CC_WHITE}ID ${HG_REV_PHASE} \e${HG_REV_ID_COLOR}${HG_REV_ID}"

    LEFT_ARROW=" \e${CC_WHITE}← "
    RIGHT_ARROR=" \e${CC_WHITE}→ "

    HG_REV_TAGS="$(get_hg_rev_tags)"
    if [ "${HG_REV_TAGS}" ]
    then
      HG_REV_TAGS="${LEFT_ARROW}\e${CC_LIGHT_PURPLE}${HG_REV_TAGS}"
    fi

    HG_REV_BOOKMARKS="$(get_hg_rev_bookmarks)"
    if [ "${HG_REV_BOOKMARKS}" ]
    then
      HG_REV_BOOKMARKS="${LEFT_ARROW}\e${CC_LIGHT_GREEN}${HG_REV_BOOKMARKS}"
    fi

    printf \\n%b "${HG_BANNER} ${HG_REV_BRANCHES}${RIGHT_ARROR}${HG_REV_ID}${HG_REV_TAGS}${HG_REV_BOOKMARKS}"
  fi

  GIT_REPOS_BRANCH="$(get_git_repos_branch)"
  if [ "${GIT_REPOS_BRANCH}" ]
  then
    printf \\n%b "\e${CC_WHITE}\e${CC_LIGHT_GRAY}Git\e${CC_WHITE} :: Branch \e${CC_YELLOW}${GIT_REPOS_BRANCH}"
  fi
}

export PS1='$(header)$(repos_info)\n\
\e${CC_WHITE}[\e${CC_LIGHT_CYAN}Login\e${CC_WHITE}] \e${CC_LIGHT_GREEN}\u \e${CC_RESET}at \e${CC_WHITE}\h \e${CC_RESET}in \e${CC_LIGHT_BLUE}\w\n\
\[\e${CC_LIGHT_RED}\]\$\[\e${CC_RESET}\] '

alias gv="gvim --remote-silent"
alias mq='hg -R $(hg root)/.hg/patches'

source ~/.scripts/virtualenv-helpers.sh

[[ -f /etc/profile.d/bash-completion.sh ]] && source /etc/profile.d/bash-completion.sh

# for Steel Bank Common Lisp
export SBCL_HOME=/usr/lib/sbcl

export HISTSIZE=2000

set -o vi
