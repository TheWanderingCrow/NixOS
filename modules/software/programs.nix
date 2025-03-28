{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
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
        ouch
        restic
        file
        usbutils
        fastfetch
        attic-client
        rclone
      ]
      else []
    )
    ++ (
      if config.module.gui.enable
      then [
        # Writing
        hunspellDicts.en-us
        libreoffice
        hunspell
        trilium-next-desktop

        # Audio
        pavucontrol
        pulsemixer
        noisetorch
        easyeffects

        # Communication
        mattermost-desktop
        slack
        zoom-us
        vesktop
        discord
        signal-desktop
        teamspeak_client

        # Browsing
        tor-browser

        # Music
        spotify
        strawberry-qt6

        # Utilities
        gimp
        pulseaudio-ctl
        playerctl
        brightnessctl
        calibre
      ]
      else []
    )
    ++ (
      if config.module.programming.enable
      then [
        inputs.nvix.packages.${pkgs.system}.default
        jwt-cli
        jq
        cloc
      ]
      else []
    )
    ++ (
      if config.module.hacking.enable
      then [
        metasploit
        exploitdb
        ghidra
        wireshark
        termshark
        nmap
        hashcat
        dirstalk
        rtl-sdr
      ]
      else []
    )
    ++ (
      if config.module.mudding.enable
      then [
        mudlet
      ]
      else []
    )
    ++ (
      if config.module.appdevel.enable
      then [
        flutter
        waydroid
        ungoogled-chromium
      ]
      else []
    )
    ++ (
      if config.module.gaming.enable
      then [
        steam
        protonup-qt
        steamtinkerlaunch
        prismlauncher
        mudlet
        gamescope
        gamemode
        r2modman
        vintagestory
      ]
      else []
    )
    ++ (
      if config.module.os-gaming.enable
      then [
        widelands
        wesnoth
        ufoai
        cataclysm-dda
        redeclipse
        megaglest
        # savagexr if it existed
        superTuxKart
        # openra but it's insecure
        openttd
        xonotic
        supermariowar
      ]
      else []
    )
    ++ (
      if config.module.hobbies.enable
      then [
        python312Packages.meshtastic
        brewtarget
        krita
        pureref
      ]
      else []
    );
}
