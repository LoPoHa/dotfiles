{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
	    feh
	    compton
	    spectacle
	];

    # Enable the X11 windowing system.
    services.xserver = {
        enable = true;
        layout = "us";
        xkbOptions = "eurosign:e,caps:escape";
        displayManager.sddm.enable = true;
        desktopManager.plasma5.enable = true;
    };
}
