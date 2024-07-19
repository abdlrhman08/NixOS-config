{ config, lib, pkgs, inputs, unstable, ... }:

{
  imports = [
    ./modules/nvim
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
    # few language servers
    lua-language-server
    nixd

    # rust toolkit
    (rust-bin.stable.latest.default.override {
      extensions = [
        "rust-src"
        "rust-analyzer"
      ];
    })
  ];

  programs.git = {
    enable = true;
    userName = "abdlrhman08";
    userEmail = "abdelrahmanhamada65@gmail.com";
  };

  programs.zellij = {
    enable = true;
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
