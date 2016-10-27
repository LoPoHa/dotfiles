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
		];

	nixpkgs.config.allowUnfree = true;

	# Generate a copy of the config file
	system.copySystemConfiguration = true;

	# Use the gummiboot efi boot loader.
	boot.loader.systemd-boot.enable = true;

	networking.hostName = "direx"; # Define your hostname.
	networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
	networking.firewall.enable = true;

	# Select internationalisation properties.
	i18n = {
		consoleFont = "Lat2-Terminus16";
		consoleKeyMap = "us";
		defaultLocale = "en_US.UTF-8";
	};

	# Set your time zone.
	time.timeZone = "Europe/Berlin";

	# List packages installed in system profile. To search by name, run:
	# $ nix-env -qaP | grep wget
	environment.systemPackages = with pkgs; [
		termite
		keepassx2
		p7zip
		htop
		gnupg
		google-drive-ocamlfuse
		krita
		chromium
		blender
		hakuneko
	];

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	# services.openssh.enable = true;

	# Enable CUPS to print documents.
	# services.printing.enable = true;

	#pulseaudio
	hardware.pulseaudio.enable = true;

  	# notebook specific
	powerManagement.enable = true;
	services.dbus.enable = true;
	services.upower.enable = true;
}
