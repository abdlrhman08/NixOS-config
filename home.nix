{ config, lib, pkgs, inputs, unstable, ... }:

{
  imports = [
      ./modules/nvim
      ./modules/desktop
      ./modules/gtk.nix
      ./modules/kitty.nix
      ./modules/spicetify.nix
  ];

  home.username = "abdelrahman";
  home.homeDirectory = "/home/abdelrahman";

  home.packages = with pkgs; [
        fastfetch
        ripgrep
        gnome.ghex

        fzf
        glow
        atac
        obsidian
        prismlauncher

        obs-studio
        
        vscode
        devenv
        # few language servers
        lua-language-server
        nixd

        libsForQt5.qt5.qtwayland
        # rust toolkit
        (rust-bin.stable.latest.default.override {
              extensions = [
                    "rust-src"
                    "rust-analyzer"
              ];
        })

        # fonts
        maple-mono-NF
  ];

  fonts.fontconfig.enable = true;

  programs.git = {
      enable = true;
      userName = "abdlrhman08";
      userEmail = "abdelrahmanhamada65@gmail.com";
  };

  programs.zellij = {
      enable = true;
  };

  home.sessionVariables = {
    GTK_THEME = "Colloid-Dark";
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
