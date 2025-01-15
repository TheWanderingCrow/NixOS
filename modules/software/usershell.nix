{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.software.usershell.enable {
    programs.zsh = {
      enable = true;
      autosuggestions = {
        enable = true;
        async = true;
      };
      syntaxHighlighting = {
        enable = true;
      };
    };

    programs.starship = {
      enable = true;
      settings = {
        format = "[░▒▓](#a3aed2)[  ](bg:#a3aed2 fg:#090c0c)[](bg:#769ff0 fg:#a3aed2)$directory[](fg:#769ff0 bg:#394260)$git_branch$git_status[](fg:#394260 bg:#212736)$nix_shell$php[](fg:#212736 bg:#1d2230)$time[ ](fg:#1d2230)$character";

        directory = {
          style = "fg:#e3e5e5 bg:#769ff0";
          format = "[ $path ]($style)";
          truncation_length = 3;
          truncation_symbol = "…/";
        };
        git_branch = {
          symbol = "";
          style = "bg:#394260";
          format = "[[ $symbol $branch ](fg:#769ff0 bg:#394260)]($style)";
        };
        git_status = {
          style = "bg:#394260";
          format = "[[($all_status$ahead_behind )](fg:#769ff0 bg:#394260)]($style)";
        };
        php = {
          symbol = "";
          style = "bg:#212736";
          format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
        };
        time = {
          disabled = false;
          time_format = "%R"; # Hour:Minute Format
          style = "bg:#1d2230";
          format = "[[  $time ](fg:#a0a9cb bg:#1d2230)]($style)";
        };
        nix_shell = {
          disabled = false;
          symbol = "";
          format = "via [(\($symbol-$name\))]($style) ";
          style = "bold blue";
        };
      };
    };
    users.defaultUserShell = pkgs.zsh;
  };
}
