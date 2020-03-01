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

# games
            ./nix_configs/games.nix

# sudo
            ./nix_configs/sudo.nix
			
# shell
	    ./nix_configs/shell.nix

# latex
            #./nix_configs/latex.nix

# users
            ./nix_configs/users.nix

# media
            ./nix_configs/media.nix

# music
            #./nix_configs/music.nix


# development
            ./nix_configs/development.nix

# fonts
            ./nix_configs/fonts.nix

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
    networking.wireless.enable = true;
    networking.firewall.enable = true;
    #networking.firewall.allowedTCPPortRanges = [ { from = 80; to = 80; } ];
    networking.nameservers = ["1.1.1.1" "9.9.9.9"];

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
    #networking.useDHCP = true;
    #networking.interfaces.enp4s0.useDHCP = true;

    sound.enable = true;

# Select internationalisation properties.
    console.font = "inconsolata";
    i18n = {
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
        chromium
        ripgrep
        file
        alsaUtils
        pciutils
        exa
        pdftk
        gnupg
        kdeApplications.kgpg
        zlib
        #(import ./nix_configs/emacs.nix { inherit pkgs; })
        exfat
        usbutils
        kitty
        krita
        inkscape
        riot-desktop
        #discord
        obs-studio
        #appimage-run
        gimp
        vulkan-tools
        gscan2pdf
        scantailor
        skanlite
        xsane
        unpaper
        (wine.override { wineBuild = "wine64"; })
        goxel
        blender
        zlib
        discord
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
            driSupport = true;
            driSupport32Bit = true;
            enable = true;
            extraPackages = with pkgs; [
                vaapiVdpau
                libvdpau-va-gl
            ];
        };
        pulseaudio = {
            enable = true;
            package = pkgs.pulseaudioFull;
            support32Bit = true;
        };
        # scanner
        sane = {
            enable = true;
            extraBackends = [ pkgs.utsushi ];
        };
    };

    services.udev.packages = [ pkgs.utsushi ];

# japanese input
    i18n.inputMethod = {
        enabled = "ibus";
        ibus.engines = with pkgs.ibus-engines; [ anthy ];
    };

    programs.ssh.startAgent = true;
    programs.adb.enable = true;

    services.dbus.enable = true;

    system.stateVersion = "unstable";
    system.autoUpgrade.enable = true;
}                        
