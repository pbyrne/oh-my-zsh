setopt prompt_subst

# enable required modules
autoload -U add-zsh-hook
autoload -Uz vcs_info

# Add hook for calling vcs_info before each command.
add-zsh-hook precmd vcs_info

# customize the vcs_info output
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats "(%b) %m%u%c"
zstyle ':vcs_info:*' actionformats "(%b) [%m%u%c] %a"
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' nvcsformats ""


ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""

grey='\e[0;90m'


pbyrne_prompt() {
  username='%n'
  current_path='%~' # collapsed directory (~ and environment variables)
  prompt="$current_path ${grey}$(rvm-prompt i v 2> /dev/null || rbenv_prompt_info)${reset_color} ${vcs_info_msg_0_} ${vcs_info_msg_1_}"

  echo $prompt
}

PROMPT='
$(pbyrne_prompt)
%(?,%{%F{green}%},%{%F{red}%})$%{$reset_color%} '

