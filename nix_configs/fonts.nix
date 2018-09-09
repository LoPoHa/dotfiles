{ config, pkgs, ... }:
{
	fonts = {
		enableFontDir = true;
		enableGhostscriptFonts = true;
		fonts = with pkgs; [
			meslo-lg
			font-droid
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
