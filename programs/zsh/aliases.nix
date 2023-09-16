{
  cat = "bat";

  # ls dir/file colors
  ls = "eza";
  l = "eza -1";
  ll = "eza -la";

  # docker shortcuts
  dcu = "docker compose up -d";
  dcd = "docker compose down";
  dir = "docker image rm";

  # misc shortcuts
  aliases = "$EDITOR $HOME/.aliases"; # Quick access to the aliases.zsh file
  grep = "grep --color";
  h = "history";
  nmap = "$EDITOR $HOME/.config/nvim/lua/mappings.lua";
  nplug = "$EDITOR $HOME/.config/nvim/lua/plugins.lua";
  nplugconf = "$EDITOR $HOME/.config/nvim/lua/plugins-config.lua";
  nsett = "$EDITOR $HOME/.config/nvim/lua/settings.lua";
  t = "touch";
  tr = ''tree -CphuNI "node_modules|target"'';
  x = "exit"; # Exit terminal
  zshrc = "$EDITOR $HOME/.zshrc"; # Quick access to the .zshrc file;

  # Git;
  g = "git";
  ga = "git add";
  gaa = "git add --all";
  gap = "git add --patch";
  gb = "git branch";
  gbD = "git branch -D";
  gbda = ''
    git branch --no-color --merged | command grep -vE "^(+|*|s*($(git_main_branch)|development|develop|devel|dev)s*$)" | command xargs -n 1 git branch -d'';
  gbl = "git blame -b -w";
  gbr = "git branch --remote";
  gc = "git commit -v";
  gcan = "git commit --amend --no-edit -v";
  gcb = "git checkout -b";
  gcd = "git checkout development";
  gcl = "git clone --recurse-submodules";
  gcm = "git checkout $(git_main_branch)";
  gco = "git checkout";
  gcp = "git cherry-pick";
  gd = "git diff";
  gf = "git fetch";
  gfa = "git fetch --all --prune";
  gfo = "git fetch origin";
  gl = "git pull";
  glum = "git pull upstream $(git_main_branch)";
  glg = "git log";
  gm = "git merge";
  gma = "git merge --abort";
  gmom = "git merge origin/$(git_main_branch)";
  gp = "git push";
  gpob = "git push origin $(git branch --show-current)";
  gpobf = "git push origin $(git branch --show-current) --force";
  gpristine = "git reset --hard && git clean -dffx";
  gr = "git restore";
  gra = "git restore .";
  grbi = "git rebase -i";
  grbm = "git rebase $(git_main_branch)";
  grhh = "git reset --hard";
  groh = "git reset origin/$(git_current_branch) --hard";
  gstat = "git status -s";
  gst = "git stash --include-untracked";
  gstp = "git stash pop";
  gsts = "git stash show -p";

  # GitHub CLI;
  ghi = "gh issue list";
}
