{ lib, config, ...}: {
    imports = [
        ./core.nix
        ./boot.nix
        ./networking.nix
        ./programs.nix
        ./users
    ];

    options.omni.enable = lib.mkOption {default = true;};

    config = lib.mkIf config.omni.enable {
        packages = {
            enable = lib.mkDefault true;
            core.enable = lib.mkDefault true;
            gui.enable = lib.mkDefault true;
            programming.enable = lib.mkDefault true;
            hacking.enable = lib.mkDefault false;
            mudding.enable = lib.mkDefault false;
            gaming.enable = lib.mkDefault false;
        };
    };
}
