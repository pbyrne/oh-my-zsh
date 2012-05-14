setopt prompt_subst

grey='\e[0;90m'

# loading the bash-completion installed by git through homebrew
git_complete_file=/usr/local/etc/bash_completion.d/git-completion.bash
[ -e $git_complete_file ] && source $git_complete_file

pbyrne_prompt() {
  username='%n'
  current_path='%~' # collapsed directory (~ and environment variables)
  prompt="$current_path ${grey}$(rvm-prompt i v 2> /dev/null || rbenv_prompt_info)${reset_color} $(__git_ps1)"

  echo $prompt
}

PROMPT='
$(pbyrne_prompt)
%(?,%{%F{green}%},%{%F{red}%})$%{$reset_color%} '

