{
  programs.zsh = {
    enable = true;

    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = import ./aliases.nix;

    localVariables = { ZSHZ_CMD = "_z"; };

    envExtra = ''
      PATH=./bin/:$PATH
    '';

    initExtra = ''
      # preview fzf search results with bat
      command -v bat  > /dev/null && export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}'"

      # faster/more efficient clear command
      c() {
        printf "\e[H\e[2J"  
      }

      # browse z results with fzf
      z() {
        [ $# -gt 0 ] && _z "$*" && return
        cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "''${*##-* }" | sed 's/^[0-9,.]* *//')"
      }

      # vi keybindings
      bindkey -v

      # Initialize starhship prompt if installed
      if command -v starhship &> /dev/null
      then
        eval "$(starhship init zsh)"
      fi
    '';

    zplug = {
      enable = true;
      plugins = [
        { name = "agkozak/zsh-z"; }
        { name = "chisui/zsh-nix-shell"; }
      ];
    };
  };
}
