{ config, ... }:
{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            ll = "ls -l";
            rebuild = "git add . && sudo nixos-rebuild switch --flake .";
            nixconfig = "cd ~/.dotfiles/nixos";
            projects = "cd ~/projects && ls -1";
            rsprojects = "cd ~/projects/rust-projects && ls -1";
        };

        initExtra = ''
            eval "$(direnv hook zsh)"
        '';
    };

    programs.starship = {
        enable = true;

        settings = {
            os = {
                disabled = false;
                symbols = {
                    NixOS = " ";
                };
            };
    
            git_branch = {
                disabled = false;
                symbol = " ";
            };

            time = {
                disabled = false;
                time_format = "%R";
                style = "bg:color_bg1";
                format = "[[   $time ](fg:color_fg0 bg:color_bg1)]($style)";
            };
        };
    };
}
