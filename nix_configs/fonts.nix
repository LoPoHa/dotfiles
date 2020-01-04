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
			gohufont
			#nerdfonts # find actual pkgs you use fonts from ...
			opensans-ttf
			siji
		];
		fontconfig = {
			defaultFonts = {
				monospace = [ "Fira Code" ];
				sansSerif = [ "Fira Code" ];
				serif     = [ "Fira Code" ];
			};
		};
	};
}
