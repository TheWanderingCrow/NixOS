{
  config,
  pkgs,
  modulesPath,
  lib,
  ...
}: {
  imports = [
    ../../modules
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  boot.supportedFilesystems = lib.mkForce ["btrfs" "reiserfs" "vfat" "f2fs" "xfs" "ntfs" "cifs"];

  desktop.sway.enable = true;

  module.gui.enable = true;
  module.programming.enable = true;
}