{ config, ... }:
let
    lib = config.lib;
    vars = import ../variables.nix { inherit config; } ;
in
{
    programs.waybar = {
        enable = true;
    };
    home.file.".config/waybar/style.css".source = lib.file.mkOutOfStoreSymlink "${vars.desktop_config}/bar/waybar.css"; 
}
