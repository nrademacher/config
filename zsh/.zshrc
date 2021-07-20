# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Util functions
clear() {
printf "\e[H\e[2J"  
}

bindkey -v

