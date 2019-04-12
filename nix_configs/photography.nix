{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
	    darktable
	    gimp
	    displaycal
	    geeqie
	];
	services.udev = {
	    extraRules = ''
	    '';
	};
}
