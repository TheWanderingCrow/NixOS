# Crow's NixOS configuration project


## Proxmox/LXC target
`nix run github:nix-community/nixos-generators -- --format proxmox-lxc`

## Building the Live ISO
`nixos-generate --format install-iso --flake .#Parzival-Live -o result`
