{ config, pkgs, ... }:
{
    
	environment.systemPackages = with pkgs; [
		steam
		#winetricks
		#(wine.override { wineBuild = "wineWow"; })
	];
}
