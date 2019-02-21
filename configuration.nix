# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
    imports =
        [
# Include the results of the hardware scan.
        ./hardware-configuration.nix

# neovim
            ./nix_configs/neovim.nix

# window manger
            ./nix_configs/window_manager.nix

# shell
            ./nix_configs/shell.nix

# games
            ./nix_configs/games.nix

# sudo
            ./nix_configs/sudo.nix

# latex
#./nix_configs/latex.nix

# users
            ./nix_configs/users.nix

# media
            ./nix_configs/media.nix

# communication
#./nix_configs/communication.nix

# development
            ./nix_configs/development.nix

# fonts
            ./nix_configs/fonts.nix

# 3d printer
#./nix_configs/3dprinter.nix

# music
            #./nix_configs/music.nix

# photography
            ./nix_configs/photography.nix
            ];

    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.security.setuiPrograms = [ "fusermount" "mount" "umount" ];
    nixpkgs.config.glibc.installLocales = true;

# Generate a copy of the config file
    system.copySystemConfiguration = true;
    boot.loader.efi.canTouchEfiVariables = true;

# Use the gummiboot efi boot loader.
    boot.loader.systemd-boot.enable = true;

# Define your hostname.
    networking.hostName = "Noragami";
# Enables wireless support via wpa_supplicant. 
#networking.wireless.enable = true;
    networking.firewall.enable = true;
    #networking.firewall.allowedTCPPortRanges = [ { from = 80; to = 80; } ];


# Select internationalisation properties.
    i18n = {
        consoleFont = "inconsolata";
        defaultLocale = "en_US.UTF-8";
    };

# Set your time zone.
    time.timeZone = "Europe/Berlin";

# List packages installed in system profile. To search by name, run:
# $ nix-env -qaP | grep wget
    environment.systemPackages = with pkgs; [
        zip
        unzip
        keepassx2
        htop
        google-drive-ocamlfuse
        firefox
        ripgrep
        file
        alsaUtils
        pciutils
        exa
        pdftk
        gnupg
        kdeApplications.kgpg
        zlib
        i2pd
        (import ./nix_configs/emacs.nix { inherit pkgs; })
        exfat
        usbutils
    ];



# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Enable CUPS to print documents.
# services.printing.enable = true;

# notebook specific
# powerManagement.enable = true;

    hardware = {
        opengl = {
            driSupport32Bit = true;
        };
        pulseaudio = {
            enable = true;
            package = pkgs.pulseaudioFull;
            support32Bit = true;
        };
        # scanner
        sane = {
            enable = true;
        };
    };

# japanese input
    i18n.inputMethod = {
        enabled = "ibus";
        ibus.engines = with pkgs.ibus-engines; [ anthy ];
    };



    services.dbus.enable = true;
    services.upower.enable = true;

    system.stateVersion = "unstable";
    system.autoUpgrade.enable = true;
}                        
