{ pkgs, ... }:
{
    dconf.settings = {
        "org/gnome/shell" = {
            disable-user-extensions = false;

            enabled-extensions = [
                "dash-to-dock@micxgx.gmail.com"
            ];
        };
    };

    home.packages = with pkgs; [
        gnomeExtensions.dash-to-dock
        gnomeExtensions.open-bar
    ];
}
