{ ... }: {
    programs.waybar = {
        enable = true;
        style = (builtins.readFile ./style/waybar.css); 
    };
}
