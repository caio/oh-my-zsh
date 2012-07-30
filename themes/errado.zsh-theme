# vim:set ft=sh:

MODE_INDICATOR="%{$fg_bold[cyan]%}--COMMAND--%{$reset_color%}"

git_branch_color() {
    if test -n git status -s --ignore-submodules=dirty 2>/dev/null; then
        echo -n "%{$fg[green]%}"
    else
        echo -n "%{$fg[red]%}"
    fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="$(git_branch_color)"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[white]%}↑"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg_bold[white]%}↓"
ZSH_THEME_GIT_PROMPT_DIVERGED="%{$fg_bold[white]%}↕"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[white]%}✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[white]%}±"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[white]%}✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[white]%}➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[white]%}⌁"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[white]%}∗"

maybe_host() {
    if test -n "$SSH_CLIENT"; then
        echo -n "%{$fg_bold[green]%}%m%{$reset_color%} "
        return;
    fi
    if test -n "$SERVER_ROLE"; then
        echo -n "%{$fg_bold[green]%}$SERVER_ROLE%{$reset_color%} "
    fi
}

cute_pwd() {
    local d=${PWD/$HOME/\~}
    d=${d/\~\/src\//:}
    d=${d/:personal\//➤}
    d=${d/:booking\.com\//%{$fg_bold[cyan]%}B%{$fg_bold[red]%}.%{$fg[blue]%}}
    echo "$d%{$reset_color%}"
}

return_status() {
    test "$?" != "0" && echo -n "%{$fg_bold[red]%}%?! "
}

PROMPT='$(return_status)$(maybe_host)%{$fg[blue]%}$(cute_pwd) %{$reset_color%}%# '

RPROMPT='$(vi_mode_prompt_info) $(git_prompt_info)$(git_prompt_status)%{$reset_color%}'
