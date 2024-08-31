{ pkgs, ... }:
{
    services.xserver = {
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
    };
    
    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [
        gnome.gnome-tweaks
    ];
}
