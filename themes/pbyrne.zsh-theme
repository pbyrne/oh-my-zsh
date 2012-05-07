ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""

grey='\e[0;90m'

reset=''

setopt prompt_subst

pbyrne_prompt() {
  username='%n'
  current_path='%~' # collapsed directory (~ and environment variables)
  prompt="$current_path ${grey}$(rvm-prompt i v 2> /dev/null || rbenv_prompt_info)${reset_color} $(git_prompt_info)"

  echo $prompt
}

PROMPT='
$(pbyrne_prompt)
$ '

