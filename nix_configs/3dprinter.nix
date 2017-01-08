{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		slic3r
	];
}
