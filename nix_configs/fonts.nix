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
	};
}
