# oh-my-zsh Bureau Theme

### NVM
ZSH_THEME_NVM_PROMPT_PREFIX="%B⬡%b "
ZSH_THEME_NVM_PROMPT_SUFFIX=""

### Git [±master ▾●]

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"

bureau_git_branch () {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}

bureau_git_prompt () {
  local _branch=$(bureau_git_branch)
  local _result=" %* "
  if [[ "${_branch}x" != "x" ]]; then
    _result="$ZSH_THEME_GIT_PROMPT_PREFIX$_branch"
    _result="$_result$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
  echo $_result
}



if [[ $EUID -eq 0 ]]; then
  _USERNAME="%{$fg_bold[red]%}%n"
  _LIBERTY="%{$fg[red]%}#"
else
  _LIBERTY="%(?.%{$fg[green]%}.%{$fg[red]%})\$$RETVAL"
  _USERNAME="%{$fg_bold[white]%}%n"
  
fi
  _USERNAME="$_USERNAME%{$reset_color%}@%m"
  _LIBERTY="$_LIBERTY%{$reset_color%}"
  _PATH="%{$fg_bold[white]%}%c%{$reset_color%}"

if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
  _1LEFT="$_USERNAME $_PATH"
else
  _1LEFT="$_PATH"
fi

setopt prompt_subst
PROMPT='$_1LEFT $_LIBERTY '
RPROMPT='$(nvm_prompt_info) $(bureau_git_prompt)'
