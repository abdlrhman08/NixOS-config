{ ... }: {
    wayland.windowManager.hyprland = {
        enable = true;
        settings = {
            "$mainMod" = "SUPER";
            "$terminal" = "kitty";

            general = {
                border_size = 2;
            };

            decoration = {
                rounding = 5;

                blur = {
                    enabled = true;
                    size = 1;
                };
            };

            exec-once = [
                "waybar"
                "hyprpaper"
            ];

            bind = [
                "$mainMod, Return, exec, $terminal"
                "$mainMod, Q, killactive"
                "$mainMod, 1, workspace, 1"
                "$mainMod, 2, workspace, 2"
                "$mainMod, 3, workspace, 3"
                "$mainMod, 4, workspace, 4"
                "$mainMod, F, exec, fuzzel"
                "$mainMod, E, exec, firefox"
            ];

            bindm = [
                "$mainMod, mouse:272, movewindow"
                "$mainMod, mouse:273, resizewindow"
            ];

            windowrulev2 = [
                "opacity 0.9 0.9, class:($terminal)"
            ];

            monitor = [
                ",1920x1080,auto,1"
            ];
        };
    };
}
