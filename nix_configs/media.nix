{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		imv
		mpv
		#smplayer
		cmus
		#zathura
		okular
		youtube-dl
		#kdenlive
		#scanner
		#gscan2pdf
		simple-scan
		skanlite
	    tesseract
	    imagemagick
	];
}
