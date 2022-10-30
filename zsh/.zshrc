if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ "$(uname)" == "Darwin" ]]; then
  PLUGINS_DIR="/usr/local/share"
  else
  PLUGINS_DIR="/usr/share/zsh/plugins"
fi

source "$PLUGINS_DIR/powerlevel10k/powerlevel10k.zsh-theme"
source "$PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"

[[ ! -f ~/.aliases ]] || source ~/.aliases
[[ ! -f ~/z.sh ]] || source ~/z.sh
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# preview fzf search results with bat
command -v bat  > /dev/null && export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}'"

# faster/more efficient clear command
c() {
  printf "\e[H\e[2J"  
}

# browse z results with fzf
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

# vi keybindings
bindkey -v

export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/opt/openjdk@8/bin:$PATH"

# bun completions
[ -s "/Users/nrademacher/.bun/_bun" ] && source "/Users/nrademacher/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/nrademacher/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
