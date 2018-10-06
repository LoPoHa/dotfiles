{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		imv
		mpv
		cmus
		#zathura
		okular
		youtube-dl
		kdenlive
		#scanner
		skanlite
	];
}
