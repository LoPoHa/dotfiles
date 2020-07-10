{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		imv
		mpv
		#smplayer
		clementine
		zathura
		okular
		#kdenlive
		#scanner
		#gscan2pdf
		simple-scan
		skanlite
	    tesseract4
	    imagemagick
	    libreoffice
	];
}
