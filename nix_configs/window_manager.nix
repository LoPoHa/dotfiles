{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		# bspwm
		#xtitle
		#sutils
		#xdo
		#lemonbar
		#sxhkd
		#rofi
		kdeconnect
		kontact
		colord-kde

		# X11 required:
		feh
		compton
	];

	# Enable the X11 windowing system.
	services.xserver = {
        enable = true;
        layout = "us";
        xkbOptions = "eurosign:e,caps:escape";

        #windowManager.bspwm.enable = true;

        displayManager.sddm.enable = true;
        desktopManager.plasma5.enable = true;
    };  
    services.colord.enable = true;
}
