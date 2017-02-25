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
		];
		fontconfig = {
			defaultFonts = {
				monospace = [ "inconsolata" ];
				sansSerif = [ "inconsolata" ];
				serif     = [ "inconsolata" ];
			};
		};
	};
}
