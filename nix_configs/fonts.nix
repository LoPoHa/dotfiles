{ config, pkgs, ... }:
{
	fonts = {
		enableFontDir = true;
		enableGhostscriptFonts = true;
		fonts = with pkgs; [
		    hasklig
			meslo-lg
			powerline-fonts
			font-awesome-ttf
			inconsolata
			source-code-pro
			fira-code
			source-han-sans-japanese
		];
		fontconfig = {
			defaultFonts = {
				monospace = [ "Source Code Pro" ];
				sansSerif = [ "Source Code Pro" ];
				serif     = [ "Source Code Pro" ];
			};
		};
	};
}
