{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		imv
		mpv
		cmus
		zathura
		youtube-dl
		kdenlive
	];
}
