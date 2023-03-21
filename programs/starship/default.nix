{
  programs.starship = {
    enable = true;
    settings = {
      format = "$battery$username$hostname$directory$git_branch$git_status$git_state$cmd_duration";
      right_format = "$time";
      add_newline = false;
      git_branch = {
        format = "[$branch]($style) ";
      };
      cmd_duration = {
        format = "[$duration]($style) ";
        style = "yellow";
      };
      battery = {
        full_symbol = "•";
        charging_symbol = "⇡";
        discharging_symbol = "⇣";
      };
      time = {
        disabled = false;
        format = "[$time]($style)";
      };
    };
  };
}
