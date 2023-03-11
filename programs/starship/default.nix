{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
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
