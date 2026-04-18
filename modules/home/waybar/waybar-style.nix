{ }:

let
  font = "JetBrainsMono Nerd Font";
  colors = {
    background = "rgba(0, 0, 0, 0.7)";
    foreground = "rgba(90, 147, 216, 1)";
    foreground-opacity = "rgba(90, 147, 216, 0.5)";
  };

in
''
  @define-color foreground #5a93d8;
  @define-color background rgba(0, 0, 0, 0.7);

  * {
      font-family: ${font};
      font-size: 14px;
      padding: 0;
      margin: 0;
  }

  #waybar {
      color: ${colors.foreground};
      background-color: ${colors.background};
  }

  #workspaces button {
      color: ${colors.foreground-opacity};
  }

  #workspaces button.focused {
    color: ${colors.foreground}
  }

  #workspaces button:hover {
      background: none;
      color: ${colors.foreground};
      box-shadow: none;
      border: none;
  }
''
