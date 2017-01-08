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
	services.xserver = {
        enable = true;
        layout = "us";
        xkbOptions = "eurosign:e,caps:escape";

        # i3
        windowManager.i3.enable = true;
    };  
}
