{
  programs.starship = {
    enable = true;
    settings = {
      right_format = "$time";
      add_newline = false;
      git_branch = {
        format = "[$branch]($style) ";
      };
      cmd_duration = {
        format = "[$duration]($style) ";
        style = "yellow";
      };
      time = {
        disabled = false;
        format = "[$time]($style)";
      };
    };
  };
}
