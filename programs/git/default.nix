{ pkgs, ... }:

let
  meta = import ../../meta.nix;
in
{
  programs.git = {
    enable = true;

    package = pkgs.gitFull;

    userEmail = meta.user.emailAddresses.private;
    userName = meta.user.name;

    extraConfig = {
      core = {
        excludesfile = builtins.toPath ./.gitignore_global;
        editor = "nvim";
      };
      include = { path = "~/.gitconfig.local"; };
      init = { defaultBranch = "main"; };
      status = { submoduleSummary = true; };
      commit = { template = builtins.toPath ./.gitmessage; };
      push = {
        default = "current";
        followTags = true;
      };
      pull = { rebase = true; };
      rebase = { autoStash = true; };
      fetch = { prune = true; };
      rerere = { enabled = true; };
      hub = { protocol = "ssh"; };
      color = {
        ui = "auto";
        status = "auto";
        diff = "auto";
        branch = "auto";
        showBranch = "auto";
        interactive = "auto";
      };
    };

    difftastic = {
      enable = true;
      display = "inline";
    };
  };
}
