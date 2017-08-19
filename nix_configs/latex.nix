{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		texlive.combined.scheme-basic
	];
}
