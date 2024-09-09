{ pkgs, ... }:
{
    dconf.settings = {
        "org/gnome/shell" = {
            disable-user-extensions = false;

            enabled-extensions = [
                "dash-to-dock@micxgx.gmail.com"
            ];
        };
        "org/gnome/desktop/wm/preferences" = {
            button-layout = "appmenu:minimize,maximize,close";
        };
    };

    home.packages = with pkgs; [
        gnomeExtensions.dash-to-dock
        # open-bar currently is not working
        gnomeExtensions.open-bar
        gnomeExtensions.blur-my-shell
    ];
}
