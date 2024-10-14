{ inputs, pkgs, lib, config, ...}: {
    environment.systemPackages = with pkgs;
        (
            # Core packages
            if config.module.core.enable
            then [
                vim
                wget
                screen
                git
                curl
                tmux
                pulseaudio
                keyd
            ] else []
        )
        ++ (
            if config.module.gui.enable
            then [
                # Writing
                logseq
                hunspellDicts.en-us
                libreoffice
                hunspell

                # Audio
                pavucontrol
                pulsemixer
                noisetorch

                # Communication
                mattermost-desktop
                slack
                zoom-us
                vesktop
                signal-desktop
                teamspeak_client

                # Browsing
                tor-browser

                # Music
                spotify
                strawberry-qt6

                # Utilities
                taskwarrior3
                hyfetch
                gimp
                pulseaudio-ctl
                playerctl
                brightnessctl
            ] else []
        )
        ++ (
            if config.module.wayland.enable
            then [
               foot
               wofi
               swaynotificationcenter
               udiskie
               polkit_gnome
               swayidle
               sway-audio-idle-inhibit
               swaylock-effects
               sway-contrib.grimshot
               glfw-wayland-minecraft
               waybar
               wl-clipboard
            ] else []
        )
        ++ (
            if config.module.x11.enable
            then [
                xterm
                rofi
            ] else []
        )
        ++ (
            if config.module.programming.enable
            then [
                inputs.nixvim.packages.${pkgs.system}.default
                lua
                libgcc
                php83
                php83Packages.composer
                python3
                serverless
                jwt-cli
                jq
                ddev
                cloc
                ansible
                flutter
            ] else []
        )
        ++ (
            if config.module.hacking.enable
            then [
                metasploit
                exploitdb
                ghidra
                wireshark
                nmap
                hashcat
                dirstalk
            ] else []
        )
        ++ (
            if config.module.mudding.enable
            then [
                mudlet
            ] else []
        )
        ++ (
            if config.module.gaming.enable
            then [
                steam
                protonup-qt
                steamtinkerlaunch
                prismlauncher
                mudlet
                widelands
                wesnoth
                gamescope
                gamemode
            ] else []
        );
}
