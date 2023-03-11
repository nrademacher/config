{
  programs.starship = {
    enable = true;
    settings = {
      git_branch = {
        format = "[$branch]($style) ";
      };
      cmd_duration = {
        format = "[$duration]($style) ";
        style = "yellow";
      };
    };
  };
}
