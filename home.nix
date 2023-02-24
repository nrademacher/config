{ pkgs, config, ... }:

{
  # Here goes your home-manager config, eg home.packages = [ foo ];
  home.packages = with pkgs;
    [
      neovim
      ripgrep
      fzf
      gh
      bat
      jq
      git
      zsh
      zplug
      nixfmt
      shfmt
      shellcheck
      fd
      rustup
      pwgen
      cmake
      php
      nodejs-16_x
      jdk17
      awscli
    ] ++ (with nodePackages; [ aws-cdk pnpm ]);

  home.stateVersion = "22.11";

  programs.zsh = {
    enable = true;

    initExtra = ''
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
        cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "''${*##-* }" | sed 's/^[0-9,.]* *//')"
      }

      # vi keybindings
      bindkey -v
    '';

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        {
          name = "zsh-users/zsh-syntax-highlighting";
        } # Simple plugin installation
        {
          name = "romkatv/powerlevel10k";
          tags = [ "as:theme" "depth:1" ];
        } # Installations with additional options. For the list of options, please refer to Zplug README.
      ];
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
