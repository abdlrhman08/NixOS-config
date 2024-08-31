{ inputs, unstable, lib, ... }:
let
    spicetify-nix = inputs.spicetify-nix;
    spicePkgs = inputs.spicetify-nix.legacyPackages.${unstable.system};
in {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "spotify"
    ];

    imports = [ spicetify-nix.homeManagerModules.default ];

    programs.spicetify = {
        enable = true;
        theme = spicePkgs.themes.sleek;

        enabledExtensions = with spicePkgs.extensions; [
            adblock
            shuffle # shuffle+ (special characters are sanitized out of ext names)
        ];
    };
}
