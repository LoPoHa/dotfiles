{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		imv
		mpv
		#smplayer
		clementine
		zathura
		#okular
		youtube-dl
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
