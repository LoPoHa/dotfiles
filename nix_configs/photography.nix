{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
	    darktable
	    gimp
	    displaycal
	];
	services.udev = {
	    extraRules = ''
	    '';
	};
}
