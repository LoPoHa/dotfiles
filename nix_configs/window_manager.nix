{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		# i3
		i3lock
		i3status
		rofi

		# X11 required:
		feh
		compton
	];

	# Enable the X11 windowing system.
	services.xserver.enable = true;
	services.xserver.layout = "us";
	services.xserver.xkbOptions = "eurosign:e";

	# Enable the KDE Desktop Environment.
	# services.xserver.displayManager.kdm.enable = true;
	# services.xserver.desktopManager.kde4.enable = true;

	# i3
	services.xserver.windowManager.i3.enable = true;
}
