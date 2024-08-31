{ pkgs, config, ... }: {
    gtk = {
        enable = true;
        theme = {
            name = "Colloid-Dark";
            package = pkgs.colloid-gtk-theme;
        };
        iconTheme = {
            name = "WhiteSur-dark";
            package = pkgs.whitesur-icon-theme;
        };
    };
}
