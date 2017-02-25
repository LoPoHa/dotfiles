# Edit this configuration file to define what should be installed on
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

			# users
			./nix_configs/users.nix

			# media
			./nix_configs/media.nix

			# communication
			./nix_configs/communication.nix
			
			# development
			./nix_configs/development.nix

			# fonts
			./nix_configs/fonts.nix
			
			# 3d printer
			./nix_configs/3dprinter.nix
		];

	nixpkgs.config.allowUnfree = true;

	# Generate a copy of the config file
    boot.initrd.luks.devices = [
    {
        name="root";
        device="/dev/sda2";
        preLVM = true;
    }
	];
	system.copySystemConfiguration = true;
    boot.loader.efi.canTouchEfiVariables = true;

	# Use the gummiboot efi boot loader.
	boot.loader.systemd-boot.enable = true;

	networking.hostName = "direx"; # Define your hostname.
	networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
	networking.firewall.enable = true;

	
	# Select internationalisation properties.
	i18n = {
		consoleFont = "inconsolata";
		defaultLocale = "en_US.UTF-8";
	};

	# Set your time zone.
	time.timeZone = "Europe/Berlin";
	
    nixpkgs.config.firefox = {
        enableGoogleTalkPlugin = true;
    };

	# List packages installed in system profile. To search by name, run:
	# $ nix-env -qaP | grep wget
	environment.systemPackages = with pkgs; [
	    zip
	    unzip
		termite
		keepassx2
		htop
		google-drive-ocamlfuse
		firefox 
		hakuneko
		blender
		mesa
	];

	
	hardware = {
		bumblebee = {
			connectDisplay = true;
			enable = true;
		};
		cpu.intel.updateMicrocode = true;
		opengl = {
			driSupport32Bit = true;
			extraPackages = with pkgs; [ vaapiIntel ];
		};
		pulseaudio = {
			enable = true;
			# systemWide = false;
			support32Bit = true;
		};
	};

	# touchpad
	services.xserver.synaptics = {
		enable = true;
		twoFingerScroll = true;
	};


	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	# services.openssh.enable = true;

	# Enable CUPS to print documents.
	# services.printing.enable = true;

  	# notebook specific
	powerManagement.enable = true;
	services.dbus.enable = true;
	services.upower.enable = true;
}                        
