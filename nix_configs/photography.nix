{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
	    darktable
	    rawtherapee
	    #gimp
	    displaycal
	    geeqie
	];
	services.udev = {
	    extraRules = ''
	    '';
	};
}
