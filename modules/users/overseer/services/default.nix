{
  lib,
  config,
  ...
}: {
  imports = [
    ./bar-assistant.nix
    ./homebox.nix
    ./homepage.nix
    ./invidious.nix
    ./bookstack.nix
    ./grocy.nix
  ];
}
