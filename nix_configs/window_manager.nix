{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		# bspwm
		xtitle
		sutils
		xdo
		lemonbar
		sxhkd
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

        # bspwm
        windowManager.bspwm.enable = true;
    };  
}
